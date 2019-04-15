# Heaps iOS App

This example heaps ios app will build the [Base2D](https://heaps.io/samples/base2d.html) from heaps and package it for iOS.

## Geting Started
```
git clone https://github.com/thejustinwalsh/heaps-ios.git
cd heaps-ios
sh bootstrap.sh
```

## Build Environemnt
#### tools
haxe `4.0.0-rc.2+77068e1`  
hl `1.9.0`  

#### haxelib
heaps `1.6.1`  
hxbit `1.4.1`  
format `3.4.2`  
hlsdl `1.9.0`  

## Notes
At this time recomending for `h2d` work only.

- The heaps samples that use `h3d` have some rendering issues on iOS and needs further work.
- OpenAL EFX extensions are shimmed out to an empty implementation. OpenAL Soft provides an implementatin however it is licensed under the LGPL and is a grey area due to static linking on iOS.
- You will need to modify the build and pak scripts to suit your combination of assets and libraries you are using.
- No High DPI support so your artwork will be scaled on the screen and your viewport will be in the format of 1 point = 1 pixel instead of 1 point = 4 pixels.

[![Build status](https://build.appcenter.ms/v0.1/apps/dbf68658-84da-407c-9fcf-1f54fffe187d/branches/master/badge)](https://appcenter.ms)
