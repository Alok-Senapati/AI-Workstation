#!/usr/bin/env bash

set -e

echo "=============================="
echo "AI Workstation TensorFlow Verification"
echo "=============================="

python <<EOF
import tensorflow as tf

print(f"TensorFlow Version : {tf.__version__}")

print()

gpus = tf.config.list_physical_devices("GPU")

print("GPUs Found :", len(gpus))

if not gpus:
    raise RuntimeError("TensorFlow cannot detect GPU")

print("GPU:", gpus[0].name)

print()

with tf.device("/GPU:0"):
    a = tf.random.normal((2048,2048))
    b = tf.random.normal((2048,2048))
    c = tf.matmul(a,b)

print("Tensor Device :", c.device)

print()

print("Verification Completed Successfully")
EOF