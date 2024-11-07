FROM amazonlinux:2023

RUN dnf -y install zip
RUN dnf -y install openssl

RUN mkdir -p /tmp/layer

COPY build-layer.sh build-layer.sh

ENTRYPOINT ["/bin/bash"]

CMD ["build-layer.sh"]
