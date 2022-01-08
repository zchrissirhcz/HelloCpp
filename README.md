# HelloCpp

## badges

| item    | badge | how to setup |
| ------- | ----- | ------------- |
| license | ![GitHub](https://img.shields.io/github/license/zchrissirhcz/HelloCpp) | https://shields.io/category/license |
| linux-aarch64 | [![linux-aarch64](https://github.com/zchrissirhcz/HelloCpp/actions/workflows/linux-aarch64.yml/badge.svg?branch=main&event=push)](https://github.com/zchrissirhcz/HelloCpp/actions/workflows/linux-aarch64.yml) | https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/adding-a-workflow-status-badge |
| linux-x64 | [![linux-x64](https://github.com/zchrissirhcz/HelloCpp/actions/workflows/linux-x64.yml/badge.svg?branch=main&event=push)](https://github.com/zchrissirhcz/HelloCpp/actions/workflows/linux-x64.yml) | https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/adding-a-workflow-status-badge |
| win-x64 | [![win-x64](https://github.com/zchrissirhcz/HelloCpp/actions/workflows/windows-x64.yml/badge.svg?branch=main&event=push)](https://github.com/zchrissirhcz/HelloCpp/actions/workflows/windows-x64.yml) | https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/adding-a-workflow-status-badge |
| mac-x64 | [![mac-x64](https://github.com/zchrissirhcz/HelloCpp/actions/workflows/mac-x64.yml/badge.svg?branch=main&event=push)](https://github.com/zchrissirhcz/HelloCpp/actions/workflows/mac-x64.yml) | https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/adding-a-workflow-status-badge |
| travis arm64 | [![Build Status](https://app.travis-ci.com/zchrissirhcz/HelloCpp.svg?branch=main)](https://app.travis-ci.com/zchrissirhcz/HelloCpp) | https://docs.travis-ci.com/user/status-images/#travis-ci-pages-show-the-default-branchs-result |
| codecov | [![codecov](https://codecov.io/gh/zchrissirhcz/HelloCpp/branch/main/graph/badge.svg?token=HS14GFI50W)](https://codecov.io/gh/zchrissirhcz/HelloCpp) | https://stackoverflow.com/questions/54010651/how-to-display-codecov-io-badge-in-github-readme-md |
| GH release download | ![GitHub all releases downloads](https://img.shields.io/github/downloads/zchrissirhcz/HelloCpp/total) | https://shields.io/category/downloads |


## Features / Plans
This is an example C++ project with features:

- [x] Building
    - [x] Linux-aarch64 (with QEMU)
    - [x] Linux x64
    - [x] MacOSX x64
    - [x] Windows x64
    - [ ] Android ARMv8

- [ ] Configuration
    - [ ] `version.h` generated by cmake configure file
    - [ ] Macro definitions generated by options and cmake configure file
    - [x] Create imported target in `helloConfig.cmake`, together with global variables

- [x] Testing
    - [x] Use GoogleTest for C++ unittest
    - [x] Integrate GoogleTest with CMake
    - [x] GCC compiler test coverage report
    - [x] Clang compiler test coverage report
    - [x] CodeCov integration
    - [x] gcovr integration

- [x] Installing
    - [x] Create static library and executable targets
    - [ ] Create shared library for Linux, Android and Windows platforms
    - [x] Providing `helloConfig.cmake` for further `find_package(hello)`
    - [x] Installed `helloConfig.cmake` with portable prefix instead of hard-coded
    - [x] Example project demonstrate how `find_package(hello)` use
    - [x] `helloConfig.cmake` handle release/debug modes separately by postfix `_d`

- [x] CI / CD
    - [x] Github Action
        - [x] build and test after each commit pushed
        - [x] provide artifactory download after each build
        - [x] automatically upload and publish and release
    - [x] TravisCI arm64 build

- [x] Using
    - [x] Example cmake-based project with `find_package()`

If your target feature is not listed above, you may create a issue for that.

## Local usage
```
git clone https://github.com/zchrissirhcz/HelloCpp
cd HelloCpp

mkdir build && cd build
cmake ..
cmake --build .

make test
make coverage

cd coverage_report
python -m http.server 7082
```
![](snapshots/coverage1.png)

![](snapshots/coverage2.png)