# AI Workstation - Science Layer

## Purpose

The Science layer extends the Python layer by providing the core scientific
computing ecosystem required for machine learning, analytics, data
engineering and exploratory analysis.

## Base Image

- ai-python:1.0.0

---

## Responsibilities

- Create a shared virtual environment
- Install scientific Python libraries
- Keep Ubuntu system Python untouched
- Provide reusable dependencies for higher layers

---

## Virtual Environment

```
/opt/venv
```

All subsequent images inherit this environment.

---

## Installed Packages

- NumPy
- Pandas
- SciPy
- Scikit-Learn
- Matplotlib
- PyArrow
- Polars
- DuckDB

---

## Does NOT include

- PyTorch
- TensorFlow
- JupyterLab
- MLflow

---

## Build

```bash
make build-science
```

---

## Verify

```bash
make verify-science
```

---

## Run

```bash
make run-science
```

---

## Acceptance Criteria

- [x] Shared virtual environment created
- [x] NumPy installed
- [x] Pandas installed
- [x] SciPy installed
- [x] Scikit-Learn installed
- [x] Matplotlib installed
- [x] PyArrow installed
- [x] Polars installed
- [x] DuckDB installed
- [x] Verification passes