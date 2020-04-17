#!/bin/bash

LOG=log

if [ ! -d ${LOG} ];then
  mkdir ${LOG}
fi

start_orderer(){
  echo starting orderer...

  MSPDIR=./crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp
  if [ ! -d $MSPDIR ];then
    echo "ERROR: orderer msp config not found"
    exit 1
  fi
  
  FABRIC_CFG_PATH=$PWD \
  ORDERER_GENERAL_GENESISPROFILE=OrdererGenesis \
  ORDERER_FILELEDGER_LOCATION=./data/orderer \
  ORDERER_GENERAL_LOCALMSPDIR=$MSPDIR \
  ORDERER_GENERAL_LOCALMSPID=OrdererMSP \
  orderer 2> ${LOG}/orderer.log &
}

start_org1_peer0(){
  echo "starting peer0@org1..."

  MSPDIR=./crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/msp 
  if [ ! -d $MSPDIR ];then
    echo "ERROR: peer msp config file not found"
    exit 2
  fi
  
  FABRIC_CFG_PATH=$PWD \
  CORE_PEER_FILESYSTEMPATH=./data/org1-peer0 \
  CORE_PEER_LISTENADDRESS=127.0.0.1:7051 \
  CORE_PEER_CHAINCODELISTENADDRESS=127.0.0.1:7052 \
  CORE_PEER_ID=peer0.org1.example.com \
  CORE_PEER_MSPCONFIGPATH=./crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/msp \
  CORE_PEER_LOCALMSPID=Org1MSP \
  peer node start --peer-chaincodedev 2> ${LOG}/org1-peer0.log &
}

killall(){
  echo 'exiting...'
  pkill orderer
  pkill peer
  echo 'All nodes stopped'
}

trap killall SIGINT

start_orderer
start_org1_peer0

echo 'All nodes started. Press ctrl+c to shutdown...'
cat