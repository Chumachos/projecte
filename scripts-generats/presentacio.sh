#! /bin/bash

# Crear presentació a partir del document markdown
pandoc -t dzslides -s presentacio.md -o presentacio.html

# Personalització
# Editar el color de fons
sed -i 's/html { background-color: black; }/html { background-color: #000031; }/g' presentacio.html
