#!/bin/sh

DOCKER_ARGS=$@

LAMBDA_RUNTIMES="public.ecr.aws/lambda/python:3.12 public.ecr.aws/lambda/nodejs:latest"

LAYER_ZIP=$(ls layer/layer-*.zip | tail -n 1)

rm -rf layer/files && unzip $LAYER_ZIP -d layer/files

# Overriding LD_LIBRARY_PATH required for nodejs image to bypass the .so files already present there
for runtime in $LAMBDA_RUNTIMES
do
	docker pull $DOCKER_ARGS $runtime
	docker run \
		$DOCKER_ARGS \
		--rm \
		--name lambda-openssl-layer-test \
		-p 9000:8080 \
		-e LD_LIBRARY_PATH=/opt/lib:/var/lang/lib:/lib64:/usr/lib64:/var/runtime:/var/runtime/lib:/var/task:/var/task/lib \
		-v "$PWD"/test/:/var/task \
		-v "$PWD"/layer/files:/opt \
		$runtime \
		index.handler &

	sleep 2

	curl -v -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'

	docker kill lambda-openssl-layer-test
done

