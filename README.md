# Zcash Docker container

A Docker container running [Zcash][zcash] as a service via the
[Zebra][zebra] full node and exposing the RPC API.

> **Breaking change (v26.07.0):** the mainline now ships [Zebra][zebra]
> instead of `zcashd`. Switching from a `zcashd`-based image **requires a
> full resync** — the on-disk state is not compatible. The legacy
> `zcashd` variant is kept for maintenance on the [`zcashd`](https://github.com/graphsense/zec-client/tree/zcashd)
> branch.

## Prerequisites

- [Docker][docker], see e.g. https://docs.docker.com/engine/install/
- Docker Compose: https://docs.docker.com/compose/install/

## Configuration

Modify `docker/zebrad-config.toml` according to your environment. The
default configuration runs on `Mainnet` and exposes the RPC server on
port `8632`. Adjust the `[network]`, `[rpc]` and `[state]` sections as
needed; the full set of options is documented in the
[Zebra config reference][zebra-config].

Client data is persisted on the host machine using a Docker volume.
In the default setting the local directory `./data` is mapped to
`/opt/graphsense/data` inside the container (used by Zebra for both the
network cache and the state cache). To override these settings a Docker
Compose override file can be used, e.g.

```
> cat docker-compose.override.yml
services:
  zcash-client:
    volumes:
      - /var/data/graphsense/clients/zec:/opt/graphsense/data
```

## Usage

Building the docker container (the Zebra version is specified in the
`Dockerfile`):

    docker-compose build

Starting the container (in detached mode):

    docker-compose up -d

Showing log information:

    docker-compose logs


[zcash]: https://z.cash
[zebra]: https://github.com/ZcashFoundation/zebra
[zebra-config]: https://docs.rs/zebrad/latest/zebrad/config/struct.ZebradConfig.html
[docker]: https://www.docker.com
