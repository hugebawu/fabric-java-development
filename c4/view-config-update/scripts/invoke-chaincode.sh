# !/bin/bash
if [ "$VBOX" != "WIZ-SHELL" ];then
  echo "ERROR: cannot run outside WIZ-SHELL"
  exit 1
fi

CHANNEL=ch1
CHAINCODE=wizcc

peer chaincode invoke -n ${CHAINCODE} -c '{"Args":[]}' -C ${CHANNEL}