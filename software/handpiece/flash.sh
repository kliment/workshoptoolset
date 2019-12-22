AVRDUDE_PATH=$HOME/.arduino15/packages/arduino/tools/avrdude/6.3.0-arduino16
${AVRDUDE_PATH}/bin/avrdude -C ${AVRDUDE_PATH}/etc/avrdude.conf -c xplainedmini_updi -pt816 -U flash:w:handpiece.hex:i
