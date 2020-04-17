#!/bin/bash

ARTIFACT=artifact

jq .channel_group.groups.Orderer.values.BatchSize.value.max_message_count=20 ${ARTIFACT}/config.json >  ${ARTIFACT}/modified.json
json2yaml ${ARTIFACT}/modified.json > ${ARTIFACT}/modified.yaml
echo 'local modified'