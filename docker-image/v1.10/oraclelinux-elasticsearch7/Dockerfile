# Copyright (C) 2020, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

ARG FLUENTD_IMG
FROM $FLUENTD_IMG

LABEL maintainer="Verrazzano developers <verrazzano_ww@oracle.com>"
USER root
WORKDIR /home/fluent
ENV PATH /fluentd/vendor/bundle/ruby/2.6.0/bin:$PATH
ENV GEM_PATH /fluentd/vendor/bundle/ruby/2.6.0
ENV GEM_HOME /fluentd/vendor/bundle/ruby/2.6.0
# skip runtime bundler installation
ENV FLUENTD_DISABLE_BUNDLER_INJECTION 1

COPY docker-image/v1.10/oraclelinux-elasticsearch7/Gemfile /fluentd/
COPY docker-image/v1.10/oraclelinux-elasticsearch7/Gemfile.lock /fluentd/
RUN buildDeps="sudo make gcc g++ libc-dev libffi-dev" \
  runtimeDeps="" \
    && yum -y update \
    && yum-config-manager --save --setopt=ol7_ociyum_config.skip_if_unavailable=true \
    && yum install -y \
    $buildDeps $runtimeDeps net-tools \
    && yum clean all \
    && gem install bundler --version 2.1.4 \
    && bundle config silence_root_warning true \
    && bundle install --gemfile=/fluentd/Gemfile --path=/fluentd/vendor/bundle \
    && SUDO_FORCE_REMOVE=yes \
    && gem sources --clear-all \
    && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem  

# Copy configuration files
COPY docker-image/v1.10/oraclelinux-elasticsearch7/conf/fluent.conf /fluentd/etc/
COPY docker-image/v1.10/oraclelinux-elasticsearch7/conf/systemd.conf /fluentd/etc/
COPY docker-image/v1.10/oraclelinux-elasticsearch7/conf/kubernetes.conf /fluentd/etc/
COPY docker-image/v1.10/oraclelinux-elasticsearch7/conf/prometheus.conf /fluentd/etc/
RUN touch /fluentd/etc/disable.conf

# Copy plugins
COPY docker-image/v1.10/oraclelinux-elasticsearch7/plugins /fluentd/plugins/
COPY docker-image/v1.10/oraclelinux-elasticsearch7/entrypoint.sh /fluentd/entrypoint.sh

# COPY LICENSE and README files to the image
COPY LICENSE README.md /license/ 

# Environment variables
ENV FLUENTD_OPT=""
ENV FLUENTD_CONF="fluent.conf"

# Overwrite ENTRYPOINT to run fluentd as root for /var/log / /var/lib
ENTRYPOINT ["tini", "--", "/fluentd/entrypoint.sh"]
