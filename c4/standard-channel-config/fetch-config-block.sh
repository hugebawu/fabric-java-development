#!/bin/bash

ARTIFACT=artifact

if [ ! -d ${ARTIFACT} ];then
  mkdir ${ARTIFACT}
fi

echo fetch system config...
CORE_PEER_MSPCONFIGPATH=./crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp \
CORE_PEER_LOCALMSPID=Org1MSP \
peer channel fetch config ${ARTIFACT}/config-block.pb -o localhost:7050 -c ch1

configtxlator proto_decode --input ${ARTIFACT}/config-block.pb --type common.Block --output ${ARTIFACT}/config-block.json

json2yaml ${ARTIFACT}/config-block.json > ${ARTIFACT}/config-block.yaml

echo "please check ${ARTIFACT}/config-block.yaml " 