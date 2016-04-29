#! /bin/bash
# Descripció del script: Actualitza el repositòri actual
# i la data de la darrera actualització del fitxer README.md
# ---------------------------------------------------------------

datahora=$(date +%Y-%m-%d_%H:%M)

# Crear arxiu on fer el nou volcat
cat README.md | sed -r "s/(Darrera actualització)[^*]*/\1 $datahora/g" > READMEtmp.md

# Realitzar volcat
mv READMEtmp.md README.md

# Actualitzar repositori
git add --all
# Missatge d'actualització
git commit -am "$1"
git push
