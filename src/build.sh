#!/bin/sh

rm layer/layer.zip
mkdir layer

docker image build --platform linux/amd64 -t openssl-layer .

docker run --platform linux/amd64 --rm -v "$PWD"/layer/:/tmp/layer openssl-layer > layer/layer.zip
