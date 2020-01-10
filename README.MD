# OpenSSL binaries for AWS Lambda

A [layer](https://aws.amazon.com/about-aws/whats-new/2018/11/aws-lambda-now-supports-custom-runtimes-and-layers/)
for AWS Lambda that allows your functions to use `openssl` binaries.

## Getting Started

You can add this layer to any Lambda function you want.
`PATH` already includes `/opt/bin` in Lambda, which is where it will be mounted.

Click on Layers and choose "Add a layer", and "Provide a layer version
ARN" and enter the following ARN (replace `us-east-1` with the region of your Lambda):

```
arn:aws:lambda:us-east-1:034541671702:layer:openssl-lambda:1
```

![Provide layer ARN](https://raw.githubusercontent.com/alexandredavi/openssl-lambda-layer/master/img/provide.PNG "Provide layer ARN screenshot")

Then click Add, save your lambda and test it out!

![Referenced layers](https://raw.githubusercontent.com/alexandredavi/openssl-lambda-layer/master/img/referenced.PNG "Referenced layer ARN screenshot")

## Simple example on Node.js

```js
const { execSync } = require('child_process')

exports.handler = async(event) => {
  execSync(' openssl genrsa -out testCert.key 2048', { encoding: 'utf8', stdio: 'inherit' })
}
```
