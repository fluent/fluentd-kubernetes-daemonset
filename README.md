Fluentd Daemonset for Kubernetes
====================

[![Docker Stars](https://img.shields.io/docker/stars/fluent/fluentd-kubernetes.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes)
[![Docker Pulls](https://img.shields.io/docker/pulls/fluent/fluentd-kubernetes.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes)
[![ImageLayers Size](https://img.shields.io/imagelayers/image-size/fluent/fluentd-kubernetes/latest.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes)
[![ImageLayers Layers](https://img.shields.io/imagelayers/layers/fluent/fluentd-kubernetes/latest.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes)




## Supported tags and respective `Dockerfile` links

- `v0.12.33-elasticsearch`,`v0.12-elasticsearch`,`stable-elasticsearch`,`elasticsearch`
  [(v0.12/elasticsearch/Dockerfile)][101]
- `v0.12.33-loggly`,`v0.12-loggly`,`stable-loggly`,`loggly`
  [(v0.12/loggly/Dockerfile)][102]
- `v0.12.33-logentries`,`v0.12-logentries`,`stable-logentries`,`logentries`
  [(v0.12/logentries/Dockerfile)][103]


## What is Fluentd?

Fluentd is an open source data collector, which lets you unify the data
collection and consumption for a better use and understanding of data.

> [www.fluentd.org](http://www.fluentd.org/)

![Fluentd Logo](http://www.fluentd.org/assets/img/miscellany/fluentd-logo.png)


## Image versions

This image is based on the popular [Alpine Linux project][1], available in
[the alpine official image][2].
Alpine Linux is much smaller than most distribution base images (~5MB), and
thus leads to much slimmer images in general.

### `vX.Y`

Latest version of `vX.Y` Fluentd branch.


### `vX.Y.Z`

Concrete `vX.Y.Z` version of Fluentd.


### `debian`

Debian image not available at the moment.

You may need the image based on [Debian Linux image][3] when you require
plugins which cannot be installed on Alpine (like `fluent-plugin-systemd`).


### References

[Kubernetes Logging with Fluentd][4]


### Deploying to Kubernetes

See [Honestbee Public Helm charts](https://github.com/honestbee/public-charts/tree/fluentd-logentries-0.1.0/incubator/fluentd-logentries)


## Issues

We can't notice comments in the DockerHub so don't use them for reporting
issues or asking question.

If you have any problems with or questions about this image, please contact us
through a [GitHub issue](https://github.com/fluent/fluentd-kubernetes-daemonset/issues).



[1]: http://alpinelinux.org
[2]: https://hub.docker.com/_/alpine
[3]: https://hub.docker.com/_/debian
[4]: http://docs.fluentd.org/v0.12/articles/kubernetes-fluentd
[101]: https://github.com/honestbee/fluentd-kubernetes/blob/master/docker-image/v0.12/elasticsearch/Dockerfile
[102]: https://github.com/honestbee/fluentd-kubernetes/blob/master/docker-image/v0.12/loggly/Dockerfile
[103]: https://github.com/honestbee/fluentd-kubernetes/blob/master/docker-image/v0.12/logentries/Dockerfile
[104]: https://github.com/honestbee/fluentd-kubernetes/blob/master/docker-image/v0.12/cloudwatch/Dockerfile

