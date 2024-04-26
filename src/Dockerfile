FROM amazonlinux:2

RUN yum update -y && \
    yum groupinstall "Development Tools" -y && \
    yum install -y openssl-devel libffi-devel bzip2-devel

# Download and compile OpenSSL
RUN curl -O https://www.openssl.org/source/openssl-1.1.1l.tar.gz && \
    tar -xzf openssl-1.1.1l.tar.gz && \
    cd openssl-1.1.1l && \
    ./config --prefix=/opt/openssl --openssldir=/opt/openssl shared zlib && \
    make && make install

# Set up the directory structure for the Lambda layer
RUN mkdir -p /opt/layer/bin /opt/layer/lib
RUN cp /opt/openssl/bin/openssl /opt/layer/bin && \
    cp /opt/openssl/lib/libssl.so.1.1 /opt/layer/lib && \
    cp /opt/openssl/lib/libcrypto.so.1.1 /opt/layer/lib && \
    cp /usr/lib64/libbz2.so.1 /opt/layer/lib && \
    cp /usr/lib64/libc.so.6 /opt/layer/lib && \
    cp /usr/lib64/libdl.so.2 /opt/layer/lib && \
    cp /usr/lib64/libpthread.so.0 /opt/layer/lib

# Package the layer
WORKDIR /opt/layer
RUN zip -r /opt/openssl_layer.zip .

CMD ["cat", "/opt/openssl_layer.zip"]