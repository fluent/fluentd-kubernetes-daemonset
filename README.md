# Fluentd Daemonset for Kubernetes

[![Docker Stars](https://img.shields.io/docker/stars/fluent/fluentd-kubernetes-daemonset.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset)
[![Docker Pulls](https://img.shields.io/docker/pulls/fluent/fluentd-kubernetes-daemonset.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset)
[![ImageLayers Size](https://img.shields.io/imagelayers/image-size/fluent/fluentd-kubernetes-daemonset/latest.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset)
[![ImageLayers Layers](https://img.shields.io/imagelayers/layers/fluent/fluentd-kubernetes-daemonset/latest.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset)

## Supported tags and respective `Dockerfile` links

See also dockerhub tags page: https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset/tags

### Debian

#### Current stable

- `v1.7.4-debian-elasticsearch7-1.1,v1.7-debian-elasticsearch7-1,v1-debian-elasticsearch` [docker-image/v1.7/debian-elasticsearch7/Dockerfile](docker-image/v1.7/debian-elasticsearch7/Dockerfile)
- `v1.7.4-debian-elasticsearch6-1.1,v1.7-debian-elasticsearch6-1` [docker-image/v1.7/debian-elasticsearch6/Dockerfile](docker-image/v1.7/debian-elasticsearch6/Dockerfile)
- `v1.7.4-debian-loggly-1.1,v1.7-debian-loggly-1` [docker-image/v1.7/debian-loggly/Dockerfile](docker-image/v1.7/debian-loggly/Dockerfile)
- `v1.7.4-debian-logentries-1.1,v1.7-debian-logentries-1` [docker-image/v1.7/debian-logentries/Dockerfile](docker-image/v1.7/debian-logentries/Dockerfile)
- `v1.7.4-debian-cloudwatch-1.1,v1.7-debian-cloudwatch-1` [docker-image/v1.7/debian-cloudwatch/Dockerfile](docker-image/v1.7/debian-cloudwatch/Dockerfile)
- `v1.7.4-debian-stackdriver-1.1,v1.7-debian-stackdriver-1` [docker-image/v1.7/debian-stackdriver/Dockerfile](docker-image/v1.7/debian-stackdriver/Dockerfile)
- `v1.7.4-debian-s3-1.1,v1.7-debian-s3-1` [docker-image/v1.7/debian-s3/Dockerfile](docker-image/v1.7/debian-s3/Dockerfile)
- `v1.7.4-debian-syslog-1.1,v1.7-debian-syslog-1` [docker-image/v1.7/debian-syslog/Dockerfile](docker-image/v1.7/debian-syslog/Dockerfile)
- `v1.7.4-debian-forward-1.1,v1.7-debian-forward-1` [docker-image/v1.7/debian-forward/Dockerfile](docker-image/v1.7/debian-forward/Dockerfile)
- `v1.7.4-debian-gcs-1.1,v1.7-debian-gcs-1` [docker-image/v1.7/debian-gcs/Dockerfile](docker-image/v1.7/debian-gcs/Dockerfile)
- `v1.7.4-debian-graylog-1.1,v1.7-debian-graylog-1` [docker-image/v1.7/debian-graylog/Dockerfile](docker-image/v1.7/debian-graylog/Dockerfile)
- `v1.7.4-debian-papertrail-1.1,v1.7-debian-papertrail-1` [docker-image/v1.7/debian-papertrail/Dockerfile](docker-image/v1.7/debian-papertrail/Dockerfile)
- `v1.7.4-debian-logzio-1.1,v1.7-debian-logzio-1` [docker-image/v1.7/debian-logzio/Dockerfile](docker-image/v1.7/debian-logzio/Dockerfile)
- `v1.7.4-debian-kafka-1.1,v1.7-debian-kafka-1` [docker-image/v1.7/debian-kafka/Dockerfile](docker-image/v1.7/debian-kafka/Dockerfile)
- `v1.7.4-debian-kinesis-1.1,v1.7-debian-kinesis-1` [docker-image/v1.7/debian-kinesis/Dockerfile](docker-image/v1.7/debian-kinesis/Dockerfile)

You can also use `v1-debian-PLUGIN` tag to refer latest v1 image, e.g. `v1-debian-elasticsearch`. On production, strict tag is better to avoid unexpected update.

See dockerhub's tags page for older tags.

#### Old stable

- `v0.12-debian-elasticsearch` [docker-image/v0.12/debian-elasticsearch/Dockerfile](docker-image/v0.12/debian-elasticsearch/Dockerfile)
- `v0.12-debian-loggly` [docker-image/v0.12/debian-loggly/Dockerfile](docker-image/v0.12/debian-loggly/Dockerfile)
- `v0.12-debian-logentries` [docker-image/v0.12/debian-logentries/Dockerfile](docker-image/v0.12/debian-logentries/Dockerfile)
- `v0.12-debian-cloudwatch` [docker-image/v0.12/debian-cloudwatch/Dockerfile](docker-image/v0.12/debian-cloudwatch/Dockerfile)
- `v0.12-debian-stackdriver` [docker-image/v0.12/debian-stackdriver/Dockerfile](docker-image/v0.12/debian-stackdriver/Dockerfile)
- `v0.12-debian-s3` [docker-image/v0.12/debian-s3/Dockerfile](docker-image/v0.12/debian-s3/Dockerfile)
- `v0.12-debian-gcs` [docker-image/v0.12/debian-gcs/Dockerfile](docker-image/v0.12/debian-gcs/Dockerfile)
- `v0.12-debian-papertrail` [docker-image/v0.12/debian-papertrail/Dockerfile](docker-image/v0.12/debian-papertrail/Dockerfile)
- `v0.12-debian-syslog` [docker-image/v0.12/debian-syslog/Dockerfile](docker-image/v0.12/debian-syslog/Dockerfile)
- `v0.12-debian-graylog` [docker-image/v0.12/debian-graylog/Dockerfile](docker-image/v0.12/debian-graylog/Dockerfile)
- `v0.12-debian-logzio` [docker-image/v0.12/debian-logzio/Dockerfile](docker-image/v0.12/debian-logzio/Dockerfile)
- `v0.12-debian-kafka` [docker-image/v0.12/debian-kafka/Dockerfile](docker-image/v0.12/debian-kafka/Dockerfile)
- `v0.12-debian-splunkhec` [docker-image/v0.12/debian-splunkhec/Dockerfile](docker-image/v0.12/debian-splunkhec/Dockerfile)
- `v0.12-debian-kinesis` [docker-image/v0.12/debian-kinesis/Dockerfile](docker-image/v0.12/debian-kinesis/Dockerfile)

### Alpine Linux (This is deprecated. Use Debian images instead)

- `v0.12-alpine-elasticsearch` [docker-image/v0.12/alpine-elasticsearch/Dockerfile](docker-image/v0.12/alpine-elasticsearch/Dockerfile)
- `v0.12-alpine-loggly` [docker-image/v0.12/alpine-loggly/Dockerfile](docker-image/v0.12/alpine-loggly/Dockerfile)
- `v0.12-alpine-logentries` [docker-image/v0.12/alpine-logentries/Dockerfile](docker-image/v0.12/alpine-logentries/Dockerfile)
- `v0.12-alpine-cloudwatch` [docker-image/v0.12/alpine-cloudwatch/Dockerfile](docker-image/v0.12/alpine-cloudwatch/Dockerfile)
- `v0.12-alpine-stackdriver` [docker-image/v0.12/alpine-stackdriver/Dockerfile](docker-image/v0.12/alpine-stackdriver/Dockerfile)
- `v0.12-alpine-s3` [docker-image/v0.12/alpine-s3/Dockerfile](docker-image/v0.12/alpine-s3/Dockerfile)
- `v0.12-alpine-gcs` [docker-image/v0.12/alpine-gcs/Dockerfile](docker-image/v0.12/alpine-gcs/Dockerfile)
- `v0.12-alpine-papertrail` [docker-image/v0.12/alpine-papertrail/Dockerfile](docker-image/v0.12/alpine-papertrail/Dockerfile)
- `v0.12-alpine-syslog` [docker-image/v0.12/alpine-syslog/Dockerfile](docker-image/v0.12/alpine-syslog/Dockerfile)
- `v0.12-alpine-graylog` [docker-image/v0.12/alpine-graylog/Dockerfile](docker-image/v0.12/alpine-graylog/Dockerfile)
- `v0.12-alpine-logzio` [docker-image/v0.12/alpine-logzio/Dockerfile](docker-image/v0.12/alpine-logzio/Dockerfile)
- `v0.12-alpine-kafka` [docker-image/v0.12/alpine-kafka/Dockerfile](docker-image/v0.12/alpine-kafka/Dockerfile)
- `v0.12-alpine-kinesis` [docker-image/v0.12/alpine-kinesis/Dockerfile](docker-image/v0.12/alpine-kinesis/Dockerfile)
- `v0.12-alpine-splunkhec` [docker-image/v0.12/alpine-splunkhec/Dockerfile](docker-image/v0.12/alpine-splunkhec/Dockerfile)

## What is Fluentd?

![Fluentd Logo](http://www.fluentd.org/assets/img/miscellany/fluentd-logo.png)

Fluentd is an open source data collector, which lets you unify the data
collection and consumption for a better use and understanding of data.

> [www.fluentd.org](http://www.fluentd.org/)


## Image versions

Fluentd versioning is as follows:

| Series | Description                         |
|--------|-------------------------------------|
| v1.x   | current stable |
| v0.12  | Old stable, no longer updated |

## Settings

### Default image version

Default YAML uses latest v1 images like `fluent/fluentd-kubernetes-daemonset:v1-debian-kafka`. If you want to avoid unexpected image update, specify exact version for `image` like `fluent/fluentd-kubernetes-daemonset:v1.7.0-debian-kafka-1.1`.

### Run as root

This is for v0.12 images.

In Kubernetes and default setting, fluentd needs root permission to read logs in `/var/log` and write `pos_file` to `/var/log`.
To avoid permission error, you need to set `FLUENT_UID` environment variable to `0` in your Kubernetes configuration.

### Use your configuration

These images have default configuration and support some environment variables for parameters
but it sometimes doesn't fit your case. If you want to use your configuration, use ConfigMap feature.

### Disable systemd input

If you don't setup systemd in the container, fluentd shows following messages by default configuration.

```
[warn]: #0 [in_systemd_bootkube] Systemd::JournalError: No such file or directory retrying in 1s
[warn]: #0 [in_systemd_kubelet] Systemd::JournalError: No such file or directory retrying in 1s
[warn]: #0 [in_systemd_docker] Systemd::JournalError: No such file or directory retrying in 1s
```

You can suppress these messages by setting `disable` to `FLUENTD_SYSTEMD_CONF` environment variable in your kubernetes configuration.

### Disable prometheus input plugins

By default, latest images launch `prometheus` plugins to monitor fluentd.
You can disable prometheus input plugin by setting `disable` to `FLUENTD_PROMETHEUS_CONF` environment variable in your kubernetes configuration.

### Disable sed execution on elasticsearch image

By historical reason, elasaticsearch image executes `sed` command during startup phase when `FLUENT_ELASTICSEARCH_USER` or `FLUENT_ELASTICSEARCH_PASSWORD` is specified. This sometimes causes a problem with read only mount.
To avoid this problem, set "true" to `FLUENT_ELASTICSEARCH_SED_DISABLE` environment variable in your kubernetes configuration.

### Running on OpenShift

This daemonset setting mounts `/var/log` as service account `fluentd` so you need to run containers as privileged container.
Here is command example:

```
oc project kube-system
oc create -f https://raw.githubusercontent.com/fluent/fluentd-kubernetes-daemonset/master/fluentd-daemonset-elasticsearch-rbac.yaml
oc adm policy add-scc-to-user privileged -z fluentd
oc patch ds fluentd -p "spec:
  template:
    spec:
      containers:
      - name: fluentd
        securityContext:
          privileged: true"
oc delete pod -l k8s-app = fluentd-logging
```

This is from [nekop's japanese article](https://nekop.hatenablog.com/entry/2018/04/20/170257).

## Maintainers

Some images are contributed by users. If you have a problem/question for following images, ask it to contributors.

- cloudwatch : @so0k
- papertrail : @alexouzounis
- kafka : @erhudy
- graylog : @rtnpro
- gcs : @andor-pierdelacabeza
- Amazon Kinesis : @shiftky
- logz.io : @SaMnCo / @jamielennox
- splunkhec: @FutureSharks

### References

[Kubernetes Logging with Fluentd][fluentd-article]

## Issues

We can't notice comments in the DockerHub so don't use them for reporting
issues or asking question.

If you have any problems with or questions about this image, please contact us
through a [GitHub issue](https://github.com/fluent/fluentd-kubernetes-daemonset/issues).

## Pull Request

Update `templates` files instead of `docker-image` files.
`docker-image` files are automatically generated from `templates`.

_Note: This file is generated from [templates/README.md.erb](templates/README.md.erb)_

[alpine-home]: http://alpinelinux.org
[alpine-dockerhub]: https://hub.docker.com/_/alpine
[debian-dockerhub]: https://hub.docker.com/_/debian
[fluentd-article]: https://docs.fluentd.org/v/0.12/articles/kubernetes-fluentd
