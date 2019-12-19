#!/bin/sh

if ! [ -n "$1" ] ; then
    echo "Please provide directory for blockchain data."
    exit 1
fi

docker stop zcash
docker rm zcash

chown -R dockeruser "$1"

docker run --restart=always -d --name zcash \
    --cap-drop all \
    -p 8632:8632 \
    -v "$1":/opt/graphsense/data \
    -it zcash
docker ps
