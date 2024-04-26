#!/bin/sh

rm -rf layer/files && unzip layer/layer.zip -d layer/files

docker run -p 8080:8080 --platform linux/amd64 --rm -v "$PWD"/test/:/var/task -v "$PWD"/layer/files:/opt public.ecr.aws/lambda/nodejs:18 index.handler

# Send a test event to the Lambda function
# curl -XPOST "http://localhost:8080/2015-03-31/functions/function/invocations" -d '{"payload":"hello world!"}'