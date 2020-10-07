# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## Unreleased
### Changed
- Use shallow clone with truncated history ([#6](https://github.com/graphsense/btc-client/issues/6))
- Updated Zcash client to v4.0.0

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
