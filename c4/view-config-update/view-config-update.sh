#!/bin/bash

ARTIFACT=artifact

if [ ! -d ${ARTIFACT} ];then
  mkdir ${ARTIFACT}
fi

FABRIC_CFG_PATH=./network \
configtxgen -outputCreateChannelTx ${ARTIFACT}/ch1.tx -profile DefaultChannel -channelID ch1

configtxlator proto_decode --input ${ARTIFACT}/ch1.tx --type common.Envelope --output ${ARTIFACT}/ch1.json

json2yaml ${ARTIFACT}/ch1.json > ${ARTIFACT}/ch1.yaml

echo "please check ${ARTIFACT}/ch1.yaml"