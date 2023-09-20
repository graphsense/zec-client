# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [23.09/1.7.1] - 2023-09-20
### Changed
- setup automatic docker file publish on github packages

## [23.09/1.7.1] - 2023-09-20
### Changed
- remove hardcoded graphsense RPC credentials

## [23.09/1.6.1] - 2023-09-20
### Changed
- Updated Zcash version v5.5.1 -> v5.6.1

## [23.06/1.5.1] - 2023-09-04
### Changed
- Updated Zcash public signing key

## [23.06/1.5.0] - 2023-06-12
### Changed
- Updated Zcash client to v5.5.1

## [23.03/1.4.0] - 2023-03-29
### Changed
- Updated Zcash client to v5.4.2

## [23.01/1.3.0] - 2023-01-30
### Added
- Updated Zcash client to v5.3.2
- standard dev Makefile

## [22.11] - 2022-11-24
### Changed
- Updated Zcash client to v5.3.0

## [22.10] - 2022-10-10
### Changed
- Updated Zcash client to v5.2.0

## [1.0.0] - 2022-07-08
### Changed
- Updated Zcash client to v5.0.0

## [0.5.2] - 2022-03-08
### Changed
- Updated Zcash client to v4.6.0-1

## [0.5.1] - 2021-11-17
### Changed
- Updated Zcash client to v4.5.1-1
- Renamed client config file

## [0.5.0] - 2021-05-31
### Changed
- Updated Zcash client to v4.4.0
- Build from source is broken, use provided `apt` package in Docker

## [0.4.5] - 2020-11-16
### Changed
- Use shallow clone with truncated history ([#6](https://github.com/graphsense/btc-client/issues/6))
- Updated Zcash client to v4.1.0
- Changed Docker base image to Ubuntu 20.04

## [0.4.4] - 2020-06-12
### Changed
- Updated Zcash client to v3.0.0

## [0.4.3] - 2020-05-11
### Changed
- Updated Zcash client to v2.1.1
- Added Docker Compose file
- Removed options rpcuser/rpcpassword (deprecated)

## [0.4.2] - 2019-12-19
### Changed
- Updated Zcash client to v2.1.0-1
- Using --cap-drop all option in docker run command

## [0.4.1] - 2019-06-28
### Changed
- Multi-stage Dockerfile to reduce image size
- Updated Zcash client to v2.0.5-2
- Add docker bridge network (172.17.0.1) to allowed RPC IP addresses

## [0.4.0] - 2019-02-01
### Changed
- Updated Zcash client to v2.0.2
