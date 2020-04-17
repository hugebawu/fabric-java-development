#!/bin/bash

if [ "$VBOX" != "WIZ-SHELL" ];then
  echo "ERROR: cannot run outside WIZ-SHELL"
  exit 1
fi

PROJECT=`dirname $PWD`
CHAINCODE=wizcc

peer chaincode install -n ${CHAINCODE} -v 0 -l node -p ${PROJECT}/chaincode
