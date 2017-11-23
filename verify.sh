#!/bin/sh

#######################
#### Verification #####
#######################

TOOLS="/Applications/Arduino.app/Contents/Java/hardware/tools/avr"
ARDUINO="/Applications/Arduino.app/Contents/Java/hardware/arduino/avr"

echo "AVR : verify"

$TOOLS/bin/avrdude -C/$TOOLS/etc/avrdude.conf  -pm2560 -cusbtiny -Pusb

