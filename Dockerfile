FROM ubuntu:20.04 as builder
LABEL maintainer="contact@graphsense.info"

ARG VERSION=4.5.1+1

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
    gpg2 --export 3FE63B67F85EA808DE9B880E6DEF3BAF272766C0 | apt-key add - && \
    echo "deb [arch=amd64] https://apt.z.cash/ stretch main" | tee /etc/apt/sources.list.d/zcash.list && \
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
    chown dockeruser -R /opt/graphsense && \
    zcash-fetch-params && \
    mv /root/.zcash-params/ /home/dockeruser/.zcash-params && \
    chown dockeruser:dockeruser /home/dockeruser/.zcash-params

USER dockeruser
EXPOSE 8632
CMD ["zcashd", "-conf=/opt/graphsense/client.conf", "-datadir=/opt/graphsense/data", "-rest", "-printtoconsole"]
