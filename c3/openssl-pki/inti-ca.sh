#!/bin/bash

ARTIFACT=artifact
CONFIG=config

if [ ! -d $ARTIFACT ]; then
  mkdir $ARTIFACT
fi

openssl ecparam -name prime256v1 -genkey -out ${ARTIFACT}/ca-key_.pem
openssl pkcs8 -topk8 -nocrypt -in ${ARTIFACT}/ca-key_.pem -out ${ARTIFACT}/ca-key.pem

openssl req -new -key ${ARTIFACT}/ca-key.pem -out ${ARTIFACT}/ca-csr.pem -config ${CONFIG}/ca.conf

openssl x509 -req -extensions v3_ca -extfile ${CONFIG}/ca.conf -in ${ARTIFACT}/ca-csr.pem -out ${ARTIFACT}/ca-cert.pem -signkey ${ARTIFACT}/ca-key.pem -CAcreateserial -days 3650