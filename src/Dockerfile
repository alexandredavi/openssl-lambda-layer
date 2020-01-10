FROM amazonlinux

RUN yum install openssl -y
RUN yum install zip -y
RUN mkdir -p /tmp/layer

CMD cd /tmp/layer && \
    mkdir -p bin && \
    mkdir -p lib && \
    cp /bin/openssl ./bin && \
    cp /usr/lib64/libbz2.so.1 ./lib && \
    zip -r layer.zip ./* && \
    rm -rf lib bin
