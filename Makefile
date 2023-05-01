# This Makefile automates possible operations of this project.
#
# Images and description on Docker Hub will be automatically rebuilt on
# pushes to `master` branch of this repo and on updates of parent images.
#
# Note! Docker Hub `post_push` hook must be always up-to-date with values
# specified in current Makefile. To update it just use:
#	make post-push-hook-all
#
# It's still possible to build, tag and push images manually. Just use:
#	make release-all

IMAGE_NAME := fluent/fluentd-kubernetes
X86_IMAGES := \
	v1.16/debian-azureblob:v1.16.1-debian-azureblob-amd64-1.2,v1.16-debian-azureblob-amd64-1 \
	v1.16/debian-elasticsearch8:v1.16.1-debian-elasticsearch8-amd64-1.2,v1.16-debian-elasticsearch8-amd64-1 \
	v1.16/debian-elasticsearch7:v1.16.1-debian-elasticsearch7-amd64-1.2,v1.16-debian-elasticsearch7-amd64-1,v1-debian-elasticsearch-amd64 \
	v1.16/debian-elasticsearch6:v1.16.1-debian-elasticsearch6-amd64-1.2,v1.16-debian-elasticsearch6-amd64-1 \
	v1.16/debian-opensearch:v1.16.1-debian-opensearch-amd64-1.2,v1.16-debian-opensearch-amd64-1 \
	v1.16/debian-loggly:v1.16.1-debian-loggly-amd64-1.2,v1.16-debian-loggly-amd64-1 \
	v1.16/debian-logentries:v1.16.1-debian-logentries-amd64-1.2,v1.16-debian-logentries-amd64-1 \
	v1.16/debian-cloudwatch:v1.16.1-debian-cloudwatch-amd64-1.2,v1.16-debian-cloudwatch-amd64-1 \
	v1.16/debian-stackdriver:v1.16.1-debian-stackdriver-amd64-1.2,v1.16-debian-stackdriver-amd64-1 \
	v1.16/debian-s3:v1.16.1-debian-s3-amd64-1.2,v1.16-debian-s3-amd64-1 \
	v1.16/debian-syslog:v1.16.1-debian-syslog-amd64-1.2,v1.16-debian-syslog-amd64-1 \
	v1.16/debian-forward:v1.16.1-debian-forward-amd64-1.2,v1.16-debian-forward-amd64-1 \
	v1.16/debian-gcs:v1.16.1-debian-gcs-amd64-1.2,v1.16-debian-gcs-amd64-1 \
	v1.16/debian-graylog:v1.16.1-debian-graylog-amd64-1.2,v1.16-debian-graylog-amd64-1 \
	v1.16/debian-papertrail:v1.16.1-debian-papertrail-amd64-1.2,v1.16-debian-papertrail-amd64-1 \
	v1.16/debian-logzio:v1.16.1-debian-logzio-amd64-1.2,v1.16-debian-logzio-amd64-1 \
	v1.16/debian-kafka:v1.16.1-debian-kafka-amd64-1.2,v1.16-debian-kafka-amd64-1 \
	v1.16/debian-kafka2:v1.16.1-debian-kafka2-amd64-1.2,v1.16-debian-kafka2-amd64-1 \
	v1.16/debian-kinesis:v1.16.1-debian-kinesis-amd64-1.2,v1.16-debian-kinesis-amd64-1

#	<Dockerfile>:<version>,<tag1>,<tag2>,...

