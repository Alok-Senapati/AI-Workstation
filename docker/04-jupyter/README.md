# AI Workstation - Jupyter Layer

## Purpose

Provides JupyterLab on top of the AI Workstation images.

The same Dockerfile is used to build:

- ai-jupyter-pytorch
- ai-jupyter-tensorflow

using different base images.

---

## Build

### PyTorch

```bash
make build-jupyter-pytorch
```

### TensorFlow

```bash
make build-jupyter-tensorflow
```

---

## Verify

```bash
make verify-jupyter-pytorch
```

```bash
make verify-jupyter-tensorflow
```

---

## Images

- ai-jupyter-pytorch:1.0.0
- ai-jupyter-tensorflow:1.0.0