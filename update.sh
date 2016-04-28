#! /bin/bash
# Descripció del script: Actualitza el repositòri actual
# i la data de la darrera actualització del fitxer README.md
# ---------------------------------------------------------------

datahora=$(date +%Y-%m-%d_%H:%M)
sed=$(echo "sed -r 's/(Darrera actualització)[^*]*/\1 $datahora/g'")
echo $sed
echo "*Darrera actualització: 2016-04-28_12:34*" | $sed
echo "$datahora a"
