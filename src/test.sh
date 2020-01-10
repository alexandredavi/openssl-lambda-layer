#!/bin/sh

rm -rf layer/files && unzip layer/layer.zip -d layer/files

docker run --rm -v "$PWD"test/:/var/task -v "$PWD"layer/files:/opt lambci/lambda:nodejs10.x index.handler

