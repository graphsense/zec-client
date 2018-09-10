#!/bin/sh

if ! [ -n "$1" ] ; then
    echo "Please provide directory for blockchain data."
fi

docker stop zcash
docker rm zcash

chown -R dockeruser "$1"

docker run --restart=always -d --name zcash \
    -p 8632:8632 \
    -v "$1":/opt/graphsense/data \
    -it zcash
docker ps
