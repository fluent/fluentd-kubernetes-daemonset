Fluentd Daemonset for Kubernetes
====================

[![Docker Stars](https://img.shields.io/docker/stars/honestbee/fluentd-kubernetes.svg)](https://hub.docker.com/r/honestbee/fluentd-kubernetes)
[![Docker Pulls](https://img.shields.io/docker/pulls/honestbee/fluentd-kubernetes.svg)](https://hub.docker.com/r/honestbee/fluentd-kubernetes)
[![ImageLayers Size](https://img.shields.io/imagelayers/image-size/honestbee/fluentd-kubernetes/latest.svg)](https://hub.docker.com/r/honestbee/fluentd-kubernetes)
[![ImageLayers Layers](https://img.shields.io/imagelayers/layers/honestbee/fluentd-kubernetes/latest.svg)](https://hub.docker.com/r/honestbee/fluentd-kubernetes)


## Supported tags and respective `Dockerfile` links

- `v0.12.33-elasticsearch`,`v0.12-elasticsearch`,`stable-elasticsearch`,`elasticsearch`
  [(v0.12/alpine-elasticsearch/Dockerfile)][alpine-elasticsearch-dockerfile]
- `v0.12.33-loggly`,`v0.12-loggly`,`stable-loggly`,`loggly`
  [(v0.12/alpine-loggly/Dockerfile)][alpine-loggly-dockerfile]
- `v0.12.33-logentries`,`v0.12-logentries`,`stable-logentries`,`logentries`
  [(v0.12/alpine-logentries/Dockerfile)][alpine-logentries-dockerfile]
- `v0.12.33-logzio`,`v0.12-logzio`,`stable-logzio`,`logzio`
  [(v0.12/logzio/Dockerfile)][alpine-logzio-dockerfile]
- `v0.12.33-cloudwatch`,`v0.12-cloudwatch`,`stable-cloudwatch`,`cloudwatch`
  [(v0.12/alpine-cloudwatch/Dockerfile)][alpine-cloudwatch-dockerfile]
- `v0.12.33-debian-elasticsearch`,`v0.12-debian-elasticsearch`, `debian-elasticsearch`
  [(v0.12/debian-elasticsearch/Dockerfile)][debian-elasticsearch-dockerfile]
- `v0.12.33-debian-loggly`,`v0.12-debian-loggly`,`debian-loggly`
  [(v0.12/debian-loggly/Dockerfile)][debian-loggly-dockerfile]
- `v0.12.33-debian-logentries`,`v0.12-debian-logentries`,`debian-logentries`
  [(v0.12/debian-logentries/Dockerfile)][debian-logentries-dockerfile]
- `v0.12.33-debian-cloudwatch`,`v0.12-debian-cloudwatch`,`debian-cloudwatch`
  [(v0.12/debian-cloudwatch/Dockerfile)][debian-cloudwatch-dockerfile]


## What is Fluentd?

Fluentd is an open source data collector, which lets you unify the data
collection and consumption for a better use and understanding of data.

> [www.fluentd.org](http://www.fluentd.org/)

![Fluentd Logo](http://www.fluentd.org/assets/img/miscellany/fluentd-logo.png)


## Image versions

This image is based on the popular [Alpine Linux project][alpine-home], available in
[the alpine official image][alpine-dockerhub].
Alpine Linux is much smaller than most distribution base images (~5MB), and
thus leads to much slimmer images in general.

### `vX.Y`

Latest version of `vX.Y` Fluentd branch.


### `vX.Y.Z`

Concrete `vX.Y.Z` version of Fluentd.


#### Debian

You may need the image based on [Debian Linux image][debian-dockerhub] when you require
plugins which cannot be installed on Alpine (like `fluent-plugin-systemd`).

Versioning is the same as the alpine image, but image names are prefixed with `debian-`.

### References

[Kubernetes Logging with Fluentd][fluentd-article]


### Deploying to Kubernetes

See [Honestbee Public Helm charts](https://github.com/honestbee/public-charts/tree/fluentd-logentries-0.1.0/incubator/fluentd-logentries)

## Issues

We can't notice comments in the DockerHub so don't use them for reporting
issues or asking question.

If you have any problems with or questions about this image, please contact us
through a [GitHub issue](https://github.com/fluent/fluentd-kubernetes-daemonset/issues).


[alpine-home]: http://alpinelinux.org
[alpine-dockerhub]: https://hub.docker.com/_/alpine
[debian-dockerhub]: https://hub.docker.com/_/debian
[fluentd-article]: http://docs.fluentd.org/v0.12/articles/kubernetes-fluentd

[alpine-elasticsearch-dockerfile]: docker-image/v0.12/alpine-elasticsearch/Dockerfile
[alpine-loggly-dockerfile]: docker-image/v0.12/alpine-loggly/Dockerfile
[alpine-logentries-dockerfile]: docker-image/v0.12/alpine-logentries/Dockerfile
[alpine-cloudwatch-dockerfile]: docker-image/v0.12/alpine-cloudwatch/Dockerfile
[alpine-logzio-dockerfile]: docker-image/v0.12/alpine-logzio/Dockerfile

[debian-elasticsearch-dockerfile]: docker-image/v0.12/debian-elasticsearch/Dockerfile
[debian-loggly-dockerfile]: docker-image/v0.12/debian-loggly/Dockerfile
[debian-logentries-dockerfile]: docker-image/v0.12/debian-logentries/Dockerfile
[debian-cloudwatch-dockerfile]: docker-image/v0.12/debian-cloudwatch/Dockerfile
[debian-logzio-dockerfile]: docker-image/v0.12/debian-logzio/Dockerfile
