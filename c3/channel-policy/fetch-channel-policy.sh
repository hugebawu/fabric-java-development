#!/bin/bash

ARTIFACT=artifact

if [ ! -d ${ARTIFACT} ];then
  mkdir ${ARTIFACT}
fi

FABRIC_CFG_PATH=./network \
CORE_PEER_MSPCONFIGPATH=crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp \
CORE_PEER_LOCALMSPID=Org1MSP \
peer channel fetch config ${ARTIFACT}/config-block.pb -c test-system-channel-name -o localhost:7050

configtxlator proto_decode --input ${ARTIFACT}/config-block.pb --type common.Block --output ${ARTIFACT}/config-block.json
#configtxgen -inspectBlock ${ARTIFACT}/config-block.pb > ${ARTIFACT}/config-block.json
jq .data.data[0].payload.data.config.channel_group.policies ${ARTIFACT}/config-block.json > ${ARTIFACT}/channel-policies.json
json2yaml ${ARTIFACT}/channel-policies.json > ${ARTIFACT}/channel-policies.yaml

echo "check ${ARTIFACT}/channel-policies.yaml"