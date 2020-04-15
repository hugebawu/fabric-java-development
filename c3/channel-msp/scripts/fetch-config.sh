#!/bin/bash
if [ "$VBOX" != "WIZ-SHELL" ];then
  echo "ERROR: cannot run outside WIZ-SHELL"
  exit 1
fi

ARTIFACT=artifact

if [ ! -d ${ARTIFACT} ];then
  mkdir ${ARTIFACT}
fi

peer channel fetch config ${ARTIFACT}/config-block.pb -c ch1
configtxlator proto_decode --input ${ARTIFACT}/config-block.pb --type common.Block --output ${ARTIFACT}/config-block.json
jq .data.data[0].payload.data.config ${ARTIFACT}/config-block.json > ${ARTIFACT}/config.json
json2yaml ${ARTIFACT}/config.json > ${ARTIFACT}/config.yaml
cp ${ARTIFACT}/config.yaml ${ARTIFACT}/modified.yaml
echo done.
