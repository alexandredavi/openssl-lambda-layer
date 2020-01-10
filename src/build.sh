#!/bin/sh

rm layer/layer.zip

docker image build -t openssl-layer .

docker run --rm -v "$PWD"layer/:/tmp/layer openssl-layer
