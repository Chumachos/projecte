#!/bin/sh

cd /tmp #Avís: Sobreescriu si ja esta instalat
wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
cp jq-linux64 /bin/jq