ARM64_IMAGES := \
	v1.16/arm64/debian-azureblob:v1.16.1-debian-azureblob-arm64-1.2,v1.16-debian-azureblob-arm64-1 \
	v1.16/arm64/debian-elasticsearch8:v1.16.1-debian-elasticsearch8-arm64-1.2,v1.16-debian-elasticsearch8-arm64-1 \
	v1.16/arm64/debian-elasticsearch7:v1.16.1-debian-elasticsearch7-arm64-1.2,v1.16-debian-elasticsearch7-arm64-1,v1-debian-elasticsearch-arm64 \
	v1.16/arm64/debian-elasticsearch6:v1.16.1-debian-elasticsearch6-arm64-1.2,v1.16-debian-elasticsearch6-arm64-1 \
	v1.16/arm64/debian-opensearch:v1.16.1-debian-opensearch-arm64-1.2,v1.16-debian-opensearch-arm64-1 \
	v1.16/arm64/debian-loggly:v1.16.1-debian-loggly-arm64-1.2,v1.16-debian-loggly-arm64-1 \
	v1.16/arm64/debian-logentries:v1.16.1-debian-logentries-arm64-1.2,v1.16-debian-logentries-arm64-1 \
	v1.16/arm64/debian-cloudwatch:v1.16.1-debian-cloudwatch-arm64-1.2,v1.16-debian-cloudwatch-arm64-1 \
	v1.16/arm64/debian-stackdriver:v1.16.1-debian-stackdriver-arm64-1.2,v1.16-debian-stackdriver-arm64-1 \
	v1.16/arm64/debian-s3:v1.16.1-debian-s3-arm64-1.2,v1.16-debian-s3-arm64-1 \
	v1.16/arm64/debian-syslog:v1.16.1-debian-syslog-arm64-1.2,v1.16-debian-syslog-arm64-1 \
	v1.16/arm64/debian-forward:v1.16.1-debian-forward-arm64-1.2,v1.16-debian-forward-arm64-1 \
	v1.16/arm64/debian-gcs:v1.16.1-debian-gcs-arm64-1.2,v1.16-debian-gcs-arm64-1 \
	v1.16/arm64/debian-graylog:v1.16.1-debian-graylog-arm64-1.2,v1.16-debian-graylog-arm64-1 \
	v1.16/arm64/debian-papertrail:v1.16.1-debian-papertrail-arm64-1.2,v1.16-debian-papertrail-arm64-1 \
	v1.16/arm64/debian-logzio:v1.16.1-debian-logzio-arm64-1.2,v1.16-debian-logzio-arm64-1 \
	v1.16/arm64/debian-kafka:v1.16.1-debian-kafka-arm64-1.2,v1.16-debian-kafka-arm64-1 \
	v1.16/arm64/debian-kafka2:v1.16.1-debian-kafka2-arm64-1.2,v1.16-debian-kafka2-arm64-1 \
	v1.16/arm64/debian-kinesis:v1.16.1-debian-kinesis-arm64-1.2,v1.16-debian-kinesis-arm64-1

ALL_IMAGES := $(X86_IMAGES) $(ARM64_IMAGES)

comma := ,
empty :=
space := $(empty) $(empty)

# Default is first image from ALL_IMAGES list.
DOCKERFILE ?= $(word 1,$(subst :, ,$(word 1,$(ALL_IMAGES))))
TARGET ?= $(word 2,$(subst -, , $(DOCKERFILE)))

RUBY_VERSION = 3.1

# Gets the version value based on the directory the dockerfile is in.
FLUENTD_VERSION ?= $(word 1,$(subst /, ,$(DOCKERFILE)))

# Finds the image tags based on whatever DOCKERFILE is set to, even if the user
# has passed DOCKERFILE explicitly
#
# Gets the <version>,<tag1>,<tag2>,... from <Dockerfile>:<version>,<tag1>,<tag2>,...
TAGS ?= $(word 2,$(subst :, ,$(word 1,$(filter $(DOCKERFILE)%, $(ALL_IMAGES)))))
# Gets the <version> from <Dockerfile>:<version>,<tag1>,<tag2>,...
VERSION ?= $(word 1,$(subst $(comma), ,$(TAGS)))

no-cache ?= no

eq = $(if $(or $(1),$(2)),$(and $(findstring $(1),$(2)),\
                                $(findstring $(2),$(1))),1)

## Docker image management

no-cache-arg = $(if $(call eq, $(no-cache), yes), --no-cache, $(empty))

# Build Docker image.
#
# Usage:
#	make image [no-cache=(yes|no)] [DOCKERFILE=] [VERSION=]
image:
	docker build $(no-cache-arg) -t $(IMAGE_NAME):$(VERSION) docker-image/$(DOCKERFILE)

parsed-tags = $(subst $(comma), $(space), $(TAGS))

# Tag Docker image with given tags.
#
# Usage:
#	make tags [VERSION=] [TAGS=t1,t2,...]
tags:
	(set -e ; $(foreach tag, $(parsed-tags), \
		docker tag $(IMAGE_NAME):$(VERSION) $(IMAGE_NAME):$(tag) ; \
	))

