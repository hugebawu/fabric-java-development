#!/bin/bash

ARTIFACT=artifact

if [ ! -d ${ARTIFACT} ];then
  mkdir ${ARTIFACT}
fi

configtxgen -outputCreateChannelTx ${ARTIFACT}/ch1.tx -profile SampleSingleMSPChannel -channelID ch1
peer channel create -f ${ARTIFACT}/ch1.tx -c ch1 -o localhost:7050 --outputBlock ${ARTIFACT}/ch1-genesis.block

