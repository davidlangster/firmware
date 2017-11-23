#!/bin/sh

##################################
#### Bootloader installation #####
##################################

TOOLS="/Applications/Arduino.app/Contents/Java/hardware/tools/avr"
ARDUINO="/Applications/Arduino.app/Contents/Java/hardware/arduino/avr"

#########################
#### Check arguments ####
#########################

if [ ! $# == 1 ]; then
    echo "Usage: $0 [UNO|MEGA]"
    exit
fi

echo "AVR : bootloader flash [#1]"

if [ $1 == "UNO" ]; then
    echo "Flashing $1 ..."
    $TOOLS/bin/avrdude -C/$TOOLS/etc/avrdude.conf -B1 -pm328p -cusbtiny -Pusb -e -u -Ulock:w:0x3F:m -Uefuse:w:0x05:m -Uhfuse:w:0xDE:m -Ulfuse:w:0xFF:m
    $TOOLS/bin/avrdude -C/$TOOLS/etc/avrdude.conf -B1 -pm328p -cusbtiny -Pusb -Uflash:w:$ARDUINO/bootloaders/optiboot/optiboot_atmega328.hex:i
    $TOOLS/bin/avrdude -C/$TOOLS/etc/avrdude.conf -B1 -pm328p -cusbtiny -Pusb -Ulock:w:0x0F:m
elif [ $1 == "MEGA" ]; then
    echo "Flashing $1 ..."
    $TOOLS/bin/avrdude -C/$TOOLS/etc/avrdude.conf -B1 -pm2560 -cusbtiny  -e -Ulock:w:0x3F:m -Uefuse:w:0xFD:m -Uhfuse:w:0xD8:m -Ulfuse:w:0xFF:m
    $TOOLS/bin/avrdude -C/$TOOLS/etc/avrdude.conf -B1 -pm2560 -cusbtiny  -Uflash:w:$ARDUINO/bootloaders/stk500v2/stk500boot_v2_mega2560.hex:i
    $TOOLS/bin/avrdude -C/$TOOLS/etc/avrdude.conf -B1 -pm2560 -cusbtiny  -Ulock:w:0x0F:m
    $TOOLS/bin/avrdude -C/$TOOLS/etc/avrdude.conf -B1 -pm2560 -cusbtiny  -v 
fi

