#!/bin/sh
rm -rf ./src
mkdir ./src

echo "Generating native code..."
pushd src
haxe -v --hl app.c -p ../../ -p ../../src -L heaps -L hlsdl --main Base2D
popd

echo "Packing content..."
haxe -lib heaps -main hxd.fmt.pak.Build --hl build-pak.hl
hl build-pak.hl -res ../res -out ../res