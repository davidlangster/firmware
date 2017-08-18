#!/bin/sh

echo "AVR : atmega16u2 USB flash (MEGA2560)"
TOOLS="/Applications/Arduino.app/Contents/Java/hardware/tools/avr"

if [ ! $# == 1 ]; then
    echo "Usage: $0 [(i)nstall | (r)estore]"
    exit
fi

if [ $1 == "i" ]; then
    echo "Installing USB image ..."
    $TOOLS/bin/avrdude -C$TOOLS/etc/avrdude.conf -B1 -pm16u2 -cusbtiny -Pusb -Uflash:w:arduino_midi.hex -U lfuse:w:0xff:m -U hfuse:w:0xd9:m -U efuse:w:0xf4:m -U lock:w:0x0F:m
elif [ "$1" == "r" ]; then
    echo "Restoring USB image ..."
    $TOOLS/bin/avrdude -C$TOOLS/etc/avrdude.conf -B1 -pm16u2 -cusbtiny -Pusb -Uflash:w:Arduino-usbserial-atmega16u2-Mega2560-Rev3.hex -U lfuse:w:0xff:m -U hfuse:w:0xd9:m -U efuse:w:0xf4:m -U lock:w:0x0F:m
fi
