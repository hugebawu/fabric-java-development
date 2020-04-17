#!/bin/bash

ARTIFACT=artifact

peer channel join -b ${ARTIFACT}/ch1-genesis.block  -o localhost:7050
