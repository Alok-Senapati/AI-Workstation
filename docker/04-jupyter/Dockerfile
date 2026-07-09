ARG BASE_IMAGE

FROM ${BASE_IMAGE}

LABEL org.opencontainers.image.title="AI Workstation Jupyter"
LABEL org.opencontainers.image.description="JupyterLab environment"
LABEL org.opencontainers.image.version="1.0.0"
LABEL org.opencontainers.image.licenses="MIT"

RUN uv pip install \
    jupyterlab \
    notebook \
    ipykernel \
    jupyterlab-git \
    ipywidgets \
    plotly

EXPOSE 8888

WORKDIR /workspace

CMD ["jupyter","lab","--ip=0.0.0.0","--no-browser","--allow-root","--NotebookApp.token="]