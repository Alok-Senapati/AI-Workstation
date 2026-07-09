#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
ROOT_DIR=$(cd -- "${SCRIPT_DIR}/../.." && pwd)

cd "${ROOT_DIR}"

VERSION=${VERSION:-1.0.0}
DEFAULT_OWNER=${GITHUB_REPOSITORY_OWNER:-}
DEFAULT_OWNER=$(printf '%s' "${DEFAULT_OWNER}" | tr '[:upper:]' '[:lower:]')
IMAGE_NAMESPACE=${IMAGE_NAMESPACE:-ghcr.io/${DEFAULT_OWNER}}
IMAGE_NAMESPACE=$(printf '%s' "${IMAGE_NAMESPACE}" | tr '[:upper:]' '[:lower:]')
SHORT_SHA=$(printf '%.7s' "${GITHUB_SHA:-$(git rev-parse HEAD)}")

if [[ -z "${IMAGE_NAMESPACE}" || "${IMAGE_NAMESPACE}" == "ghcr.io/" ]]; then
    echo "IMAGE_NAMESPACE or GITHUB_REPOSITORY_OWNER must be set."
    exit 1
fi

declare -a publish_tags=("sha-${SHORT_SHA}")

if [[ "${GITHUB_REF_TYPE:-}" == "branch" && "${GITHUB_REF_NAME:-}" == "main" ]]; then
    publish_tags+=("edge")
fi

if [[ "${GITHUB_REF_TYPE:-}" == "tag" ]]; then
    version_tag=${GITHUB_REF_NAME#v}
    publish_tags+=("${version_tag}" "latest")

    IFS='.' read -r major minor patch <<<"${version_tag}"

    if [[ -n "${major:-}" ]]; then
        publish_tags+=("${major}")
    fi

    if [[ -n "${major:-}" && -n "${minor:-}" ]]; then
        publish_tags+=("${major}.${minor}")
    fi
fi

declare -A seen_tags=()
declare -a unique_tags=()

for tag in "${publish_tags[@]}"; do
    if [[ -z "${seen_tags[${tag}]+x}" ]]; then
        seen_tags["${tag}"]=1
        unique_tags+=("${tag}")
    fi
done

declare -a images=(
    "ai-base|ai-base:${VERSION}"
    "ai-python|ai-python:${VERSION}"
    "ai-science|ai-science:${VERSION}"
    "ai-pytorch|ai-pytorch:${VERSION}"
    "ai-tensorflow|ai-tensorflow:${VERSION}"
    "ai-jupyter-pytorch|ai-jupyter-pytorch:${VERSION}"
    "ai-jupyter-tensorflow|ai-jupyter-tensorflow:${VERSION}"
    "ai-mlflow|ai-mlflow:${VERSION}"
)

for image in "${images[@]}"; do
    IFS='|' read -r image_name local_ref <<<"${image}"

    for tag in "${unique_tags[@]}"; do
        remote_ref="${IMAGE_NAMESPACE}/${image_name}:${tag}"
        echo "Publishing ${remote_ref}"
        docker tag "${local_ref}" "${remote_ref}"
        docker push "${remote_ref}"
    done
done
