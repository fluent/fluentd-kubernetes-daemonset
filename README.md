# Fluentd Daemonset for Kubernetes

[![Docker Stars](https://img.shields.io/docker/stars/fluent/fluentd-kubernetes-daemonset.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset)
[![Docker Pulls](https://img.shields.io/docker/pulls/fluent/fluentd-kubernetes-daemonset.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset)
[![ImageLayers Size](https://img.shields.io/imagelayers/image-size/fluent/fluentd-kubernetes-daemonset/latest.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset)
[![ImageLayers Layers](https://img.shields.io/imagelayers/layers/fluent/fluentd-kubernetes-daemonset/latest.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset)

## Supported tags and respective `Dockerfile` links


### Debian

- `v0.12-debian-elasticsearch` [(v0.12/debian-elasticsearch/Dockerfile)][debian-elasticsearch-dockerfile]
- `v0.12-debian-loggly` [(v0.12/debian-loggly/Dockerfile)][debian-loggly-dockerfile]
- `v0.12-debian-logentries` [(v0.12/debian-logentries/Dockerfile)][debian-logentries-dockerfile]
- `v0.12-debian-cloudwatch` [(v0.12/debian-cloudwatch/Dockerfile)][debian-cloudwatch-dockerfile]
- `v0.12-debian-stackdriver` [(v0.12/debian-stackdriver/Dockerfile)][debian-stackdriver-dockerfile]
- `v0.12-debian-s3` [(v0.12/debian-s3/Dockerfile)][debian-s3-dockerfile]
- `v0.12-debian-gcs` [(v0.12/debian-gcs/Dockerfile)][debian-gcs-dockerfile]
- `v0.12-debian-papertrail` [(v0.12/debian-papertrail/Dockerfile)][debian-papertrail-dockerfile]
- `v0.12-debian-syslog` [(v0.12/debian-syslog/Dockerfile)][debian-syslog-dockerfile]
- `v0.12-debian-graylog` [(v0.12/debian-graylog/Dockerfile)][debian-graylog-dockerfile]
- `v0.12-debian-logzio` [(v0.12/debian-logzio/Dockerfile)][debian-logzio-dockerfile]
- `v0.12-debian-kafka` [(v0.12/debian-kafka/Dockerfile)][debian-kafka-dockerfile]
- `v1.1-debian-elasticsearch` [(v1.1/debian-elasticsearch/Dockerfile)][debian-elasticsearch-dockerfile]
- `v1.1-debian-loggly` [(v1.1/debian-loggly/Dockerfile)][debian-loggly-dockerfile]
- `v1.1-debian-logentries` [(v1.1/debian-logentries/Dockerfile)][debian-logentries-dockerfile]
- `v1.1-debian-cloudwatch` [(v1.1/debian-cloudwatch/Dockerfile)][debian-cloudwatch-dockerfile]
- `v1.1-debian-stackdriver` [(v1.1/debian-stackdriver/Dockerfile)][debian-stackdriver-dockerfile]
- `v1.1-debian-s3` [(v1.1/debian-s3/Dockerfile)][debian-s3-dockerfile]
- `v1.1-debian-syslog` [(v1.1/debian-syslog/Dockerfile)][debian-syslog-dockerfile]
- `v1.1-debian-gcs` [(v1.1/debian-gcs/Dockerfile)][debian-gcs-dockerfile]
- `v1.1-debian-graylog` [(v1.1/debian-graylog/Dockerfile)][debian-graylog-dockerfile]
- `v1.1-debian-papertrail` [(v1.1/debian-papertrail/Dockerfile)][debian-papertrail-dockerfile]
- `v1.1-debian-logzio` [(v1.1/debian-logzio/Dockerfile)][debian-logzio-dockerfile]
- `v1.1-debian-kafka` [(v1.1/debian-kafka/Dockerfile)][debian-kafka-dockerfile]

### Alpine Linux

- `v0.12-alpine-elasticsearch` [(v0.12/alpine-elasticsearch/Dockerfile)][alpine-elasticsearch-dockerfile]
- `v0.12-alpine-loggly` [(v0.12/alpine-loggly/Dockerfile)][alpine-loggly-dockerfile]
- `v0.12-alpine-logentries` [(v0.12/alpine-logentries/Dockerfile)][alpine-logentries-dockerfile]
- `v0.12-alpine-cloudwatch` [(v0.12/alpine-cloudwatch/Dockerfile)][alpine-cloudwatch-dockerfile]
- `v0.12-alpine-stackdriver` [(v0.12/alpine-stackdriver/Dockerfile)][alpine-stackdriver-dockerfile]
- `v0.12-alpine-s3` [(v0.12/alpine-s3/Dockerfile)][alpine-s3-dockerfile]
- `v0.12-alpine-gcs` [(v0.12/alpine-gcs/Dockerfile)][alpine-gcs-dockerfile]
- `v0.12-alpine-papertrail` [(v0.12/alpine-papertrail/Dockerfile)][alpine-papertrail-dockerfile]
- `v0.12-alpine-syslog` [(v0.12/alpine-syslog/Dockerfile)][alpine-syslog-dockerfile]
- `v0.12-alpine-graylog` [(v0.12/alpine-graylog/Dockerfile)][alpine-graylog-dockerfile]
- `v0.12-alpine-logzio` [(v0.12/alpine-logzio/Dockerfile)][alpine-logzio-dockerfile]
- `v0.12-alpine-kafka` [(v0.12/alpine-kafka/Dockerfile)][alpine-kafka-dockerfile]

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
