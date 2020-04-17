# !/bin/bash

peer chaincode query -n counter-cc -c '{"Args":["value"]}' -C ch1