# Manually push Docker images to Docker Hub.
#
# Usage:
#	make push [TAGS=t1,t2,...]
push:
	(set -e ; $(foreach tag, $(parsed-tags), \
		docker push $(IMAGE_NAME):$(tag) ; \
	))

# Make manual release of Docker images to Docker Hub.
#
# Usage:
#	make release [no-cache=(yes|no)] [DOCKERFILE=] [VERSION=] [TAGS=t1,t2,...]
release: | image tags push

# Make manual release of all supported Docker images to Docker Hub.
#
# Usage:
#	make release-all [no-cache=(yes|no)]
release-all:
	(set -e ; $(foreach img,$(ALL_IMAGES), \
		make release no-cache=$(no-cache) \
			DOCKERFILE=$(word 1,$(subst :, ,$(img))) \
			VERSION=$(word 1,$(subst $(comma), ,\
			                 $(word 2,$(subst :, ,$(img))))) \
			TAGS=$(word 2,$(subst :, ,$(img))) ; \
	))


## Template processing

# Generate Docker image sources.
#
# Usage:
#	make src [DOCKERFILE=] [VERSION=] [TAGS=t1,t2,...]
src: dockerfile gemfile fluent.conf systemd.conf prometheus.conf kubernetes.conf plugins post-push-hook post-checkout-hook entrypoint.sh cluster-autoscaler.conf containers.conf docker.conf etcd.conf glbc.conf kube-apiserver-audit.conf kube-apiserver.conf kube-controller-manager.conf kube-proxy.conf kube-scheduler.conf kubelet.conf rescheduler.conf salt.conf startupscript.conf tail_container_parse.conf

# Generate sources for all supported Docker images.
#
# Usage:
#	make src-all
src-all: README.md
	(set -e ; $(foreach img,$(ALL_IMAGES), \
		make src \
			DOCKERFILE=$(word 1,$(subst :, ,$(img))) \
			VERSION=$(word 1,$(subst $(comma), ,\
			                 $(word 2,$(subst :, ,$(img))))) \
			TAGS=$(word 2,$(subst :, ,$(img))) ; \
	))

# Render the given erb template.
#
# Usage:
#	make container-image-template [FILE=] [DOCKERFILE=] [VERSION=] [RUBY_VERSION=]
container-image-template:
	mkdir -p docker-image/$(DOCKERFILE)/$(dir $(FILE))
	docker run --rm -i -v $(PWD)/templates/$(FILE).erb:/$(basename $(FILE)).erb:ro \
		ruby:alpine erb -U -T 1 \
			dockerfile='$(DOCKERFILE)' \
			version='$(VERSION)' \
			ruby_version='$(RUBY_VERSION)' \
		/$(basename $(FILE)).erb > docker-image/$(DOCKERFILE)/$(FILE)

# Execute the given TARGET for each images
#
# Usage:
#	make each-image TARGET=
each-image:
	(set -e ; $(foreach img,$(ALL_IMAGES), \
		make $(TARGET) \
			DOCKERFILE=$(word 1,$(subst :, ,$(img))) \
			VERSION=$(word 1,$(subst $(comma), ,\
			                 $(word 2,$(subst :, ,$(img))))) ; \
	))


# Generate Dockerfile from template.
#
# Usage:
#	make dockerfile [DOCKERFILE=] [VERSION=]
dockerfile:
	make container-image-template FILE=Dockerfile
	cp $(PWD)/templates/.dockerignore docker-image/$(DOCKERFILE)/.dockerignore
dockerfile-all:
	make each-image TARGET=dockerfile

# Generate Gemfile and Gemfile.lock from template.
#
# Usage:
#	make gemfile [DOCKERFILE=] [VERSION=]
gemfile:
	make container-image-template FILE=Gemfile
	docker run --rm -i -v $(PWD)/docker-image/$(DOCKERFILE)/Gemfile:/Gemfile:ro \
		ruby:alpine sh -c "apk add --no-cache --quiet git && bundle lock --print --remove-platform x86_64-linux-musl --add-platform ruby" > docker-image/${DOCKERFILE}/Gemfile.lock

# Generate Gemfile and Gemfile.lock from template for all supported Docker images.
#
# Usage:
#	make gemfile-all
gemfile-all:
	make each-image TARGET=gemfile

