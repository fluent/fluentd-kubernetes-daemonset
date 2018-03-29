# Fluentd Daemonset for Kubernetes

[![Docker Stars](https://img.shields.io/docker/stars/fluent/fluentd-kubernetes-daemonset.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset)
[![Docker Pulls](https://img.shields.io/docker/pulls/fluent/fluentd-kubernetes-daemonset.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset)
[![ImageLayers Size](https://img.shields.io/imagelayers/image-size/fluent/fluentd-kubernetes-daemonset/latest.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset)
[![ImageLayers Layers](https://img.shields.io/imagelayers/layers/fluent/fluentd-kubernetes-daemonset/latest.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset)

## Supported tags and respective `Dockerfile` links

### Debian

- `v0.12-debian-cloudwatch` [(v0.12/debian-cloudwatch/Dockerfile)][debian-cloudwatch-dockerfile]
- `v0.12-debian-elasticsearch` [(v0.12/debian-elasticsearch/Dockerfile)][debian-elasticsearch-dockerfile]
- `v0.12-debian-kafka` [(v0.12/debian-kafka/Dockerfile)][debian-kafka-dockerfile]
- `v0.12-debian-logentries` [(v0.12/debian-logentries/Dockerfile)][debian-logentries-dockerfile]
- `v0.12-debian-loggly` [(v0.12/debian-loggly/Dockerfile)][debian-loggly-dockerfile]
- `v0.12-debian-s3` [(v0.12/debian-s3/Dockerfile)][debian-s3-dockerfile]
- `v0.12-debian-stackdriver` [(v0.12/debian-stackdriver/Dockerfile)][debian-stackdriver-dockerfile]
- `v0.12-debian-papertrail` [(v0.12/debian-papertrail/Dockerfile)][debian-papertrail-dockerfile]

### Alpine Linux

- `v0.12-alpine-cloudwatch` [(v0.12/alpine-cloudwatch/Dockerfile)][alpine-cloudwatch-dockerfile]
- `v0.12-alpine-elasticsearch` [(v0.12/alpine-elasticsearch/Dockerfile)][alpine-elasticsearch-dockerfile]
- `v0.12-alpine-kafka` [(v0.12/alpine-kafka/Dockerfile)][alpine-kafka-dockerfile]
- `v0.12-alpine-logentries` [(v0.12/alpine-logentries/Dockerfile)][alpine-logentries-dockerfile]
- `v0.12-alpine-loggly` [(v0.12/alpine-loggly/Dockerfile)][alpine-loggly-dockerfile]
- `v0.12-alpine-papertrail` [(v0.12/alpine-papertrail/Dockerfile)][alpine-papertrail-dockerfile]

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
| v0.12  | Stable, production ready            |
| v0.14  | Development, next stable (Q3 2017)  |

### References

[Kubernetes Logging with Fluentd][fluentd-article]

## Issues

We can't notice comments in the DockerHub so don't use them for reporting
issues or asking question.

If you have any problems with or questions about this image, please contact us
through a [GitHub issue](https://github.com/fluent/fluentd-kubernetes-daemonset/issues).

[alpine-home]: http://alpinelinux.org
[alpine-dockerhub]: https://hub.docker.com/_/alpine
[debian-dockerhub]: https://hub.docker.com/_/debian
[fluentd-article]: http://docs.fluentd.org/v0.12/articles/kubernetes-fluentd

[alpine-elasticsearch-dockerfile]: https://github.com/fluent/fluentd-kubernetes-daemonset/blob/master/docker-image/v0.12/alpine-elasticsearch/Dockerfile
[alpine-loggly-dockerfile]: https://github.com/fluent/fluentd-kubernetes-daemonset/blob/master/docker-image/v0.12/alpine-loggly/Dockerfile
[alpine-logentries-dockerfile]: https://github.com/fluent/fluentd-kubernetes-daemonset/blob/master/docker-image/v0.12/alpine-logentries/Dockerfile
[alpine-cloudwatch-dockerfile]: https://github.com/fluent/fluentd-kubernetes-daemonset/blob/master/docker-image/v0.12/alpine-cloudwatch/Dockerfile
[alpine-s3-dockerfile]: https://github.com/fluent/fluentd-kubernetes-daemonset/blob/master/docker-image/v0.12/alpine-s3/Dockerfile
[alpine-papertrail-dockerfile]: https://github.com/fluent/fluentd-kubernetes-daemonset/blob/master/docker-image/v0.12/alpine-papertrail/Dockerfile
[alpine-kafka-dockerfile]: https://github.com/fluent/fluentd-kubernetes-daemonset/blob/master/docker-image/v0.12/alpine-kafka/Dockerfile

[debian-elasticsearch-dockerfile]: https://github.com/fluent/fluentd-kubernetes-daemonset/blob/master/docker-image/v0.12/debian-elasticsearch/Dockerfile
[debian-loggly-dockerfile]: https://github.com/fluent/fluentd-kubernetes-daemonset/blob/master/docker-image/v0.12/debian-loggly/Dockerfile
[debian-logentries-dockerfile]: https://github.com/fluent/fluentd-kubernetes-daemonset/blob/master/docker-image/v0.12/debian-logentries/Dockerfile
[debian-cloudwatch-dockerfile]: https://github.com/fluent/fluentd-kubernetes-daemonset/blob/master/docker-image/v0.12/debian-cloudwatch/Dockerfile
[debian-s3-dockerfile]: https://github.com/fluent/fluentd-kubernetes-daemonset/blob/master/docker-image/v0.12/debian-s3/Dockerfile
[debian-papertrail-dockerfile]: https://github.com/fluent/fluentd-kubernetes-daemonset/blob/master/docker-image/v0.12/debian-papertrail/Dockerfile
[debian-kafka-dockerfile]: https://github.com/fluent/fluentd-kubernetes-daemonset/blob/master/docker-image/v0.12/debian-kafka/Dockerfile

## About Enterprise Edition

[Fluentd Enterprise](https://fluentd.treasuredata.com) is a new edition by [Treasure Data](https://www.treasuredata.com) that provides specific features like:

- Enhanced Security
- Additional and certified Enterprise add-ons for Splunk, Apache Kafka, Hadoop and Amazon S3.

To obtain more details please visit the official [Fluentd Enterprise](https://fluentd.treasuredata.com) web site.
