#! /bin/bash
# Autor: Carlos Hormigo
# Identificador: isx53866409
# Data: 30/03/2016
# 
# Descripció del script:
#	Transformar un document en format markdown a html
#
# ------------------------------ @edt ----------------------------------

# Convertir cada document markdown del repositori en html
for M in *.md;
do
	pandoc \
	$M \
	--from markdown \
	--to html \
	--standalone \
	--template=template.txt \
	--output ${M%.md}.html
	
	# Validar document
	xmllint --valid --noout ${M%.md}.html 
done
