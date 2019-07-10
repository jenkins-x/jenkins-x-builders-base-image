#!/usr/bin/env bash
set -e
set -u 

echo "Building base images"

cat /workspace/source/Dockerfile.common > /workspace/source/Dockerfile.base.generated

function build_image {
  name=$1
  echo "pack $name uses base image"

  # generate a docker image
  cat /workspace/source/Dockerfile.common > /workspace/source/Dockerfile.$name.generated
  cat /workspace/source/Dockerfile.$name >> /workspace/source/Dockerfile.$name.generated
}

build_image "machinelearning"
build_image "machinelearninggpu"
