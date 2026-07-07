#!/usr/bin/env bash

set -e

echo "=============================="
echo "AI Workstation Science Verification"
echo "=============================="

echo
echo "Python"
python --version

echo
echo "Pip"
pip --version

echo
echo "UV"
uv --version

echo
echo "Virtual Environment"
echo "$VIRTUAL_ENV"

echo
echo "Python Executable"
which python

echo
echo "Scientific Libraries"

python <<EOF
import numpy
import pandas
import scipy
import sklearn
import pyarrow
import polars
import duckdb
import matplotlib

print(f"NumPy       : {numpy.__version__}")
print(f"Pandas      : {pandas.__version__}")
print(f"SciPy       : {scipy.__version__}")
print(f"ScikitLearn : {sklearn.__version__}")
print(f"PyArrow     : {pyarrow.__version__}")
print(f"Polars      : {polars.__version__}")
print(f"DuckDB      : {duckdb.__version__}")
print(f"Matplotlib  : {matplotlib.__version__}")
EOF

python -c "import sys; print(sys.executable)"
python -c "import site; print(site.getsitepackages())"

echo
echo "Verification Completed Successfully"