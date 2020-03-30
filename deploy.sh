#!/bin/bash

echo "-> Login to docker hub"
echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin

echo "-> Pushing image heapy/kotlin-docker:${TRAVIS_TAG} to docker hub"
docker push heapy/kotlin-docker
