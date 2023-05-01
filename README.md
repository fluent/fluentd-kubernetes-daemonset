# Fluentd Daemonset for Kubernetes

| :exclamation: README.md is generated from templates/README.md.erb |
|-------------------------------------------------------------------|

[![Docker Stars](https://img.shields.io/docker/stars/fluent/fluentd-kubernetes-daemonset.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset)
[![Docker Pulls](https://img.shields.io/docker/pulls/fluent/fluentd-kubernetes-daemonset.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset)
[![ImageLayers Size](https://img.shields.io/imagelayers/image-size/fluent/fluentd-kubernetes-daemonset/latest.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset)
[![ImageLayers Layers](https://img.shields.io/imagelayers/layers/fluent/fluentd-kubernetes-daemonset/latest.svg)](https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset)

## Supported tags and respective `Dockerfile` links

See also dockerhub tags page: https://hub.docker.com/r/fluent/fluentd-kubernetes-daemonset/tags

### Debian

#### Current stable

As the current limitation about the number of automated builds on hub.docker.com, there are some restrictions to ship daemonset images:

* `stackdriver`, `papertrail`, `syslog` images (x86_64/arm64) won't be published anymore
* `logentries`, `loggly`, `logzio`, `s3` arm64 images won't be published anymore (x86_64 only supported)

If you want to use above non published images, build it by yourself. Dockerfile itself is still maintained in this repository.

##### Multi-Arch images
- `Azureblob`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-azureblob-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-azureblob-1`
- `Elasticsearch8`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-elasticsearch8-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-elasticsearch8-1`
- `Elasticsearch7`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-elasticsearch7-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-elasticsearch7-1`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1-debian-elasticsearch`
- `Opensearch`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-opensearch-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-opensearch-1`
- `Cloudwatch`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-cloudwatch-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-cloudwatch-1`
- `Forward`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-forward-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-forward-1`
- `Gcs`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-gcs-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-gcs-1`
- `Graylog`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-graylog-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-graylog-1`
- `Kafka`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-kafka-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-kafka-1`
- `Kafka2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-kafka2-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-kafka2-1`
- `Kinesis`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-kinesis-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-kinesis-1`

##### x86_64 images
- `Azureblob` [Dockerfile](docker-image/v1.16/debian-azureblob/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-azureblob-amd64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-azureblob-amd64-1`
- `Elasticsearch8` [Dockerfile](docker-image/v1.16/debian-elasticsearch8/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-elasticsearch8-amd64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-elasticsearch8-amd64-1`
- `Elasticsearch7` [Dockerfile](docker-image/v1.16/debian-elasticsearch7/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-elasticsearch7-amd64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-elasticsearch7-amd64-1`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1-debian-elasticsearch-amd64`
- `Elasticsearch6` [Dockerfile](docker-image/v1.16/debian-elasticsearch6/Dockerfile)
- `Opensearch` [Dockerfile](docker-image/v1.16/debian-opensearch/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-opensearch-amd64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-opensearch-amd64-1`
- `Loggly` [Dockerfile](docker-image/v1.16/debian-loggly/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-loggly-amd64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-loggly-amd64-1`
- `Logentries` [Dockerfile](docker-image/v1.16/debian-logentries/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-logentries-amd64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-logentries-amd64-1`
- `Cloudwatch` [Dockerfile](docker-image/v1.16/debian-cloudwatch/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-cloudwatch-amd64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-cloudwatch-amd64-1`
- `Stackdriver` [Dockerfile](docker-image/v1.16/debian-stackdriver/Dockerfile)
- `S3` [Dockerfile](docker-image/v1.16/debian-s3/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-s3-amd64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-s3-amd64-1`
- `Syslog` [Dockerfile](docker-image/v1.16/debian-syslog/Dockerfile)
- `Forward` [Dockerfile](docker-image/v1.16/debian-forward/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-forward-amd64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-forward-amd64-1`
- `Gcs` [Dockerfile](docker-image/v1.16/debian-gcs/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-gcs-amd64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-gcs-amd64-1`
- `Graylog` [Dockerfile](docker-image/v1.16/debian-graylog/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-graylog-amd64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-graylog-amd64-1`
- `Papertrail` [Dockerfile](docker-image/v1.16/debian-papertrail/Dockerfile)
- `Logzio` [Dockerfile](docker-image/v1.16/debian-logzio/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-logzio-amd64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-logzio-amd64-1`
- `Kafka` [Dockerfile](docker-image/v1.16/debian-kafka/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-kafka-amd64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-kafka-amd64-1`
- `Kafka2` [Dockerfile](docker-image/v1.16/debian-kafka2/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-kafka2-amd64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-kafka2-amd64-1`
- `Kinesis` [Dockerfile](docker-image/v1.16/debian-kinesis/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-kinesis-amd64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-kinesis-amd64-1`

##### arm64 images
- `Azureblob` [Dockerfile](docker-image/v1.16/arm64/debian-azureblob/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-azureblob-arm64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-azureblob-arm64-1`
- `Elasticsearch8` [Dockerfile](docker-image/v1.16/arm64/debian-elasticsearch8/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-elasticsearch8-arm64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-elasticsearch8-arm64-1`
- `Elasticsearch7` [Dockerfile](docker-image/v1.16/arm64/debian-elasticsearch7/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-elasticsearch7-arm64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-elasticsearch7-arm64-1`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1-debian-elasticsearch-arm64`
- `Elasticsearch6` [Dockerfile](docker-image/v1.16/arm64/debian-elasticsearch6/Dockerfile)
- `Opensearch` [Dockerfile](docker-image/v1.16/arm64/debian-opensearch/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-opensearch-arm64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-opensearch-arm64-1`
- `Loggly` [Dockerfile](docker-image/v1.16/arm64/debian-loggly/Dockerfile)
- `Logentries` [Dockerfile](docker-image/v1.16/arm64/debian-logentries/Dockerfile)
- `Cloudwatch` [Dockerfile](docker-image/v1.16/arm64/debian-cloudwatch/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-cloudwatch-arm64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-cloudwatch-arm64-1`
- `Stackdriver` [Dockerfile](docker-image/v1.16/arm64/debian-stackdriver/Dockerfile)
- `S3` [Dockerfile](docker-image/v1.16/arm64/debian-s3/Dockerfile)
- `Syslog` [Dockerfile](docker-image/v1.16/arm64/debian-syslog/Dockerfile)
- `Forward` [Dockerfile](docker-image/v1.16/arm64/debian-forward/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-forward-arm64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-forward-arm64-1`
- `Gcs` [Dockerfile](docker-image/v1.16/arm64/debian-gcs/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-gcs-arm64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-gcs-arm64-1`
- `Graylog` [Dockerfile](docker-image/v1.16/arm64/debian-graylog/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-graylog-arm64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-graylog-arm64-1`
- `Papertrail` [Dockerfile](docker-image/v1.16/arm64/debian-papertrail/Dockerfile)
- `Logzio` [Dockerfile](docker-image/v1.16/arm64/debian-logzio/Dockerfile)
- `Kafka` [Dockerfile](docker-image/v1.16/arm64/debian-kafka/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-kafka-arm64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-kafka-arm64-1`
- `Kafka2` [Dockerfile](docker-image/v1.16/arm64/debian-kafka2/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-kafka2-arm64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-kafka2-arm64-1`
- `Kinesis` [Dockerfile](docker-image/v1.16/arm64/debian-kinesis/Dockerfile)
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16.1-debian-kinesis-arm64-1.2`
  - `docker pull fluent/fluentd-kubernetes-daemonset:v1.16-debian-kinesis-arm64-1`


You can also use `v1-debian-PLUGIN` tag to refer latest v1 image, e.g. `v1-debian-elasticsearch`. On production, strict tag is better to avoid unexpected update.

See dockerhub's tags page for older tags.

#### Old stable

v0.12 development has been ended. These images are never updated.

- `v0.12-debian-elasticsearch` [archived-image/v0.12/debian-elasticsearch/Dockerfile](archived-image/v0.12/debian-elasticsearch/Dockerfile)
- `v0.12-debian-loggly` [archived-image/v0.12/debian-loggly/Dockerfile](archived-image/v0.12/debian-loggly/Dockerfile)
- `v0.12-debian-logentries` [archived-image/v0.12/debian-logentries/Dockerfile](archived-image/v0.12/debian-logentries/Dockerfile)
- `v0.12-debian-cloudwatch` [archived-image/v0.12/debian-cloudwatch/Dockerfile](archived-image/v0.12/debian-cloudwatch/Dockerfile)
- `v0.12-debian-stackdriver` [archived-image/v0.12/debian-stackdriver/Dockerfile](archived-image/v0.12/debian-stackdriver/Dockerfile)
- `v0.12-debian-s3` [archived-image/v0.12/debian-s3/Dockerfile](archived-image/v0.12/debian-s3/Dockerfile)
- `v0.12-debian-gcs` [archived-image/v0.12/debian-gcs/Dockerfile](archived-image/v0.12/debian-gcs/Dockerfile)
- `v0.12-debian-papertrail` [archived-image/v0.12/debian-papertrail/Dockerfile](archived-image/v0.12/debian-papertrail/Dockerfile)
- `v0.12-debian-syslog` [archived-image/v0.12/debian-syslog/Dockerfile](archived-image/v0.12/debian-syslog/Dockerfile)
- `v0.12-debian-graylog` [archived-image/v0.12/debian-graylog/Dockerfile](archived-image/v0.12/debian-graylog/Dockerfile)
- `v0.12-debian-logzio` [archived-image/v0.12/debian-logzio/Dockerfile](archived-image/v0.12/debian-logzio/Dockerfile)
- `v0.12-debian-kafka` [archived-image/v0.12/debian-kafka/Dockerfile](archived-image/v0.12/debian-kafka/Dockerfile)
- `v0.12-debian-splunkhec` [archived-image/v0.12/debian-splunkhec/Dockerfile](archived-image/v0.12/debian-splunkhec/Dockerfile)
- `v0.12-debian-kinesis` [archived-image/v0.12/debian-kinesis/Dockerfile](archived-image/v0.12/debian-kinesis/Dockerfile)

### Alpine Linux (This is deprecated. Use Debian images instead)

- `v0.12-alpine-elasticsearch` [archived-image/v0.12/alpine-elasticsearch/Dockerfile](archived-image/v0.12/alpine-elasticsearch/Dockerfile)
- `v0.12-alpine-loggly` [archived-image/v0.12/alpine-loggly/Dockerfile](archived-image/v0.12/alpine-loggly/Dockerfile)
- `v0.12-alpine-logentries` [archived-image/v0.12/alpine-logentries/Dockerfile](archived-image/v0.12/alpine-logentries/Dockerfile)
- `v0.12-alpine-cloudwatch` [archived-image/v0.12/alpine-cloudwatch/Dockerfile](archived-image/v0.12/alpine-cloudwatch/Dockerfile)
- `v0.12-alpine-stackdriver` [archived-image/v0.12/alpine-stackdriver/Dockerfile](archived-image/v0.12/alpine-stackdriver/Dockerfile)
- `v0.12-alpine-s3` [archived-image/v0.12/alpine-s3/Dockerfile](archived-image/v0.12/alpine-s3/Dockerfile)
- `v0.12-alpine-gcs` [archived-image/v0.12/alpine-gcs/Dockerfile](archived-image/v0.12/alpine-gcs/Dockerfile)
- `v0.12-alpine-papertrail` [archived-image/v0.12/alpine-papertrail/Dockerfile](archived-image/v0.12/alpine-papertrail/Dockerfile)
- `v0.12-alpine-syslog` [archived-image/v0.12/alpine-syslog/Dockerfile](archived-image/v0.12/alpine-syslog/Dockerfile)
- `v0.12-alpine-graylog` [archived-image/v0.12/alpine-graylog/Dockerfile](archived-image/v0.12/alpine-graylog/Dockerfile)
- `v0.12-alpine-logzio` [archived-image/v0.12/alpine-logzio/Dockerfile](archived-image/v0.12/alpine-logzio/Dockerfile)
- `v0.12-alpine-kafka` [archived-image/v0.12/alpine-kafka/Dockerfile](archived-image/v0.12/alpine-kafka/Dockerfile)
- `v0.12-alpine-kinesis` [archived-image/v0.12/alpine-kinesis/Dockerfile](archived-image/v0.12/alpine-kinesis/Dockerfile)
- `v0.12-alpine-splunkhec` [archived-image/v0.12/alpine-splunkhec/Dockerfile](archived-image/v0.12/alpine-splunkhec/Dockerfile)

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

Default YAML uses latest v1 images like `fluent/fluentd-kubernetes-daemonset:v1-debian-kafka`. If you want to avoid unexpected image update, specify exact version for `image` like `fluent/fluentd-kubernetes-daemonset:v1.8.0-debian-kafka-1.0`.

### Run as root

This is for v0.12 images.

In Kubernetes and default setting, fluentd needs root permission to read logs in `/var/log` and write `pos_file` to `/var/log`.
To avoid permission error, you need to set `FLUENT_UID` environment variable to `0` in your Kubernetes configuration.

### Use your configuration

These images have default configuration and support some environment variables for parameters
but it sometimes doesn't fit your case. If you want to use your configuration, use ConfigMap feature.

Each image has following configurations:

- fluent.conf: Destination setting, Elaticsearch, kafka and etc.
- kubernetes.conf: k8s specific setting. `tail` input for log files and `kubernetes_metadata` filter
- tail_container_parse.conf: parser setting for `/var/log/containers/*.log`. See also "Use CRI parser for containerd/cri-o" logs section
- prometheus.conf: prometheus plugin for fluentd monitoring
- systemd.conf: systemd plugin for collecting systemd-journal log. See also "Disable systemd input" section.

Overwrite conf file via ConfigMap. See also several examples:

- [Cluster-level Logging in Kubernetes with Fluentd](https://medium.com/kubernetes-tutorials/cluster-level-logging-in-kubernetes-with-fluentd-e59aa2b6093a)
- https://github.com/fluent/fluentd-kubernetes-daemonset/pull/349#issuecomment-579097659

### Use CRI parser for containerd/cri-o logs

This feature is available since v1.12.0-xxx-1.1.

By default, these images use `json` parser for `/var/log/containers/` files because docker generates json formatted logs.
On the other hand, containerd/cri-o use different log format. To parse such logs, you need to use [`cri` parser](https://github.com/fluent/fluent-plugin-parser-cri) instead.

You can use `cri` parser by overwriting `tail_container_parse.conf` via ConfigMap.

```
# configuration example
<parse>
  @type cri
</parse>
```

See also [CRI parser README](https://github.com/fluent/fluent-plugin-parser-cri#log-and-configuration-example)

### Use FLUENT_CONTAINER_TAIL_PATH to change container logs folder

You can update the default path for the container logs i.e /var/log/container/*.log and also one can add multiple path as defined in this fluentd document https://docs.fluentd.org/input/tail#path 

### Use FLUENT_CONTAINER_TAIL_EXCLUDE_PATH to exclude specific container logs

Since v1.9.3 or later images.

You can exclude container logs from `/var/log/containers/` with `FLUENT_CONTAINER_TAIL_EXCLUDE_PATH`.
If you have a trouble with specific log, use this envvar, e.g. `["/var/log/containers/logname-*"]`.

- `exclude_path` parameter document: https://docs.fluentd.org/input/tail#exclude_path
- Fluentd log issue with backslash: https://github.com/fluent/fluentd/issues/2545

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

This is for older images. Latest elasticsearch images don't use sed.

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
oc delete pod -l k8s-app=fluentd-logging
```

This is from [nekop's japanese article](https://nekop.hatenablog.com/entry/2018/04/20/170257).

### Multiple fluentd

When you want to have multiple fluentd. For example push to multiple destination like: elsticsearch + S3.
You need to use `FLUENT_POS_EXTRA_DIR` add additional directory for pos file.
Otherwise they share same pos file. You may found some log only on one destination.

## Note

### kafka image doesn't support zookeeper parameters

zookeeper gem doesn't work on Debian 10, so kafka image doesn't include zookeeper gem.

### Windows k8s daemonset not supported in this repository

Maintainers don't have k8s experience on Windows.
Some users create k8s daemonset on Windows:

- https://github.com/bgsilvait/k8s-fluentd-windows
- https://github.com/k1nger/fluentd-windows-daemon

Please check them out.

### kafka image suggestion

Using debian-kafka2/debian-kafka2-arm64 images are better than using debian-kafka/debian-kafka-arm64 images.
Because debian-kafka2/debian-kafka2-arm64 images use `out_kafka2` plugin but debian-kafka/debian-kafka-arm64 images use deprecated `out_kafka_buffered` plugin.


## Maintainers

Some images are contributed by users. If you have a problem/question for following images, ask it to contributors.

- azureblob : @elsesiy
- papertrail : @alexouzounis
- kafka : @erhudy
- graylog : @rtnpro
- gcs : @andor-pierdelacabeza
- Amazon Kinesis : @shiftky
- logz.io : @SaMnCo / @jamielennox
- splunkhec: @FutureSharks

Currently, we don't accept new destination request without contribution.
See https://github.com/fluent/fluentd-kubernetes-daemonset/issues/293

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
[fluentd-article]: https://docs.fluentd.org/container-deployment/kubernetes
