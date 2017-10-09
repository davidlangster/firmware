#!/bin/sh

####################################################################
# MIDI USB class compliant driver installation on atmega16u2 (DFU) #
####################################################################




#########################
#### Check arguments ####
#########################

if [ ! $# == 2 ]; then
    echo "Usage: $0 [UNO|MEGA] [(i)nstall|(r)estore]"
    exit
fi

echo "DFU : atmega16u2 flash [$1]"

##################
#### Install #####
##################

if [ $2 == "i" ]; then
    FLASH=UsbMIDI.hex
    echo "Installing image '$FLASH' ..."
    dfu-programmer atmega16u2 erase
    dfu-programmer atmega16u2 flash $FLASH
    dfu-programmer atmega16u2 reset

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
    dfu-programmer atmega16u2 erase
    dfu-programmer atmega16u2 flash $FLASH 
    dfu-programmer atmega16u2 reset
fi

