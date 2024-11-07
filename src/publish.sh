#!/bin/bash

LAYER_NAME=openssl-lambda

REGIONS="$(aws ssm get-parameters-by-path --path /aws/service/global-infrastructure/services/lambda/regions \
  --query 'Parameters[].Value' --output text | tr '[:blank:]' '\n' | grep -v -e ^cn- -e ^us-gov- | sort -r)"

for region in $REGIONS; do
  aws lambda add-layer-version-permission --region $region --layer-name $LAYER_NAME \
    --statement-id sid1 --action lambda:GetLayerVersion --principal '*' \
    --version-number $(aws lambda publish-layer-version --region $region --layer-name $LAYER_NAME \
      --zip-file fileb://layer/layer.zip --cli-read-timeout 0 --cli-connect-timeout 0 \
      --description "OpenSSL binaries for Amazon Linux 2 Lambdas" --query Version --output text)
done
