#!/bin/bash

ARTIFACT=artifact

if [ ! -d ${ARTIFACT} ];then
  mkdir ${ARTIFACT}
fi

generate_channel_tx(){
  configtxgen -outputCreateChannelTx ${ARTIFACT}/ch1.tx -profile DefaultChannel -channelID ch1
  configtxlator proto_decode --input ${ARTIFACT}/ch1.tx --type common.Envelope --output ${ARTIFACT}/ch1.json
  json2yaml ${ARTIFACT}/ch1.json > ${ARTIFACT}/ch1.yaml
}

create_channel(){
  CORE_PEER_MSPCONFIGPATH=./crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp \
  CORE_PEER_LOCALMSPID=Org1MSP \
  peer channel create -f ${ARTIFACT}/ch1.tx -o localhost:7050 -c ch1 --outputBlock ${ARTIFACT}/genesis.pb
  configtxlator proto_decode --input ${ARTIFACT}/genesis.pb --type common.Block --output ${ARTIFACT}/genesis.json
  json2yaml ${ARTIFACT}/genesis.json > ${ARTIFACT}/genesis.yaml
}

generate_channel_tx
create_channel