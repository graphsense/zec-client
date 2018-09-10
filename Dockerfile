FROM bitnami/minideb:stretch
LABEL maintainer="rainer.stuetz@ait.ac.at"

RUN useradd -r -u 10000 dockeruser && \
    mkdir -p /opt/graphsense/data && \
    chown dockeruser /opt/graphsense && \
    # packages
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
        zlib1g-dev

ADD docker/zcash.conf /opt/graphsense/zcash.conf
ADD docker/Makefile /tmp/Makefile
RUN cd /tmp && \
    make install && \
    cd / && \
    rm -rf /tmp/src && \
    apt-get autoremove --purge -y \
        autoconf \
        automake \
        binutils \
        build-essential \
        gcc \
        git \
        libevent-dev \
        libgcc-6-dev \
        libssl-dev \
        perl \
        zlib1g-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /home/dockeruser && \
    mv /root/.zcash-params /home/dockeruser && \
    chown -R dockeruser /home/dockeruser

USER dockeruser
EXPOSE 8632

CMD zcashd -conf=/opt/graphsense/zcash.conf -datadir=/opt/graphsense/data -daemon -rest && bash
