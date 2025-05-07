FROM zfnd/zebra:v2.3.0
LABEL org.opencontainers.image.title="zec-client"
LABEL org.opencontainers.image.maintainer="contact@ikna.io"
LABEL org.opencontainers.image.url="https://www.ikna.io/"
LABEL org.opencontainers.image.description="Dockerized Zcash client"
LABEL org.opencontainers.image.source="https://github.com/graphsense/zec-client"


ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apt-get update
ARG UID=10000

ADD docker/zebrad-config.toml /opt/graphsense/zebrad-config.toml

# RUN apt-get update && \
#     apt-get install --no-install-recommends -y wget ca-certificates && \
#     useradd -m -u $UID dockeruser && \
#     mkdir -p /opt/graphsense/data && \
#     chown dockeruser -R /opt/graphsense

# USER dockeruser
EXPOSE 8632

ENTRYPOINT zebrad -c=/opt/graphsense/zebrad-config.toml