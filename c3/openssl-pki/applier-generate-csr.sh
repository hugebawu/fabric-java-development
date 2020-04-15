#!/bin/bash

ARTIFACT=artifact
CONFIG=config

if [ $# -eq 0 ];then
  echo "usage: ./applier-generate-csr.sh <applier>"
  exit 1
fi

APPLIER=$1

if [ ! -e ${CONFIG}/${APPLIER}.conf ];then
  echo "${APPLIER}'s csr config file not found"
  exit 1
fi

openssl ecparam -name prime256v1 -genkey -out ${ARTIFACT}/${APPLIER}-key_.pem
openssl pkcs8 -topk8 -nocrypt -in ${ARTIFACT}/${APPLIER}-key_.pem -out ${ARTIFACT}/${APPLIER}-key.pem

openssl req -new -key ${ARTIFACT}/${APPLIER}-key.pem -out ${ARTIFACT}/${APPLIER}-csr.pem -config ${CONFIG}/${APPLIER}.conf

echo done.