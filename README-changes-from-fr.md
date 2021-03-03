# how to reproduce

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
- edit third_party\ovr_mobile\VrApi\Include\VrApi_Types.h

```
typedef enum ovrDeviceType_ {
	VRAPI_DEVICE_TYPE_GEARVR_START			= 0,

	VRAPI_DEVICE_TYPE_NOTE4					= VRAPI_DEVICE_TYPE_GEARVR_START,
	VRAPI_DEVICE_TYPE_NOTE5					= 1,
	VRAPI_DEVICE_TYPE_S6					= 2,
	VRAPI_DEVICE_TYPE_S7					= 3,
	VRAPI_DEVICE_TYPE_NOTE7					= 4,			//< No longer supported.
	VRAPI_DEVICE_TYPE_S8					= 5,
	VRAPI_DEVICE_TYPE_NOTE8					= 6,
	VRAPI_DEVICE_TYPE_NOTE7_FE				= 7,			//< Fan Edition
	VRAPI_DEVICE_TYPE_A8					= 8,
	VRAPI_DEVICE_TYPE_A8_PLUS				= 9,
	VRAPI_DEVICE_TYPE_S9					= 10,
	VRAPI_DEVICE_TYPE_S9_PLUS				= 11,
	VRAPI_DEVICE_TYPE_A8_STAR 				= 12,
	VRAPI_DEVICE_TYPE_NOTE9           		= 13,
	VRAPI_DEVICE_TYPE_A9_2018				= 14,
	VRAPI_DEVICE_TYPE_S10					= 15,
	VRAPI_DEVICE_TYPE_GEARVR_END			= 63,

	// Standalone Devices
	VRAPI_DEVICE_TYPE_OCULUSGO_START		= 64,
	VRAPI_DEVICE_TYPE_OCULUSGO				= VRAPI_DEVICE_TYPE_OCULUSGO_START,
	VRAPI_DEVICE_TYPE_MIVR_STANDALONE		= VRAPI_DEVICE_TYPE_OCULUSGO_START + 1,	//< China-only SKU
	VRAPI_DEVICE_TYPE_OCULUSGO_END			= 127,

	VRAPI_DEVICE_TYPE_OCULUSQUEST_START		= 256,
	VRAPI_DEVICE_TYPE_OCULUSQUEST			= VRAPI_DEVICE_TYPE_OCULUSQUEST_START + 3,
	VRAPI_DEVICE_TYPE_OCULUSQUEST_END		= 319,



	VRAPI_DEVICE_TYPE_UNKNOWN				= -1,
} ovrDeviceType;
```

```
typedef enum ovrProperty_ {
        VRAPI_FOVEATION_LEVEL				= 15,		//< Used by apps that want to control swapchain foveation levels.
	VRAPI_REORIENT_HMD_ON_CONTROLLER_RECENTER	= 17,		//< Used to determine if a controller recenter should also reorient the headset.
	VRAPI_LATCH_BACK_BUTTON_ENTIRE_FRAME		= 18,		//< Used to determine if the 'short press' back button should lasts an entire frame.
	VRAPI_BLOCK_REMOTE_BUTTONS_WHEN_NOT_EMULATING_HMT	=19,//< Used to not send the remote back button java events to the apps.
	VRAPI_EAT_NATIVE_GAMEPAD_EVENTS		= 20,				//< Used to tell the runtime not to eat gamepad events.  If this is false on a native app, the app must be listening for the events.
	VRAPI_ACTIVE_INPUT_DEVICE_ID		= 24,		//< Used by apps to query which input device is most 'active' or primary, a -1 means no active input device
        VRAPI_DEVICE_EMULATION_MODE = 29, //< Used by apps to determine if they are running in an
                                      // emulation mode. Is a ovrDeviceEmulationMode value

    VRAPI_DYNAMIC_FOVEATION_ENABLED =
        30, //< Used by apps to enable / disable dynamic foveation adjustments.
    } ovrProperty;
```
