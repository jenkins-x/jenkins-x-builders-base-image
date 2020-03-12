#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

jx step create pr docker \
    --name gcr.io/jenkinsxio/builder-baseimage \
    --version ${VERSION} \
    --repo https://github.com/jenkins-x/jenkins-x-builders-base.git

jx step create pr docker \
    --name gcr.io/jenkinsxio/builder-ruby-baseimage \
    --version ${VERSION} \
    --repo https://github.com/jenkins-x/jenkins-x-builders-base.git

jx step create pr docker \
    --name gcr.io/jenkinsxio/builder-swift-baseimage \
    --version ${VERSION} \
    --repo https://github.com/jenkins-x/jenkins-x-builders-base.git
