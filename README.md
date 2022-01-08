# swift-ndi

Swift wrapper around NewTek's NDI SDK.

Make sure you extracted latest version of **NDI Advanced SDK for Apple** at path `/Library/NDI Advanced SDK for Apple/include/`. You can get it on [ndi.tv](https://www.ndi.tv/sdk/#download) for free.

You can then generate XCFramework with the following commands:
```shell
$ lipo "/Library/NDI Advanced SDK for Apple/lib/iOS/libndi_advanced_ios.a" -extract arm64 -extract armv7 -output libndi_advanced_ios_device.a
$ lipo "/Library/NDI Advanced SDK for Apple/lib/iOS/libndi_advanced_ios.a" -extract x86_64 -extract i386 -output libndi_advanced_ios_simulator.a

xcodebuild -create-xcframework -library libndi_advanced_ios_device.a -headers "/Library/NDI Advanced SDK for Apple/include" -library libndi_advanced_ios_simulator.a -headers "/Library/NDI Advanced SDK for Apple/include" -output NDI_iOS.xcframework
```

Then place the resulting `NDI_iOS.xcframework` directory in `Libraries/`
