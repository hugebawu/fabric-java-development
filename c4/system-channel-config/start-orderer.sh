#!/bin/bash

ARTIFACT=artifact

if [ ! -d ${ARTIFACT} ];then
  mkdir ${ARTIFACT}
fi

reset(){
  rm -rf crypto-config
  rm -rf data
}

generate_crypto(){
  echo generate crypto materials...
  cryptogen generate --config=crypto-config.yaml
}

generate_genesis(){
  echo generate genesis block...
  configtxgen -outputBlock ${ARTIFACT}/genesis.pb -profile OrdererGenesis -channelID system-channel
  configtxlator proto_decode --input ${ARTIFACT}/genesis.pb --type common.Block --output ${ARTIFACT}/genesis.json
  json2yaml ${ARTIFACT}/genesis.json > ${ARTIFACT}/genesis.yaml
}

start_orderer(){
  echo starting orderer...

  MSPDIR=./crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp
  
  if [ ! -d $MSPDIR ];then
    echo "ERROR: orderer msp config not found"
    exit 1
  fi
  
  FABRIC_CFG_PATH=$PWD \
  ORDERER_GENERAL_GENESISMETHOD=file \
  ORDERER_GENERAL_GENESISFILE=${ARTIFACT}/genesis.pb \
  ORDERER_FILELEDGER_LOCATION=./data/orderer \
  ORDERER_GENERAL_LOCALMSPDIR=$MSPDIR \
  ORDERER_GENERAL_LOCALMSPID=OrdererMSP \
  orderer
}

reset
generate_crypto
generate_genesis
start_orderer