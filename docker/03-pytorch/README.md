# AI Workstation - PyTorch Layer

## Purpose

The PyTorch layer extends the Science layer by adding GPU-enabled deep learning capabilities.

## Base Image

- ai-science:1.0.0

---

## Responsibilities

- Install PyTorch
- Install TorchVision
- Install TorchAudio
- Verify CUDA support
- Verify GPU execution

---

## Installed Packages

- torch
- torchvision
- torchaudio

---

## Does NOT include

- TensorFlow
- JupyterLab
- MLflow

---

## Build

```bash
make build-pytorch
```

## Verify

```bash
make verify-pytorch
```

## Run

```bash
make run-pytorch
```

---

## Acceptance Criteria

- [x] PyTorch installed
- [x] TorchVision installed
- [x] TorchAudio installed
- [x] CUDA detected
- [x] GPU detected
- [x] Tensor allocation successful
- [x] Matrix multiplication successful