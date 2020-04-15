#!/bin/bash

ORG=org1
PEER_PORT=7051
if [ $# -eq 1 ]; then
  ORG=$1  
fi
if [ $# -eq 2 ];then
  PEER_PORT=$2
fi 

CAPORG=`echo $ORG | sed 's/^.*/\u&/'`
ORGMSP=${CAPORG}MSP
PEER_ADDRESS="localhost:${PEER_PORT}"

MSPDIR=$PWD/crypto-config/peerOrganizations/${ORG}.example.com/users/Admin@${ORG}.example.com/msp
if [ ! -d $MSPDIR ];then
  echo "msp config for ${ORG} not found : ${MSPDIR}" 
  exit 1
fi

#echo "------------------------------------------------------"
echo Launch Admin shell with following settings:
echo "    ORG         : ${ORG}"
echo "    ORGMSP      : ${ORGMSP}"
echo "    PEER_ADDRESS: ${PEER_ADDRESS}"
echo "type exit to quit the shell."
#echo "-------------------------------------------------------"

export VBOX=WIZ-SHELL
export PATH=../scripts:$PATH
export FABRIC_CFG_PATH=$PWD
export CORE_PEER_MSPCONFIGPATH=$MSPDIR
export CORE_PEER_LOCALMSPID=Org1MSP 
export CORE_PEER_ADDRESS=localhost:7051 
export PS1="\[\e[0;92m\]admin@${ORG}>\[\e[0m\] "
bash --norc