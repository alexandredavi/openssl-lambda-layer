FROM amazonlinux

RUN yum install openssl11 -y
RUN yum install zip -y
RUN mkdir -p /tmp/layer

CMD cd /tmp/layer && \
    mkdir -p bin && \
    mkdir -p lib && \
    cp /bin/openssl11 ./bin/openssl && \
    cp /usr/lib64/libbz2.so.1 ./lib && \
    cp /usr/lib64/libssl.so.1.1 ./lib && \
    cp /usr/lib64/libcrypto.so.1.1 ./lib && \
    zip -r layer.zip ./* && \
    rm -rf lib bin
