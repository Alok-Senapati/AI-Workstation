#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
ROOT_DIR=$(cd -- "${SCRIPT_DIR}/../.." && pwd)

cd "${ROOT_DIR}"

# CI runners do not expose GPUs, so GPU images use their CI-specific checks.
make verify-ci
