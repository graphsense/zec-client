FROM ubuntu:20.04 as builder
LABEL maintainer="contact@graphsense.info"

ENV TZ=UTC
ADD docker/Makefile /tmp/Makefile
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        automake \
        autoconf \
        autotools-dev \
        binutils \
        bsdmainutils \
        build-essential \
        ca-certificates \
        curl \
        git \
        libevent-dev \
        libgomp1 \
        libssl-dev \
        libtool \
        m4 \
        pkg-config \
        procps \
        unzip \
        wget \
        zlib1g-dev && \
    cd /tmp && \
    make install && \
    strip /usr/local/bin/zcash*

FROM ubuntu:20.04

COPY --from=builder /usr/local/bin/zcash* /usr/local/bin/
COPY --from=builder /root/.zcash-params /home/dockeruser/.zcash-params

ADD docker/zcash.conf /opt/graphsense/zcash.conf

RUN apt-get update && \
    apt-get install --no-install-recommends -y libgomp1 && \
    useradd -r -u 10000 dockeruser && \
    mkdir -p /opt/graphsense/data && \
    chown dockeruser -R /opt/graphsense

USER dockeruser
EXPOSE 8632
