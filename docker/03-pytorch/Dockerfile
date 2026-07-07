FROM ai-science:1.0.0

LABEL org.opencontainers.image.title="AI Workstation PyTorch"
LABEL org.opencontainers.image.description="GPU-enabled PyTorch layer"
LABEL org.opencontainers.image.version="1.0.0"

ENV VIRTUAL_ENV=/opt/venv
ENV PATH="/opt/venv/bin:${PATH}"

RUN uv pip install \
    --index-url https://download.pytorch.org/whl/cu128 \
    torch \
    torchvision \
    torchaudio

WORKDIR /workspace

ENTRYPOINT ["/usr/bin/tini","--"]

CMD ["bash"]