#!/bin/bash

ARTIFACT=artifact

openssl base64 -d -in ${ARTIFACT}/signature.base64 -out ${ARTIFACT}/signature.sha256.restored
openssl dgst -sha256 -verify ${ARTIFACT}/tommy-pub.pem -signature ${ARTIFACT}/signature.sha256.restored hey-jude.txt