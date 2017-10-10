#!/bin/sh

########################################################################
# MIDI USB class compliant driver installation on atmega16u2 (AVRDUDE) #
########################################################################

TOOLS="/Applications/Arduino.app/Contents/Java/hardware/tools/avr"


#########################
#### Check arguments ####
#########################

if [ ! $# == 2 ]; then
    echo "Usage: $0 [UNO|MEGA] [(i)nstall|(r)estore]"
    exit
fi

echo "AVR : atmega16u2 flash [$1]"

##################
#### Install #####
##################

if [ $2 == "i" ]; then
    FLASH=UsbMIDI.hex
    echo "Installing image '$FLASH' ..."
    $TOOLS/bin/avrdude -C$TOOLS/etc/avrdude.conf -B1 -pm16u2 -cusbtiny -Pusb -Uflash:w:$FLASH -U lfuse:w:0xff:m -U hfuse:w:0xd9:m -U efuse:w:0xf4:m -U lock:w:0x0F:m

##################
#### Restore #####
##################

elif [ $2 == "r" ]; then
    if [ $1 == "UNO" ]; then
        FLASH=Arduino-usbserial-atmega16u2-Uno-Rev3.hex
    elif [ $1 == "MEGA" ]; then
        FLASH=Arduino-usbserial-atmega16u2-Mega2560-Rev3.hex
    fi
    echo "Restoring image '$FLASH' ..."
    $TOOLS/bin/avrdude -C$TOOLS/etc/avrdude.conf -B1 -pm16u2 -cusbtiny -Pusb -Uflash:w:$FLASH -U lfuse:w:0xff:m -U hfuse:w:0xd9:m -U efuse:w:0xf4:m -U lock:w:0x0F:m
fi
