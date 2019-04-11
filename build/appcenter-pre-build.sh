#!/bin/sh
rm -rf ./src
mkdir ./src

echo "Generating native code..."
pushd src
haxe -v --hl HeapsApp.c -p ../../ -p ../../src -L heaps -L hlsdl --main Base2D -D windowSize=320x568
popd

echo "Packing content..."
haxe -lib heaps -main hxd.fmt.pak.Build --hl build-pak.hl
hl build-pak.hl -res ../res -out ../res