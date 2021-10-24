# HelloCpp

## badges

| item    | badge | how to setup |
| ------- | ----- | ------------- |
| license | ![GitHub](https://img.shields.io/github/license/zchrissirhcz/HelloCpp) | https://shields.io/category/license |
| linux-aarch64 | [![linux-aarch64](https://github.com/zchrissirhcz/HelloCpp/actions/workflows/linux-aarch64.yml/badge.svg?branch=main&event=push)](https://github.com/zchrissirhcz/HelloCpp/actions/workflows/linux-aarch64.yml) |
| linux-x64 | [![linux-x64](https://github.com/zchrissirhcz/HelloCpp/actions/workflows/linux-x64.yml/badge.svg?branch=main&event=push)](https://github.com/zchrissirhcz/HelloCpp/actions/workflows/linux-x64.yml) |
| win-x64 | [![develop](https://github.com/zchrissirhcz/HelloCpp/actions/workflows/windows-x64.yml/badge.svg?branch=main&event=push)](https://github.com/zchrissirhcz/HelloCpp/actions/workflows/windows-x64.yml) |
| mac-x64 | [![develop](https://github.com/zchrissirhcz/HelloCpp/actions/workflows/macosx-x64.yml/badge.svg?branch=main&event=push)](https://github.com/zchrissirhcz/HelloCpp/actions/workflows/macosx-x64.yml) |
| travis arm64 | [![Build Status](https://app.travis-ci.com/zchrissirhcz/HelloCpp.svg?branch=main)](https://app.travis-ci.com/zchrissirhcz/HelloCpp) | https://docs.travis-ci.com/user/status-images/#travis-ci-pages-show-the-default-branchs-result |
| codecov | [![codecov](https://codecov.io/gh/zchrissirhcz/HelloCpp/branch/main/graph/badge.svg?token=HS14GFI50W)](https://codecov.io/gh/zchrissirhcz/HelloCpp) | https://stackoverflow.com/questions/54010651/how-to-display-codecov-io-badge-in-github-readme-md |
| GH release download | ![GitHub all releases downloads](https://img.shields.io/github/downloads/zchrissirhcz/HelloCpp/total) |


## Features
This is an example C++ project with features:
- [x] integration with unittest
    - [x] use googletest for C++ unittest
    - [x] integrate googletest with CMake
- [x] integration with CMake
    - [x] create (static) library and executable targets
    - [x] providing `helloConfig.cmake` for further `find_package(hello)`
    - [x] `helloConfig.cmake` with portable prefix instead of hard-coded
    - [x] providing example project demonstrate how `find_package(hello)` usage
    - [ ] `helloConfig.cmake` handle release/debug modes separately
- [x] integration with Github Action as CI/CD system
    - develop state:
        - [x] build and test after each commit pushed
        - [x] provide artifactory download after each build
    - release stage:
        - [x] automatically upload and publish and release
- [ ] cross-platform building and testing
    - [x] Linux x64
    - [x] MacOSX x64
    - [x] Windows x64
    - [ ] Android ARMv8
    - [x] Linux-aarch64 (with QEMU)


