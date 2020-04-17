#!/bin/bash

ARTIFACT=artifact

if [ ! -d ${ARTIFACT} ];then
  mkdir ${ARTIFACT}
fi

FABRIC_CFG_PATH=./network \
CORE_PEER_MSPCONFIGPATH=crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/msp \
CORE_PEER_LOCALMSPID=Org1MSP \
peer channel fetch config ${ARTIFACT}/config-block.pb -o localhost:7050 -c test-system-channel-name

configtxlator proto_decode --input ${ARTIFACT}/config-block.pb --type common.Block --output ${ARTIFACT}/config-block.json

jq .data.data[0].payload.data.config ${ARTIFACT}/config-block.json > ${ARTIFACT}/config.json

json2yaml ${ARTIFACT}/config.json > ${ARTIFACT}/config.yaml

echo "please check artifact/config.yaml"