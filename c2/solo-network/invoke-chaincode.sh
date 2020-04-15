# !/bin/bash

peer chaincode invoke -n counter-cc -c '{"Args":["inc","10"]}' -C ch1