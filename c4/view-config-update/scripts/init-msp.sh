#!/bin/bash

CONFIG=crypto-config.yaml

if [ ! -e $CONFIG ];then
  echo "\e[0;31mERROR: config file not found: ${CONFIG}"
  exit 1
fi

cryptogen generate --config $CONFIG