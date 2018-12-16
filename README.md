# Fluentd Daemonset for Kubernetes

[![Docker Stars](https://img.shields.io/docker/stars/fluent/fluentd-kubernetes-daemonset.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset)
[![Docker Pulls](https://img.shields.io/docker/pulls/fluent/fluentd-kubernetes-daemonset.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset)
[![ImageLayers Size](https://img.shields.io/imagelayers/image-size/fluent/fluentd-kubernetes-daemonset/latest.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset)
[![ImageLayers Layers](https://img.shields.io/imagelayers/layers/fluent/fluentd-kubernetes-daemonset/latest.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset)

## Supported tags and respective `Dockerfile` links


### Debian

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
- `v1.3-debian-elasticsearch` [docker-image/v1.3/debian-elasticsearch/Dockerfile](docker-image/v1.3/debian-elasticsearch/Dockerfile)
- `v1.3-debian-loggly` [docker-image/v1.3/debian-loggly/Dockerfile](docker-image/v1.3/debian-loggly/Dockerfile)
- `v1.3-debian-logentries` [docker-image/v1.3/debian-logentries/Dockerfile](docker-image/v1.3/debian-logentries/Dockerfile)
- `v1.3-debian-cloudwatch` [docker-image/v1.3/debian-cloudwatch/Dockerfile](docker-image/v1.3/debian-cloudwatch/Dockerfile)
- `v1.3-debian-stackdriver` [docker-image/v1.3/debian-stackdriver/Dockerfile](docker-image/v1.3/debian-stackdriver/Dockerfile)
- `v1.3-debian-s3` [docker-image/v1.3/debian-s3/Dockerfile](docker-image/v1.3/debian-s3/Dockerfile)
- `v1.3-debian-syslog` [docker-image/v1.3/debian-syslog/Dockerfile](docker-image/v1.3/debian-syslog/Dockerfile)
- `v1.3-debian-gcs` [docker-image/v1.3/debian-gcs/Dockerfile](docker-image/v1.3/debian-gcs/Dockerfile)
- `v1.3-debian-graylog` [docker-image/v1.3/debian-graylog/Dockerfile](docker-image/v1.3/debian-graylog/Dockerfile)
- `v1.3-debian-papertrail` [docker-image/v1.3/debian-papertrail/Dockerfile](docker-image/v1.3/debian-papertrail/Dockerfile)
- `v1.3-debian-logzio` [docker-image/v1.3/debian-logzio/Dockerfile](docker-image/v1.3/debian-logzio/Dockerfile)
- `v1.3-debian-kafka` [docker-image/v1.3/debian-kafka/Dockerfile](docker-image/v1.3/debian-kafka/Dockerfile)
- `v1.3-debian-kinesis` [docker-image/v1.3/debian-kinesis/Dockerfile](docker-image/v1.3/debian-kinesis/Dockerfile)

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

The following repository expose images based on Alpine Linux and Debian. For production environments we strongly suggest to use Debian images.

Fluentd versioning is as follows:

| Series | Description                         |
|--------|-------------------------------------|
| v0.12  | Old stable, production ready        |
| v1.x   | stable |

## Settings

### Run as root

In Kubernetes and default setting, fluentd needs root permission to read logs in `/var/log` and write `pos_file` to `/var/log`.
To avoid permission error, you need to set `FLUENT_UID` environment variable to `0` in your Kubernetes configuration.

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

## Issues

We can't notice comments in the DockerHub so don't use them for reporting
issues or asking question.

If you have any problems with or questions about this image, please contact us
through a [GitHub issue](https://github.com/fluent/fluentd-kubernetes-daemonset/issues).

_Note: This file is generated from [templates/README.md.erb](templates/README.md.erb)_

[alpine-home]: http://alpinelinux.org
[alpine-dockerhub]: https://hub.docker.com/_/alpine
[debian-dockerhub]: https://hub.docker.com/_/debian
[fluentd-article]: http://docs.fluentd.org/v0.12/articles/kubernetes-fluentd
