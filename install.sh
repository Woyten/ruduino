#!/usr/bin/env bash

set -eux

mkdir -p build

cd build

../rust/configure \
  --enable-debug \
  --disable-docs \
  --enable-llvm-assertions \
  --enable-debug-assertions \
  --enable-optimize

make

cd ..

rustup toolchain link avr-toolchain build/build/x86_64-unknown-linux-gnu/stage1