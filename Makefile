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
	v1.12/debian-azureblob:v1.12.4-debian-azureblob-amd64-1.1,v1.12-debian-azureblob-amd64-1 \
	v1.12/debian-elasticsearch7:v1.12.4-debian-elasticsearch7-amd64-1.1,v1.12-debian-elasticsearch7-amd64-1,v1-debian-elasticsearch-amd64 \
	v1.12/debian-elasticsearch6:v1.12.4-debian-elasticsearch6-amd64-1.1,v1.12-debian-elasticsearch6-amd64-1 \
	v1.12/debian-loggly:v1.12.4-debian-loggly-amd64-1.1,v1.12-debian-loggly-amd64-1 \
	v1.12/debian-logentries:v1.12.4-debian-logentries-amd64-1.1,v1.12-debian-logentries-amd64-1 \
	v1.12/debian-cloudwatch:v1.12.4-debian-cloudwatch-amd64-1.4,v1.12-debian-cloudwatch-amd64-1 \
	v1.12/debian-stackdriver:v1.12.4-debian-stackdriver-amd64-1.1,v1.12-debian-stackdriver-amd64-1 \
	v1.12/debian-s3:v1.12.4-debian-s3-amd64-1.1,v1.12-debian-s3-amd64-1 \
	v1.12/debian-syslog:v1.12.4-debian-syslog-amd64-1.1,v1.12-debian-syslog-amd64-1 \
	v1.12/debian-forward:v1.12.4-debian-forward-amd64-1.1,v1.12-debian-forward-amd64-1 \
	v1.12/debian-gcs:v1.12.4-debian-gcs-amd64-1.1,v1.12-debian-gcs-amd64-1 \
	v1.12/debian-graylog:v1.12.4-debian-graylog-amd64-1.1,v1.12-debian-graylog-amd64-1 \
	v1.12/debian-papertrail:v1.12.4-debian-papertrail-amd64-1.1,v1.12-debian-papertrail-amd64-1 \
	v1.12/debian-logzio:v1.12.4-debian-logzio-amd64-1.1,v1.12-debian-logzio-amd64-1 \
	v1.12/debian-kafka:v1.12.4-debian-kafka-amd64-1.1,v1.12-debian-kafka-amd64-1 \
	v1.12/debian-kafka2:v1.12.4-debian-kafka2-amd64-1.1,v1.12-debian-kafka2-amd64-1 \
	v1.12/debian-kinesis:v1.12.4-debian-kinesis-amd64-1.2,v1.12-debian-kinesis-amd64-1

#	<Dockerfile>:<version>,<tag1>,<tag2>,...

ARM64_IMAGES := \
	v1.12/arm64/debian-azureblob:v1.12.4-debian-azureblob-arm64-1.1,v1.12-debian-azureblob-arm64-1 \
	v1.12/arm64/debian-elasticsearch7:v1.12.4-debian-elasticsearch7-arm64-1.1,v1.12-debian-elasticsearch7-arm64-1,v1-debian-elasticsearch-arm64 \
	v1.12/arm64/debian-elasticsearch6:v1.12.4-debian-elasticsearch6-arm64-1.1,v1.12-debian-elasticsearch6-arm64-1 \
	v1.12/arm64/debian-loggly:v1.12.4-debian-loggly-arm64-1.1,v1.12-debian-loggly-arm64-1 \
	v1.12/arm64/debian-logentries:v1.12.4-debian-logentries-arm64-1.1,v1.12-debian-logentries-arm64-1 \
	v1.12/arm64/debian-cloudwatch:v1.12.4-debian-cloudwatch-arm64-1.4,v1.12-debian-cloudwatch-arm64-1 \
	v1.12/arm64/debian-stackdriver:v1.12.4-debian-stackdriver-arm64-1.1,v1.12-debian-stackdriver-arm64-1 \
	v1.12/arm64/debian-s3:v1.12.4-debian-s3-arm64-1.1,v1.12-debian-s3-arm64-1 \
	v1.12/arm64/debian-syslog:v1.12.4-debian-syslog-arm64-1.1,v1.12-debian-syslog-arm64-1 \
	v1.12/arm64/debian-forward:v1.12.4-debian-forward-arm64-1.1,v1.12-debian-forward-arm64-1 \
	v1.12/arm64/debian-gcs:v1.12.4-debian-gcs-arm64-1.1,v1.12-debian-gcs-arm64-1 \
	v1.12/arm64/debian-graylog:v1.12.4-debian-graylog-arm64-1.1,v1.12-debian-graylog-arm64-1 \
	v1.12/arm64/debian-papertrail:v1.12.4-debian-papertrail-arm64-1.1,v1.12-debian-papertrail-arm64-1 \
	v1.12/arm64/debian-logzio:v1.12.4-debian-logzio-arm64-1.1,v1.12-debian-logzio-arm64-1 \
	v1.12/arm64/debian-kafka:v1.12.4-debian-kafka-arm64-1.1,v1.12-debian-kafka-arm64-1 \
	v1.12/arm64/debian-kafka2:v1.12.4-debian-kafka2-arm64-1.1,v1.12-debian-kafka2-arm64-1 \
	v1.12/arm64/debian-kinesis:v1.12.4-debian-kinesis-arm64-1.2,v1.12-debian-kinesis-arm64-1

ALL_IMAGES := $(X86_IMAGES) $(ARM64_IMAGES)

comma := ,
empty :=
space := $(empty) $(empty)

