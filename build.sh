#!/bin/bash -e

if [[ ! -z "$TRAVIS_TAG" ]]; then
  docker build --build-arg "KOTLIN_VERSION=${TRAVIS_TAG}" -t "heapy/kotlin-docker:${TRAVIS_TAG}" -t "heapy/kotlin-docker:latest" ./
else
  echo "Skipping Docker Build"
fi
