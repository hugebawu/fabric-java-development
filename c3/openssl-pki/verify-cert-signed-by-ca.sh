#!/bin/bash

ARTIFACT=artifact

if [ $# -eq 0 ];then
  echo "usage: ./verify-vert-signed-by-ca.sh <somebody>"
  exit 1
fi

SOMEBODY=$1

openssl verify -CAfile ${ARTIFACT}/ca-cert.pem ${ARTIFACT}/${SOMEBODY}-cert.pem