# Default is first image from ALL_IMAGES list.
DOCKERFILE ?= $(word 1,$(subst :, ,$(word 1,$(ALL_IMAGES))))
TARGET ?= $(word 2,$(subst -, , $(DOCKERFILE)))

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

# Build Docker image.
#
# Usage:
#	make image [no-cache=(yes|no)] [DOCKERFILE=] [VERSION=]

no-cache-arg = $(if $(call eq, $(no-cache), yes), --no-cache, $(empty))

image:
	docker build $(no-cache-arg) -t $(IMAGE_NAME):$(VERSION) docker-image/$(DOCKERFILE)

# Tag Docker image with given tags.
#
# Usage:
#	make tags [VERSION=] [TAGS=t1,t2,...]

parsed-tags = $(subst $(comma), $(space), $(TAGS))

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

src: dockerfile gemfile fluent.conf systemd.conf prometheus.conf kubernetes.conf plugins post-push-hook post-checkout-hook entrypoint.sh

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
#	make container-image-template [FILE=] [DOCKERFILE=] [VERSION=]

container-image-template:
	mkdir -p docker-image/$(DOCKERFILE)/$(dir $(FILE))
	docker run --rm -i -v $(PWD)/templates/$(FILE).erb:/$(basename $(FILE)).erb:ro \
		ruby:alpine erb -U -T 1 \
			dockerfile='$(DOCKERFILE)' \
			version='$(VERSION)' \
		/$(basename $(FILE)).erb > docker-image/$(DOCKERFILE)/$(FILE)

# Render the given erb template for all images.
#
# Usage:
#	make container-image-template [FILE=] [DOCKERFILE=] [VERSION=]

container-image-template-all:
	(set -e ; $(foreach img,$(ALL_IMAGES), \
		make container-image-template $(FILE) \
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
	make container-image-template-all FILE=dockerfile

# Generate Gemfile and Gemfile.lock from template.
#
# Usage:
#	make gemfile [DOCKERFILE=] [VERSION=]
gemfile:
	make container-image-template FILE=Gemfile
	docker run --rm -i -v $(PWD)/docker-image/$(DOCKERFILE)/Gemfile:/Gemfile:ro \
		ruby:alpine sh -c "apk add --no-cache --quiet git && bundle lock --print --remove-platform x86_64-linux-musl --add-platform ruby" > docker-image/${DOCKERFILE}/Gemfile.lock
gemfile-all:
	make container-image-template-all FILE=gemfile

# Generate entrypoint.sh from template.
#
# Usage:
#	make entrypoint.sh [DOCKERFILE=] [VERSION=]

entrypoint.sh:
	make container-image-template FILE=entrypoint.sh
	chmod 755 docker-image/$(DOCKERFILE)/entrypoint.sh
entrypoint.sh-all:
	make container-image-template-all FILE=entrypoint.sh

# Generate fluent.conf from template.
#
# Usage:
#	make fluent.conf [DOCKERFILE=] [VERSION=]

fluent.conf:
	make container-image-template FILE=conf/fluent.conf
fluent.conf-all:
	make container-image-template-all FILE=fluent.conf

# Generate kubernetes.conf from template.
#
# Usage:
#	make kubernetes.conf [DOCKERFILE=] [VERSION=]

kubernetes.conf:
	make container-image-template FILE=conf/kubernetes.conf
	cp $(PWD)/templates/conf/tail_container_parse.conf docker-image/$(DOCKERFILE)/conf
kubernetes.conf-all:
	make container-image-template-all FILE=kubernetes.conf
	cp $(PWD)/templates/conf/tail_container_parse.conf docker-image/$(DOCKERFILE)/conf

systemd.conf:
	make container-image-template FILE=conf/systemd.conf

prometheus.conf:
	make container-image-template FILE=conf/prometheus.conf

README.md: templates/README.md.erb
	docker run --rm -i -v $(PWD)/templates/README.md.erb:/README.md.erb:ro \
		ruby:alpine erb -U -T 1 \
	                all_images='$(ALL_IMAGES)' \
		/README.md.erb > README.md

# Generate plugins for version
#
# Usage:
#    make plugins [DOCKERFILE=]

plugins:
	mkdir -p docker-image/$(DOCKERFILE)/plugins
	cp -R plugins/$(FLUENTD_VERSION)/shared/. docker-image/$(DOCKERFILE)/plugins/
	cp -R plugins/$(FLUENTD_VERSION)/$(TARGET)/. docker-image/$(DOCKERFILE)/plugins/

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
		mkdir -p $(DOCKERFILE)/hooks; \
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
	(set -e ; $(foreach img,$(ALL_IMAGES), \
		make post-checkout-hook \
			DOCKERFILE=$(word 1,$(subst :, ,$(img))) ; \
	))



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

# copy plugins required for all supported Docker images.
#
# Usage:
#	make plugins-all

plugins-all:
	(set -e ; $(foreach img,$(ALL_IMAGES), \
		make plugins \
			DOCKERFILE=$(word 1,$(subst :, ,$(img))) ; \
	))

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
        dockerfile dockerfile-all \
        gemfile gemfile-all \
        entrypoint.sh entrypoint.sh-all \
        fluent.conf fluent.conf-all \
        kubernetes.conf kubernetes.conf-all\
        plugins plugins-all \
        post-push-hook post-push-hook-all \
        post-checkout-hook post-checkout-hook-all \
	README.md
