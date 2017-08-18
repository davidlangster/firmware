#!/bin/sh

echo "AVR : bootloader burn"

TOOLS="/Applications/Arduino.app/Contents/Java/hardware/tools/avr"
ARDUINO="/Applications/Arduino.app/Contents/Java/hardware/arduino/avr"

if [ ! $# == 1 ]; then
    echo "Usage: $0 [m328p|m2560]"
    exit
fi

if [ $1 == "m328p" ]; then
echo "Flashing m328p ..."
$TOOLS/bin/avrdude -C/$TOOLS/etc/avrdude.conf -v -pm328p -cusbtiny -e -Ulock:w:0x3F:m -Uefuse:w:0x05:m -Uhfuse:w:0xDE:m -Ulfuse:w:0xFF:m
$TOOLS/bin/avrdude -C/$TOOLS/etc/avrdude.conf -v -pm328p -cusbtiny -Uflash:w:$ARDUINO/bootloaders/optiboot/optiboot_atmega328.hex:i -Ulock:w:0x0F:m 
elif [ "$1" == "m2560" ]; then
echo "Flashing m2560 ..."
$TOOLS/bin/avrdude -C/$TOOLS/etc/avrdude.conf -v -pm2560 -cusbtiny -e -Ulock:w:0x3F:m -Uefuse:w:0xFD:m -Uhfuse:w:0xD8:m -Ulfuse:w:0xFF:m
$TOOLS/bin/avrdude -C/$TOOLS/etc/avrdude.conf -v -pm2560 -cusbtiny -Uflash:w:$ARDUINO/bootloaders/stk500v2/stk500boot_v2_mega2560.hex:i -Ulock:w:0x0F:m
fi

