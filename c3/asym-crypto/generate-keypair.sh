#!/bin/bash

ARTIFACT=artifact

if [ ! -d $ARTIFACT ]; then
  mkdir $ARTIFACT
fi

openssl ecparam -name prime256v1 -genkey -out ${ARTIFACT}/tommy-priv.pem
openssl ec -in ${ARTIFACT}/tommy-priv.pem -pubout -out ${ARTIFACT}/tommy-pub.pem