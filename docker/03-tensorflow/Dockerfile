FROM nvidia/cuda:12.5.1-cudnn-runtime-ubuntu22.04

LABEL org.opencontainers.image.title="AI Workstation TensorFlow"
LABEL org.opencontainers.image.description="Standalone TensorFlow GPU image"
LABEL org.opencontainers.image.version="1.0.0"
LABEL org.opencontainers.image.licenses="MIT"

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV PIP_NO_CACHE_DIR=1
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# ------------------------------------------------------------------
# System Packages
# ------------------------------------------------------------------
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        python3-venv \
        git \
        curl \
        wget \
        ca-certificates \
        tini && \
    rm -rf /var/lib/apt/lists/*

# ------------------------------------------------------------------
# Install uv
# ------------------------------------------------------------------
ADD https://astral.sh/uv/install.sh /tmp/uv-installer.sh

RUN chmod +x /tmp/uv-installer.sh && \
    /tmp/uv-installer.sh && \
    rm /tmp/uv-installer.sh

ENV PATH="/root/.local/bin:${PATH}"

# ------------------------------------------------------------------
# Install Python 3.12 using uv
# ------------------------------------------------------------------
RUN uv python install 3.12

# ------------------------------------------------------------------
# Create virtual environment
# ------------------------------------------------------------------
RUN uv venv /opt/venv --python 3.12

ENV VIRTUAL_ENV=/opt/venv
ENV PATH="/opt/venv/bin:${PATH}"

# ------------------------------------------------------------------
# Install Scientific Stack
# ------------------------------------------------------------------
RUN uv pip install \
    "numpy~=2.3" \
    "pandas~=2.3" \
    "scipy~=1.16" \
    "scikit-learn~=1.7" \
    "matplotlib~=3.10" \
    "pyarrow~=21.0" \
    "polars~=1.32" \
    "duckdb~=1.3"

# ------------------------------------------------------------------
# Install TensorFlow
# ------------------------------------------------------------------
RUN uv pip install tensorflow

# ------------------------------------------------------------------
# Workspace
# ------------------------------------------------------------------
WORKDIR /workspace

ENTRYPOINT ["/usr/bin/tini","--"]
CMD ["bash"]