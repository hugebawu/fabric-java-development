#!/bin/bash

curl -X DELETE admin:111111@localhost:5984/ch1_
curl -X DELETE admin:111111@localhost:5984/ch1_lscc
curl -X DELETE admin:111111@localhost:5984/ch1_wizcc

echo "couchdb cleared."
