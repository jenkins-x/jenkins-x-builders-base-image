#!/usr/bin/env bash
set -e
set -u 

echo "Building base images"

cat /workspace/source/Dockerfile.common > /workspace/source/Dockerfile.base.generated

