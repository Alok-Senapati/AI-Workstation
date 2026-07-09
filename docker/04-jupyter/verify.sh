#!/bin/bash

echo "=============================="
echo "AI Workstation Jupyter Verification"
echo "=============================="

jupyter --version

python - <<EOF
import jupyterlab
print("JupyterLab :", jupyterlab.__version__)
EOF

echo
echo "Verification Completed Successfully"