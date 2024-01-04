FROM ubuntu:20.04 as builder
LABEL org.opencontainers.image.title="zec-client"
LABEL org.opencontainers.image.maintainer="contact@ikna.io"
LABEL org.opencontainers.image.url="https://www.ikna.io/"
LABEL org.opencontainers.image.description="Dockerized Zcash client"
LABEL org.opencontainers.image.source="https://github.com/graphsense/zec-client"

ARG VERSION=5.8.0

ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        apt-transport-https \
        ca-certificates \
        gnupg2 \
        wget && \
    wget -qO - https://apt.z.cash/zcash.asc | gpg2 --import && \
    gpg2 --export B1C9095EAA1848DBB54D9DDA1D05FDC66B372CFE | apt-key add - && \
    echo "deb [arch=amd64] https://apt.z.cash/ bullseye main" | tee /etc/apt/sources.list.d/zcash.list && \
    apt-get update && \
    apt-get install zcash=$VERSION

FROM ubuntu:20.04

ARG UID=10000

COPY --from=builder /usr/bin/zcash* /usr/local/bin/
ADD docker/client.conf /opt/graphsense/client.conf

RUN apt-get update && \
    apt-get install --no-install-recommends -y wget ca-certificates && \
    useradd -m -u $UID dockeruser && \
    mkdir -p /opt/graphsense/data && \
    chown dockeruser -R /opt/graphsense
# Deprecated since 5.7.0
#    zcash-fetch-params && \
#    mv /root/.zcash-params/ /home/dockeruser/.zcash-params && \
#    chown dockeruser:dockeruser /home/dockeruser/.zcash-params

USER dockeruser
EXPOSE 8632
CMD ["zcashd", "-conf=/opt/graphsense/client.conf", "-datadir=/opt/graphsense/data", "-rest", "-printtoconsole"]
