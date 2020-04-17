#!/bin/bash

if [ "$VBOX" != "WIZ-SHELL" ];then
  echo "ERROR: cannot run outside WIZ-SHELL"
  exit 1
fi

CHAINCODE=wizcc
CHANNEL=ch1
ORDERER=127.0.0.1:7050

peer chaincode instantiate -n ${CHAINCODE} -v 0 -c '{"Args":[]}' -o ${ORDERER} -C ${CHANNEL}
