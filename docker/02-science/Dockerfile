FROM ai-python:1.0.0

LABEL org.opencontainers.image.title="AI Workstation Science"
LABEL org.opencontainers.image.description="Scientific Python layer"
LABEL org.opencontainers.image.version="1.0.0"

# Create shared virtual environment
RUN uv venv /opt/venv

ENV VIRTUAL_ENV=/opt/venv
ENV PATH="/opt/venv/bin:${PATH}"

# Install scientific computing stack
RUN uv pip install \
    "numpy~=2.3" \
    "pandas~=2.3" \
    "scipy~=1.16" \
    "scikit-learn~=1.7" \
    "matplotlib~=3.10" \
    "pyarrow~=21.0" \
    "polars~=1.32" \
    "duckdb~=1.3"

WORKDIR /workspace

ENTRYPOINT ["/usr/bin/tini","--"]

CMD ["bash"]