#!/bin/sh

cd /tmp #Avís: Sobreescriu si ja esta instalat

# Descarregar paquet
wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64

# Copiar-ho a directori per executar
cp jq-linux64 /bin/jq

# Donar permisos apropiats
chmod +x /bin/jq
