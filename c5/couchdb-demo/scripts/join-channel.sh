#!/bin/bash

if [ "$VBOX" != "WIZ-SHELL" ];then
  echo "ERROR: cannot run outside WIZ-SHELL"
  exit 1
fi

ARTIFACT=artifact
CHANNEL=ch1

peer channel join -b ${ARTIFACT}/${CHANNEL}.block  -o localhost:7050