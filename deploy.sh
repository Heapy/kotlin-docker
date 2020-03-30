#!/bin/bash

set -e

echo "-> Login to docker hub"
echo "${DOCKER_TOKEN}" | docker login -u "${DOCKER_USERNAME}" --password-stdin

echo "-> Pushing image heapy/kotlin-docker:${TRAVIS_TAG} to docker hub"
docker push heapy/kotlin-docker
