#!/bin/bash

ARTIFACT=artifact
CONFIG=config

if [ $# -eq 0 ];then
  echo "usage: ./ca-issue-cert.sh <applier>"
  exit 1
fi

APPLIER=$1

openssl x509 -req -extensions user_cert -extfile ${CONFIG}/ca.conf -in ${ARTIFACT}/${APPLIER}-csr.pem -out ${ARTIFACT}/${APPLIER}-cert.pem -CA ${ARTIFACT}/ca-cert.pem -CAkey ${ARTIFACT}/ca-key.pem -CAcreateserial -days 365

echo done.