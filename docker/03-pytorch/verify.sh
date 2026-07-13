#!/usr/bin/env bash

set -e

echo "=============================="
echo "AI Workstation PyTorch Verification"
echo "=============================="

python <<EOF
import os
import torch

print(f"PyTorch Version : {torch.__version__}")
print(f"CUDA Available  : {torch.cuda.is_available()}")

if os.getenv("ML_STUDIO_CI") == "1":
    x = torch.randn((1024, 1024))
    y = torch.randn((1024, 1024))
    z = x @ y

    print(f"Tensor Device   : {z.device}")
    print("GPU execution check skipped because ML_STUDIO_CI=1")

elif torch.cuda.is_available():
    print(f"CUDA Version    : {torch.version.cuda}")
    print(f"GPU Count       : {torch.cuda.device_count()}")
    print(f"GPU Name        : {torch.cuda.get_device_name(0)}")

    x = torch.randn((2048,2048), device="cuda")
    y = torch.randn((2048,2048), device="cuda")

    z = x @ y

    print(f"Tensor Device   : {z.device}")
    print("Matrix Multiplication : SUCCESS")

else:
    raise RuntimeError("CUDA is NOT available")

print()
print("Verification Completed Successfully")
EOF
