IMAGE_BASE=ai-base
BASE_VERSION=1.0.0

IMAGE_PYTHON=ai-python
PYTHON_VERSION=1.0.0

IMAGE_SCIENCE=ai-science
SCIENCE_VERSION=1.0.0

IMAGE_PYTORCH=ai-pytorch
PYTORCH_VERSION=1.0.0

IMAGE_TENSORFLOW=ai-tensorflow
TENSORFLOW_VERSION=1.0.0

IMAGE_PT=ai-jupyter-pytorch:1.0.0
IMAGE_TF=ai-jupyter-tensorflow:1.0.0

inspect-base:
	docker inspect $(IMAGE_BASE):$(BASE_VERSION)

history-base:
	docker history $(IMAGE_BASE):$(BASE_VERSION)

clean-base:
	docker image rm $(IMAGE_BASE):$(BASE_VERSION)

build-base:
	docker build -t $(IMAGE_BASE):$(BASE_VERSION) \
		-f docker/00-base/Dockerfile \
		docker/00-base

run-base:
	docker run --rm -it $(IMAGE_BASE):$(BASE_VERSION)

verify-base:
	docker run --rm \
		-v $(PWD)/docker/00-base:/workspace \
		-w /workspace \
		$(IMAGE_BASE):$(BASE_VERSION) \
		bash verify.sh

build-python:
	docker build \
	-t $(IMAGE_PYTHON):$(PYTHON_VERSION) \
	-f docker/01-python/Dockerfile \
	docker/01-python

run-python:
	docker run --rm -it \
	$(IMAGE_PYTHON):$(PYTHON_VERSION)

verify-python:
	docker run --rm \
	-v $(PWD)/docker/01-python:/workspace \
	-w /workspace \
	$(IMAGE_PYTHON):$(PYTHON_VERSION) \
	bash verify.sh

build-science:
	docker build \
		-t $(IMAGE_SCIENCE):$(SCIENCE_VERSION) \
		-f docker/02-science/Dockerfile \
		docker/02-science

run-science:
	docker run --rm -it \
		$(IMAGE_SCIENCE):$(SCIENCE_VERSION)

verify-science:
	docker run --rm \
		-v $(PWD)/docker/02-science:/workspace \
		-w /workspace \
		$(IMAGE_SCIENCE):$(SCIENCE_VERSION) \
		bash verify.sh

build-pytorch:
	docker build \
		-t $(IMAGE_PYTORCH):$(PYTORCH_VERSION) \
		-f docker/03-pytorch/Dockerfile \
		docker/03-pytorch

run-pytorch:
	docker run --rm -it --gpus all \
		$(IMAGE_PYTORCH):$(PYTORCH_VERSION)

verify-pytorch:
	docker run --rm --gpus all \
		-v $(PWD)/docker/03-pytorch:/workspace \
		-w /workspace \
		$(IMAGE_PYTORCH):$(PYTORCH_VERSION) \
		bash verify.sh

build-tensorflow:
	docker build \
		-t $(IMAGE_TENSORFLOW):$(TENSORFLOW_VERSION) \
		-f docker/03-tensorflow/Dockerfile \
		docker/03-tensorflow

run-tensorflow:
	docker run --rm -it --gpus all \
		$(IMAGE_TENSORFLOW):$(TENSORFLOW_VERSION)

verify-tensorflow:
	docker run --rm --gpus all \
		-v $(PWD)/docker/03-tensorflow:/workspace \
		-w /workspace \
		$(IMAGE_TENSORFLOW):$(TENSORFLOW_VERSION) \
		bash verify.sh

build-all: build-base build-python build-science build-pytorch build-tensorflow

verify-all: verify-base verify-python verify-science verify-pytorch verify-tensorflow

shell-base:
	docker run --rm -it ai-base:1.0.0

shell-python:
	docker run --rm -it ai-python:1.0.0

shell-science:
	docker run --rm -it ai-science:1.0.0

shell-pytorch:
	docker run --rm -it --gpus all ai-pytorch:1.0.0

shell-tensorflow:
	docker run --rm -it --gpus all ai-tensorflow:1.0

build-jupyter-pytorch:
	docker build \
	--build-arg BASE_IMAGE=ai-pytorch:1.0.0 \
	-t $(IMAGE_PT) \
	-f docker/04-jupyter/Dockerfile .

build-jupyter-tensorflow:
	docker build \
	--build-arg BASE_IMAGE=ai-tensorflow:1.0.0 \
	-t $(IMAGE_TF) \
	-f docker/04-jupyter/Dockerfile .

verify-jupyter-pytorch:
	docker run --rm \
	-v $(PWD)/docker/04-jupyter:/workspace \
	-w /workspace \
	$(IMAGE_PT) \
	bash verify.sh

verify-jupyter-tensorflow:
	docker run --rm \
	-v $(PWD)/docker/04-jupyter:/workspace \
	-w /workspace \
	$(IMAGE_TF) \
	bash verify.sh