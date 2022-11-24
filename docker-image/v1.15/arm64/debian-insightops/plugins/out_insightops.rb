require 'socket'
require 'yaml'
require 'openssl'
require 'net/http'
require 'json'
require 'thread'

class Fluent::InsightOpsOutput < Fluent::BufferedOutput
  class ConnectionFailure < StandardError; end

  Fluent::Plugin.register_output('insightops', self)

  INSIGHT_DATA_TEMPLATE = "%{region}.data.logs.insight.rapid7.com"
  INSIGHT_REST_TEMPLATE = "https://%{region}.rest.logs.insight.rapid7.com"
  INSIGHT_LOGSETS_TEMPLATE = "/management/logsets/%{logset_id}"
  THREAD_COUNT = 4

  config_param :use_ssl,       :bool,    :default => true
  config_param :use_json,      :bool,    :default => false
  config_param :port,          :integer, :default => 20000
  config_param :protocol,      :string,  :default => 'tcp'
  config_param :max_retries,   :integer, :default => 3
  config_param :tags,          :string,  :default => ''
  config_param :prefix,        :string,  :default => ''
  config_param :config_path

  def configure(conf)
    super
  end

  def start
    @api_key = get_value_from_conf('api_key')
    @log_name = get_value_from_conf('log_name') || 'default'
    @region = get_value_from_conf('region') || 'us'
    @logset_id = get_value_from_conf('logset_id')
    
    logsets_url = (INSIGHT_REST_TEMPLATE + INSIGHT_LOGSETS_TEMPLATE) % { :region => @region, :logset_id => @logset_id }
    @insight_tags = Hash[@tags.split(",").each_with_object(nil).to_a]
    logset_body = insight_rest_request(logsets_url)
    threads = []
    @tokens = Hash.new
    mutex = Mutex.new
    if logset_body.instance_of?(Hash) and logset_body.key?('logset')
      logset_info = logset_body['logset']
      if logset_info.key?('logs_info')
        logs_info = logset_info['logs_info']
        log_urls = logs_info.map { |log| log['links'][0]['href'] }
        THREAD_COUNT.times.map {
          Thread.new(log_urls, @tokens) do |urls, tokens|
            while url = mutex.synchronize { urls.pop }
              log_name, token = insight_log_token(url)
              mutex.synchronize { tokens[log_name] = token }
            end
          end
        }.each(&:join)
      else
        log.warn "No logs info found in logset response"
      end
    else
      log.warn "Logset emtity is empty"
    end
    super
  end

  def shutdown
    super
  end

  def get_value_from_conf(key_name)
    api_key_file = YAML::load_file(@config_path)
    api_key_file.each do |key, value|
      if key == key_name
        return value
      end
    end
    return nil
  end

  def insight_rest_request(url)
    uri = URI(url)
    request = Net::HTTP::Get.new(uri)
    request['content-type'] = 'application/json'
    request['x-api-key'] = @api_key
    response = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') {|http|
      http.request(request)
    }
    if response.code == "200"
      return JSON.parse(response.body)
    end
    log.error "Request was failed HTTP #{response.code}: \n#{response.body}"
  end

  def insight_log_token(url)
    log_body = insight_rest_request(url)
    if log_body.key?('log')
      log_info = log_body['log']
      if log_info.key?('tokens')
        log.info "Found log #{log_info['name']}"
        return log_info['name'], log_info['tokens'][0]
      else
        log.warn "Log is empty"
      end
    else
      log.warn "Response doesn't contain log info"
    end
  end

  def client
    insight_data_host = INSIGHT_DATA_TEMPLATE % { :region => @region }
    @_socket ||= if @use_ssl
      context    = OpenSSL::SSL::SSLContext.new
      socket     = TCPSocket.new insight_data_host, @port
      ssl_client = OpenSSL::SSL::SSLSocket.new socket, context
      ssl_client.connect
    else
      if @protocol == 'tcp'
        TCPSocket.new insight_data_host, @port
      else
        udp_client = UDPSocket.new
        udp_client.connect insight_data_host, @port
        udp_client
      end
    end
  end

  def format(tag, time, record)
    return [tag, time, record].to_msgpack
  end

  def write(chunk)
    return if @tokens.empty?
    chunk.msgpack_each do |(tag, time, record)|
      next unless record.is_a? Hash
      next unless @use_json or record.has_key? "message"
      message = @use_json ? record.to_json : record["message"].rstrip()
      next if message.empty?
      @insight_tags.each { |k,v|
        @insight_tags[k] = record[k]
      }
      symbolized_tags = @insight_tags.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      if @tokens.key?(@log_name)
        token = @tokens[@log_name]
        prefix = @prefix % symbolized_tags
        send_insight(token,  "#{prefix} #{message}")
      else
        log.debug "No token found for #{@log_name} and default log doesn't exist"
      end
    end
  end

  def send_insight(token, data)
    retries = 0
    begin
      client.write("#{token} #{data} \n")
    rescue Errno::EMSGSIZE
      str_length = data.length
      send_insight(token, data[0..str_length/2])
      send_insight(token, data[(str_length/2) + 1..str_length])
      log.warn "Message Too Long, re-sending it in two part..."
    rescue => e
      if retries < @max_retries
        retries += 1
        @_socket = nil
        log.warn "Could not push logs to Insight, resetting connection and trying again. #{e.message}"
        sleep 5**retries
        retry
      end
      raise ConnectionFailure, "Could not push logs to Insight after #{retries} retries. #{e.message}"
    end
  end
end