# Generate entrypoint.sh from template.
#
# Usage:
#	make entrypoint.sh [DOCKERFILE=] [VERSION=]
entrypoint.sh:
	make container-image-template FILE=entrypoint.sh
	chmod 755 docker-image/$(DOCKERFILE)/entrypoint.sh

# Generate entrypoint.sh from template for all supported Docker images.
#
# Usage:
#	make entrypoint.sh-all
entrypoint.sh-all:
	make each-image TARGET=entrypoint.sh

# Generate fluent.conf from template.
#
# Usage:
#	make fluent.conf [DOCKERFILE=] [VERSION=]
fluent.conf:
	make container-image-template FILE=conf/fluent.conf
fluent.conf-all:
	make each-image TARGET=fluent.conf

# Generate kubernetes.conf from template.
#
# Usage:
#	make kubernetes.conf [DOCKERFILE=] [VERSION=]
kubernetes.conf:
	make container-image-template FILE=conf/kubernetes.conf
kubernetes.conf-all:
	make each-image TARGET=kubernetes.conf

cluster-autoscaler.conf:
	make container-image-template FILE=conf/kubernetes/cluster-autoscaler.conf
cluster-autoscaler.conf-all:
	make each-image TARGET=cluster-autoscaler.conf

containers.conf:
	make container-image-template FILE=conf/kubernetes/containers.conf
containers.conf-all:
	make each-image TARGET=containers.conf

docker.conf:
	make container-image-template FILE=conf/kubernetes/docker.conf
docker.conf-all:
	make each-image TARGET=docker.conf

etcd.conf:
	make container-image-template FILE=conf/kubernetes/etcd.conf
etcd.conf-all:
	make each-image TARGET=etcd.conf

glbc.conf:
	make container-image-template FILE=conf/kubernetes/glbc.conf
glbc.conf-all:
	make each-image TARGET=glbc.conf

kube-apiserver-audit.conf:
	make container-image-template FILE=conf/kubernetes/kube-apiserver-audit.conf
kube-apiserver-audit.conf-all:
	make each-image TARGET=kube-apiserver-audit.conf

kube-apiserver.conf:
	make container-image-template FILE=conf/kubernetes/kube-apiserver.conf
kube-apiserver.conf-all:
	make each-image TARGET=kube-apiserver.conf

kube-controller-manager.conf:
	make container-image-template FILE=conf/kubernetes/kube-controller-manager.conf
kube-controller-manager.conf-all:
	make each-image TARGET=kube-controller-manager.conf

kubelet.conf:
	make container-image-template FILE=conf/kubernetes/kubelet.conf
kubelet.conf-all:
	make each-image TARGET=kubelet.conf

kube-proxy.conf:
	make container-image-template FILE=conf/kubernetes/kube-proxy.conf
kube-proxy.conf-all:
	make each-image TARGET=kube-proxy.conf

kube-scheduler.conf:
	make container-image-template FILE=conf/kubernetes/kube-scheduler.conf
kube-scheduler.conf-all:
	make each-image TARGET=kube-scheduler.conf

rescheduler.conf:
	make container-image-template FILE=conf/kubernetes/rescheduler.conf
rescheduler.conf-all:
	make each-image TARGET=rescheduler.conf

salt.conf:
	make container-image-template FILE=conf/kubernetes/salt.conf
salt.conf-all:
	make each-image TARGET=salt.conf

startupscript.conf:
	make container-image-template FILE=conf/kubernetes/startupscript.conf
startupscript.conf-all:
	make each-image TARGET=startupscript.conf



systemd.conf:
	make container-image-template FILE=conf/systemd.conf
systemd.conf-all:
	make each-image TARGET=systemd.conf

tail_container_parse.conf:
	make container-image-template FILE=conf/tail_container_parse.conf
tail_container_parse.conf-all:
	make each-image TARGET=tail_container_parse.conf


prometheus.conf:
	make container-image-template FILE=conf/prometheus.conf
prometheus.conf-all:
	make each-image TARGET=prometheus.conf


README.md: templates/README.md.erb
	docker run --rm -i -v $(PWD)/templates/README.md.erb:/README.md.erb:ro \
		ruby:alpine erb -U -T 1 \
	                all_images='$(ALL_IMAGES)' \
		/README.md.erb > README.md

.github/dependabot.yml: templates/dependabot.yml.erb
	erb $< > $@

