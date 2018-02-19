#!/usr/bin/env bash

set -eux

export AVR_CPU_FREQUENCY=16000000

XARGO_RUST_SRC=build/build/x86_64-unknown-linux-gnu/stage1 xargo build --release --example "$1" --target avr-atmega328p
avr-objcopy -O ihex -R .eeprom "target/avr-atmega328p/release/examples/$1.elf" "target/$1.hex"
avrdude -p atmega328p -c arduino -P $DEVICE -U "flash:w:target/$1.hex:i"
