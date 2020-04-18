#!/bin/bash

if [ "$VBOX" != "WIZ-SHELL" ];then
  echo "ERROR: cannot run outside WIZ-SHELL"
  exit 1
fi

ARTIFACT=artifact
if [ ! -d $ARTIFACT ];then
  mkdir $ARTIFACT
fi

if [ ! -e configtx.yaml ];then
  echo "ERROR: configtx.yaml not found"
  exit 1
fi

CHANNEL=ch1

configtxgen -outputCreateChannelTx ${ARTIFACT}/${CHANNEL}.tx -profile DefaultChannel -channelID ${CHANNEL} 

peer channel create -c ${CHANNEL} -f ${ARTIFACT}/${CHANNEL}.tx -o localhost:7050 --outputBlock ${ARTIFACT}/${CHANNEL}.block

