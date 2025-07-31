ts=$(date +%s)
cd /tmp/layer && \
    mkdir -p bin && \
    mkdir -p lib && \
    cp /bin/openssl ./bin/openssl && \
    cp /usr/lib64/libbz2.so.1 ./lib && \
    cp /usr/lib64/libssl.so.3 ./lib && \
    cp /usr/lib64/libcrypto.so.3 ./lib && \
    zip -r layer-${ts}.zip ./* && \
    rm -rf lib bin
