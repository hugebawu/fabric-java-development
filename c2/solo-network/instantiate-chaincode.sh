#!/bin/bash

peer chaincode instantiate -n counter-cc -v 0 -c '{"Args":[]}' -o 127.0.0.1:7050 -C ch1
