#!/bin/bash

curl -X DELETE localhost:5984/ch1_
curl -X DELETE localhost:5984/ch1_lscc
curl -X DELETE localhost:5984/ch1_wizcc

echo "couchdb cleared."