#!/bin/sh
pushd deps

if [ ! -z "${APPCENTER_TRIGGER}" ]; then
    echo "Installing Haxe"
    brew install haxe
    curl -L http://hxbuilds.s3-website-us-east-1.amazonaws.com/builds/haxe/mac/haxe_2019-03-22_development_77068e1.tar.gz | bsdtar -xf - -C .
    ditto ./haxe_20190322085751_77068e1/ /usr/local/lib/haxe/
    echo "Using haxe version "`haxe -version`
    echo "Setting up haxelib"
    haxelib setup "/usr/local/lib/haxe/lib"
    echo "Using haxelib version "`haxelib version`
fi

if [ ! -z "${APPCENTER_TRIGGER}" ]; then
    pushd hashlink

    echo "Fetching Hashlink Dependencies"
    brew install libpng jpeg-turbo libvorbis sdl2 mbedtls openal-soft libuv

    echo "Installing Hashlink"
    make all
    make install
    popd
    
    echo "Linking Haxelib Dependencies"
    haxelib dev heaps "${APPCENTER_SOURCE_DIRECTORY}/build/deps/heaps"
    haxelib dev hlsdl "${APPCENTER_SOURCE_DIRECTORY}/build/deps/hashlink/libs/sdl"
    haxelib dev hlopenal "${APPCENTER_SOURCE_DIRECTORY}/build/deps/hashlink/libs/openal"

    echo "Installing Haxelib Additional Dependencies"
    haxelib install hashlink
    haxelib install hxbit
    haxelib install format
fi

echo "Fetching Dependencies"
git submodule update --remote --depth 1 --init --recursive

echo "Patching SDL Paths"
mkdir -p SDL/include/SDL2
cp SDL/include/SDL.h SDL/include/SDL2/SDL.h
cp SDL/include/SDL_syswm.h SDL/include/SDL2/SDL_syswm.h

popd deps
