#! /bin/bash
# Autor: Carlos Hormigo
# Descripció del script: Crea pdf de la pàgina del manual desitjada
# ---------------------------------------------------------------

man -t $1 | ps2pdf - "man/$1.pdf"
