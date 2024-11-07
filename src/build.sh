#!/bin/sh

DOCKER_ARGS=$@

rm -rf layer >/dev/null 2>&1
mkdir layer

docker image build $DOCKER_ARGS -t openssl-layer .

docker run --rm $DOCKER_ARGS -v "$PWD"/layer/:/tmp/layer openssl-layer
