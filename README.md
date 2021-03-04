# Quest Portal

TODO

## dev notes

Todo later clean unused views and constants, test docker, write a proper readme, ease permissions on ressource://, update images/logos.

## how to

- git clone this repo
- Install submodules
  - `git submodule update --init --recursive`
- Install ovr sdk:
  - download ovr_platform_sdk_25.0.0.zip
  - unzip in ./third_party/OVRPlatformSDK
- Install ovr mobile:
  - download ovr_sdk_mobile_1.42.0.zip
  - unzip in ./third_party/ovr_mobile
- run gradlew (requires JDK 8)
- open android studio
- select a build variant

## how to docker

docker build -t qp-noapi:test .
--build-arg BUILD_VARIANT=assembleNoapi
