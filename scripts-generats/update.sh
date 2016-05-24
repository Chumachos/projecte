#! /bin/bash
# Autor: Carlos Hormigo
# Descripció del script: Actualitza el repositòri actual
# i la data de la darrera actualització del fitxer README.md
# ---------------------------------------------------------------

# Definició de variables
datahora_file=$(date +%Y-%m-%d_%H:%M)
datahora_descrip=$(date +%Y/%m/%d_%H:%M)

# Crear arxiu on fer el nou volcat
cat ../README.md | sed -r "s/(Darrera actualització)[^*]*/\1 $datahora_file/g" > READMEtmp.md

# Realitzar volcat
mv READMEtmp.md ../README.md

# Actualitzar repositori
git add --all ../.
# Missatge d'actualització
git commit -am "$datahora_descrip""_""$1"
# Pujar directori
git push

