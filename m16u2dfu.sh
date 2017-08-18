#!/bin/sh

echo "DFU : atmega16u2 USB flash (UNO)"

if [ ! $# == 1 ]; then
    echo "Usage: $0 [(i)nstall | (r)estore]"
    exit
fi

if [ $1 == "i" ]; then
    echo "Installing USB ..."
    sudo dfu-programmer atmega16u2 erase
    sudo dfu-programmer atmega16u2 flash arduino_midi.hex 
    sudo dfu-programmer atmega16u2 reset
elif [ "$1" == "r" ]; then
    echo "Restoring USB ..."
    sudo dfu-programmer atmega16u2 erase
    sudo dfu-programmer atmega16u2 flash Arduino-usbserial-atmega16u2-Uno-Rev3.hex 
    sudo dfu-programmer atmega16u2 reset
fi