# Generate plugins for version
#
# Usage:
#    make plugins [DOCKERFILE=]
plugins:
	mkdir -p docker-image/$(DOCKERFILE)/plugins
	cp -R plugins/$(FLUENTD_VERSION)/shared/. docker-image/$(DOCKERFILE)/plugins/
	cp -R plugins/$(FLUENTD_VERSION)/$(TARGET)/. docker-image/$(DOCKERFILE)/plugins/

# copy plugins required for all supported Docker images.
#
# Usage:
#	make plugins-all
plugins-all:
	(set -e ; $(foreach img,$(ALL_IMAGES), \
		make plugins \
			DOCKERFILE=$(word 1,$(subst :, ,$(img))) ; \
	))

# Create `post_checkout` Docker Hub hook.
#
# When Docker Hub triggers automated build, the `post_checkout` hook is called
# after the Git repo is checked out. This can be used to set up prerequisites
# for, for example, cross-platform builds.
# See details:
# https://docs.docker.com/docker-cloud/builds/advanced/#build-hook-examples
#
# Usage:
#	make post-checkout-hook [DOCKERFILE=]
post-checkout-hook:
	if [ -n "$(findstring /arm64/,$(DOCKERFILE))" ]; then \
		mkdir -p docker-image/$(DOCKERFILE)/hooks; \
		docker run --rm -i -v $(PWD)/templates/post_checkout.erb:/post_checkout.erb:ro \
			ruby:alpine erb -U \
				dockerfile='$(DOCKERFILE)' \
			/post_checkout.erb > docker-image/$(DOCKERFILE)/hooks/post_checkout ; \
	fi


# Create `post_push` Docker Hub hook for all supported Docker images.
#
# Usage:
#	make post-checkout-hook-all
post-checkout-hook-all:
	make each-image TARGET=post-checkout-hook

# Create `post_push` Docker Hub hook.
#
# When Docker Hub triggers automated build all the tags defined in `post_push`
# hook will be assigned to built image. It allows to link the same image with
# different tags, and not to build identical image for each tag separately.
# See details:
# http://windsock.io/automated-docker-image-builds-with-multiple-tags
#
# Usage:
#	make post-push-hook [DOCKERFILE=] [TAGS=t1,t2,...]

post-push-hook:
	mkdir -p docker-image/$(DOCKERFILE)/hooks
	docker run --rm -i -v $(PWD)/templates/post_push.erb:/post_push.erb:ro \
		ruby:alpine erb -U \
			image_tags='$(TAGS)' \
		/post_push.erb > docker-image/$(DOCKERFILE)/hooks/post_push

# Create `post_push` Docker Hub hook for all supported Docker images.
#
# Usage:
#	make post-push-hook-all

post-push-hook-all:
	(set -e ; $(foreach img,$(ALL_IMAGES), \
		make post-push-hook \
			DOCKERFILE=$(word 1,$(subst :, ,$(img))) \
			TAGS=$(word 2,$(subst :, ,$(img))) ; \
	))


.PHONY: image tags push \
        release release-all \
        src src-all \
        container-image-template each-image \
        dockerfile dockerfile-all \
        gemfile gemfile-all \
        entrypoint.sh entrypoint.sh-all \
        fluent.conf fluent.conf-all \
        kubernetes.conf kubernetes.conf-all\
        cluster-autoscaler.conf cluster-autoscaler.conf-all \
        containers.conf containers.conf-all \
        docker.conf docker.conf-all \
        etcd.conf etcd.conf-all \
        glbc.conf glbc.conf-all \
        kube-apiserver-audit.conf kube-apiserver-audit.conf-all \
        kube-apiserver.conf kube-apiserver.conf-all \
        kube-controller-manager.conf kube-controller-manager.conf-all \
        kubelet.conf kubelet.conf-all \
        kube-proxy.conf kube-proxy.conf-all \
        kube-scheduler.conf kube-scheduler.conf-all \
        rescheduler.conf rescheduler.conf-all \
        salt.conf salt.conf-all \
        startupscript.conf startupscript.conf-all \
        systemd.conf systemd.conf-all \
        tail_container_parse.conf tail_container_parse.conf-all \
        prometheus.conf prometheus.conf-all \
        plugins plugins-all \
        post-checkout-hook post-checkout-hook-all \
        post-push-hook post-push-hook-all \
	README.md
