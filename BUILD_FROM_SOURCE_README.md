# Build Instructions
---
## Build
`docker image build --build-arg FLUENTD_IMG="<docker-image-repo>/fluentd:v1.10.4-oraclelinux-1.0" -f docker-image/v1.10/oraclelinux-elasticsearch7/Dockerfile -t <docker-image-repo>/fluentd-kubernetes-daemonset:v1.10.4-oraclelinux-elasticsearch7-1.0 .`
## Push to OCIR
`docker image push <docker-image-repo>/fluentd-kubernetes-daemonset:v1.10.4-oraclelinux-elasticsearch7-1.0`
