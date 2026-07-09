# AI Workstation - TensorFlow Layer

## Purpose

Provides a standalone TensorFlow GPU environment based on CUDA 12.5.

Unlike the PyTorch layer, TensorFlow currently requires CUDA 12.x, so this image is built independently from the PyTorch stack.

---

## Base Image

nvidia/cuda:12.5.1-cudnn-runtime-ubuntu22.04

---

## Installed

- Python (managed by uv)
- TensorFlow
- NumPy
- Pandas
- SciPy
- Scikit-Learn
- Matplotlib
- PyArrow
- Polars
- DuckDB

---

## Build

```bash
make build-tensorflow
```

---

## Verify

```bash
make verify-tensorflow
```

Expected output:

- TensorFlow version
- GPU detected
- Tensor operation executed on GPU

---

## Image

```
ai-tensorflow:1.0.0
```