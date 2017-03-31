# Usage: https://github.com/moriyoshi/fluent-plugin-logentries/tree/private-releases#configruation-file-yml
# compare: https://github.com/Woorank/fluent-plugin-logentries/compare/master...moriyoshi:private-releases
# or bigwheel: https://github.com/Woorank/fluent-plugin-logentries/compare/master...bigwheel:master

require 'socket'
require 'yaml'
require 'openssl'

class Fluent::LogentriesOutput < Fluent::BufferedOutput
  class ConnectionFailure < StandardError; end
  # First, register the plugin. NAME is the name of this plugin
  # and identifies the plugin in the configuration file.
  Fluent::Plugin.register_output('logentries', self)

  config_param :use_ssl,        :bool,    :default => true
  config_param :use_json,       :bool,    :default => false
  config_param :port,           :integer, :default => 20000
  config_param :protocol,       :string,  :default => 'tcp'
  config_param :config_path,    :string
  config_param :max_retries,    :integer, :default => 3
  config_param :app_name,       :string,  :default => %q(${record['app_name']})
  config_param :token_name,     :string,  :default => %q(${tag == @tag_access_log ? 'access': tag == @tag_error_log ? 'error': 'app'})
  config_param :tag_access_log, :string,  :default => 'logs-access'
  config_param :tag_error_log,  :string,  :default => 'logs-error'
  config_param :default_token,  :string,  :default => nil

  SSL_HOST    = "api.logentries.com"
  NO_SSL_HOST = "data.logentries.com"

  def configure(conf)
    super

    @tokens          = nil
    @last_edit       = Time.at(0)
    @app_name_expr   = DynamicExpander.new('app_name', @app_name)
    @token_name_expr = DynamicExpander.new('token_name', @token_name)
  end

  def start
    super
  end

  def shutdown
    super
  end

  def client
    @_socket ||= if @use_ssl
      context    = OpenSSL::SSL::SSLContext.new
      socket     = TCPSocket.new SSL_HOST, @port
      ssl_client = OpenSSL::SSL::SSLSocket.new socket, context

      ssl_client.connect
    else
      if @protocol == 'tcp'
        TCPSocket.new NO_SSL_HOST, @port
      else
        udp_client = UDPSocket.new
        udp_client.connect NO_SSL_HOST, @port

        udp_client
      end
    end
  end

  # This method is called when an event reaches Fluentd.
  def format(tag, time, record)
    return [tag, time, record].to_msgpack
  end

  # Parse an YML file and generate a list of tokens.
  # It will only re-generate the list on changes.
  def generate_tokens_list
    begin
      edit_time = File.mtime(@config_path)

      if edit_time > @last_edit
        @tokens    = YAML::load_file(@config_path)
        @last_edit = edit_time

        log.info "Token(s) list updated."
      end
    rescue Exception => e
      log.warn "Could not load configuration. #{e.message}"
    end
  end

  # Returns the correct token to use for a given tag / records
  def get_token(tag, time, record, tag_parts)
    app_name = @app_name_expr.expand(tag, time, record, tag_parts, self) || ''
    token_name = @token_name_expr.expand(tag, time, record, tag_parts, self)

    # Config Structure
    # -----------------------
    # app-name:
    #   app: TOKEN
    #   access: TOKEN (optional)
    #   error: TOKEN  (optional)
    return @tokens.each do |key, value|
      if app_name == key || tag.index(key) != nil
        break value[token_name] || value['app']
      end
    end || default_token
  end

  # NOTE! This method is called by internal thread, not Fluentd's main thread. So IO wait doesn't affect other plugins.
  def write(chunk)
    generate_tokens_list()
    return unless @tokens.is_a? Hash

    chunk.msgpack_each do |tag, time, record|
      next unless record.is_a? Hash
      next unless @use_json or record.has_key? "message"

      tag_parts = tag.split('.')

      token = get_token(tag, time, record, tag_parts)
      next if token.nil?

      # Clean up the string to avoid blank line in logentries
      message = @use_json ? record.to_json : record["message"].rstrip()
      send_logentries(token, message)
    end
  end

  def send_logentries(token, data)
    retries = 0
    begin
      client.write("#{token} #{data} \n")
    rescue Errno::ECONNREFUSED, Errno::ECONNRESET, Errno::ECONNABORTED, Errno::ETIMEDOUT, Errno::EPIPE, Errno::ENETUNREACH => e
      if retries < @max_retries
        retries += 1
        @_socket = nil
        log.warn "Could not push logs to Logentries, resetting connection and trying again. #{e.message}"
        sleep 5**retries
        retry
      end
      raise ConnectionFailure, "Could not push logs to Logentries after #{retries} retries. #{e.message}"
    rescue Errno::EMSGSIZE
      str_length = data.length
      send_logentries(token, data[0..str_length/2])
      send_logentries(token, data[(str_length/2)+1..str_length])

      log.warn "Message Too Long, re-sending it in two part..."
    end
  end

  # stolen from https://github.com/repeatedly/fluent-plugin-record-modifier
  class DynamicExpander
    def initialize(param_key, param_value)
      if param_value.include?('${')
        __str_eval_code__ = parse_parameter(param_value)

        # Use class_eval with string instead of define_method for performance.
        # It can't share instructions but this is 2x+ faster than define_method in filter case.
        # Refer: http://tenderlovemaking.com/2013/03/03/dynamic_method_definitions.html
        (class << self; self; end).class_eval <<-EORUBY,  __FILE__, __LINE__ + 1
          def expand(tag, time, record, tag_parts, outer)
            outer.instance_eval { #{__str_eval_code__} }
          end
        EORUBY
      else
        @param_value = param_value
      end

      begin
        # check eval genarates wrong code or not
        expand(nil, nil, nil, nil, nil)
      rescue SyntaxError
        raise ConfigError, "Pass invalid syntax parameter : key = #{param_key}, value = #{param_value}"
      rescue
        # Ignore other runtime errors
      end
    end

    # Default implementation for fixed value. This is overwritten when parameter contains '${xxx}' placeholder
    def expand(tag, time, record, tag_parts, outer)
      @param_value
    end

    private

    def parse_parameter(value)
      num_placeholders = value.scan('${').size
      if num_placeholders == 1
        if value.start_with?('${') && value.end_with?('}')
          return value[2..-2]
        else
          "\"#{value.gsub('${', '#{')}\""
        end
      else
        "\"#{value.gsub('${', '#{')}\""
      end
    end
  end
end
