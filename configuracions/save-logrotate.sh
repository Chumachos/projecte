#! /bin/sh
# Script que emmagatzema en una carpeta de backup
# tots els arxius de logs rotats

backup="/var/tmp/projecte/backup"
dirlogs="/var/log/slapd"
filerotate="*.log-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]-*"

# Comprovació que el directori de logs del servei existeix
if [ ! -d $dirlogs ]; then
    echo 1>&2 "Directori $dirlogs inexistent"
    exit 1
fi

# Comprovació que el directori on emmagatzemar backups existeix
if [ ! -d $backup ]; then
    mkdir --parents $backup
fi

# Actualitzar els backups disponibles
cp --update $dirlogs/$filerotate $backup

exit 0
