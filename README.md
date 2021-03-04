# Quest Portal

Quest Portal is a tool to (tele)port your WebXR applications to mobile devices such has the quest.

This early version is only tested for the quest.

## How to port my web app to the quest

### First steps

- git clone this repo
  - `git clone https://github.com/gillesdami/QuestPortal.git`
- Install the submodules
  - `git submodule update --init --recursive`
- Download the proprietary sdk from facebook at [this url](https://developer.oculus.com/downloads/)
  - Download ovr_platform_sdk_25.0.0.zip
  - Download ovr_sdk_mobile_1.42.0.zip
- Unzip the files respectively under
  - ./third_party/OVRPlatformSDK
  - ./third_party/ovr_mobile

### Customize with your sources and settings

- Under `app/src/main/assets/app`, put the web app files you wish to embark
- Replace `app/src/main/assets/logo.png`, this is a splash screen loaded at startup
- Under `app/src/main/res`, edit the applications icons and various settings
- Edit `gradle.properties` where:
  - app_name is the name of you app
  - homepage_url is the page loaded at startup, to load an index.html file in `app/src/main/assets/app/index.html` set `resource://android/assets/app/index.html`
  - remote_debugging_enabled allow the debuging from Firefox when your device is connected to your desktop

### Build using Docker

This is the simplest way to build your application since you won't have to manage any dependency.

- `docker build -t qp-my-project .`

By default the project builds a debug release, use `docker build -t qp-my-project . --build-arg BUILD_VARIANT=<variant>` to try one of the following variant:

- assembleOculusvrArm64Debug # default
- assembleOculusvrArm64Release # includes some optimizations
- assembleOculusvrStoreArm64Debug # includes icons
- assembleOculusvrStoreArm64Release # includes some optimizations and icons

### Build using Android Studio

This method requires exactly JDK 8.

- Open the project with Android Studio
- Build the project using oculusvrArm64Debug variant
- The build may fail and then may prompt you to install dependencies, just keep doing as it suggests

## Development tips

You may use a port forwarding solution to expose your development server to the web. Then set homepage_url to point to your development server.

If you have a hot reloading server, you can test you application live, without sideloading!

Use remote_debugging_enabled and Firefox to debug your application has you play in the device.

The engine used is gecko_view 81.0.20200804091327.

## License

- Mozilla Public License 2.0

## About

Most platforms have amazing tools to build hybrid application with the power of the web. But surprisingly the quest was not one of them. Since I wished to create an application for the quest without the struggle of building it in a triple A engine, I built my own tool.

Quest Portal isn't an engine. It's not opinionated. You code for yourself and the web you love, and Quest Portal port it to XRDevices.

This solution is built upon [MozillaReality/FirefoxReality](https://github.com/MozillaReality/FirefoxReality), many thanks for their extremely valuable contribution to the open-source community.


