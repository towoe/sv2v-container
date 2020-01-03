IMAGE_NAME ?= towoe/sv2v
BUILD_OPTS ?= --network host
CONTAINER_TOOL ?= podman

image: Containerfile
	@$(CONTAINER_TOOL) build $(BUILD_OPTS) -t $(IMAGE_NAME) .

