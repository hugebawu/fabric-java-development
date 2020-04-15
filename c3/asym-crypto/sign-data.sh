#!/bin/bash

ARTIFACT=artifact

openssl dgst -sha256 -sign ${ARTIFACT}/tommy-priv.pem -out ${ARTIFACT}/signature.sha256 hey-jude.txt
openssl base64 -in ${ARTIFACT}/signature.sha256 -out ${ARTIFACT}/signature.base64