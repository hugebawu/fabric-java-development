#!/bin/bash

if [ "$VBOX" != "WIZ-SHELL" ];then
  echo "ERROR: cannot run outside WIZ-SHELL"
  exit 1
fi

CRYPTO_DIR=crypto-config
DATA_DIR=data

echo clear crypto materials...
rm -rf $CRYPTO_DIR

echo clear ledger data...
rm -rf $DATA_DIR

echo done.
