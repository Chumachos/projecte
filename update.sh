#! /bin/bash
# Descripció del script: Actualitza el repositòri actual
# i la data de la darrera actualització del fitxer README.md
# ---------------------------------------------------------------

datahora=$(date +%Y-%m-%d_%H:%M)

cat README.md | sed -r "s/(Darrera actualització)[^*]*/\1 $datahora/g" > READMEtmp.md
mv READMEtmp.md README.md
git add --all
git commit -am "$1"
git push
