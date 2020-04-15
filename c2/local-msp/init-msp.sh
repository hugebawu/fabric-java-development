# !/bin/bash

CRYPTO=../mini-ca/artifact
MSPDIR=msp

if [ ! -d ${CRYPTO} ];then
  echo "ERROR: run cd ../mini-ca && ./generate-identity.sh first"
  exit 1
fi

if [ -d ${MSPDIR} ];then
  rm -rf ${MSPDIR}
fi

mkdir -p ${MSPDIR}/admincerts && cp ${CRYPTO}/user-cert.pem ${MSPDIR}/admincerts
mkdir -p ${MSPDIR}/cacerts && cp ${CRYPTO}/ca-cert.pem ${MSPDIR}/cacerts
mkdir -p ${MSPDIR}/signcerts && cp ${CRYPTO}/user-cert.pem ${MSPDIR}/signcerts
mkdir -p ${MSPDIR}/keystore && cp ${CRYPTO}/user-key.pem ${MSPDIR}/keystore

echo 'msp directory initialized successfully'