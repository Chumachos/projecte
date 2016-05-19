#! /bin/bash
# Autor: Carlos Hormigo
# Identificador: isx53866409
# Data: 30/03/2016
# 
# Descripció del script:
#	Transformar un document en format markdown a html
#
# ------------------------------ @edt ----------------------------------

for M in *.md;
do
	pandoc \
	$M \
	--from markdown \
	--to html \
	--standalone \
	--template=template.txt \
	--output ${M%.md}.html
	
	sed -i 's/\/img/img/g' ${M%.md}.html
	xmllint --valid --noout ${M%.md}.html 
done
