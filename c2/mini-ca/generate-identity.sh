#!/bin/bash

ARTIFACT=artifact

if [ ! -d ${ARTIFACT} ];then
  mkdir ${ARTIFACT}
fi

openssl ecparam -name prime256v1 -genkey -out ${ARTIFACT}/ca-key_.pem
openssl pkcs8 -topk8 -nocrypt -in ${ARTIFACT}/ca-key_.pem -out ${ARTIFACT}/ca-key.pem
openssl req -new -key ${ARTIFACT}/ca-key.pem -out ${ARTIFACT}/ca-csr.pem -config ca.conf
openssl x509 -req -extensions v3_ca -extfile ca.conf -in ${ARTIFACT}/ca-csr.pem -out ${ARTIFACT}/ca-cert.pem -signkey ${ARTIFACT}/ca-key.pem -CAcreateserial -days 3650

openssl ecparam -name prime256v1 -genkey -out ${ARTIFACT}/user-key_.pem
openssl pkcs8 -topk8 -nocrypt -in ${ARTIFACT}/user-key_.pem -out ${ARTIFACT}/user-key.pem
openssl req -new -key ${ARTIFACT}/user-key.pem -out ${ARTIFACT}/user-csr.pem -config user.conf

openssl x509 -req -extensions user_cert -extfile ca.conf -in ${ARTIFACT}/user-csr.pem -out ${ARTIFACT}/user-cert.pem -CA ${ARTIFACT}/ca-cert.pem -CAkey ${ARTIFACT}/ca-key.pem -CAcreateserial -days 3650