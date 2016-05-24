#! /bin/bash
# Script que instal·la els paquets necessaris per a disposar
# de logwatch, configurar-lo, i el paquet mutt per a visualitzar
# els mails

# Generar data avui
date=$(date +%Y%m%d_%H%M)

# Instal·lació dels paquets
yum install -y logwatch mutt

# Escriure fitxer de configuració.
cat > 0logwatch <<FI
#!/bin/sh
#Set logwatch location
LOGWATCH_SCRIPT="/usr/sbin/logwatch"
#Add options to this line. Most options should be defined in
#  /etc/logwatch/conf/logwatch.conf,
#but some are only for the nightly cronrun such as --output mail and should be set here.
#Other options to consider might be "--format html" or "--encode base64", 
#man logwatch for more details.
OPTIONS="--output mail --mailto root --detail 10 --service All"

#Call logwatch
\$LOGWATCH_SCRIPT \$OPTIONS
exit 0
FI

# Realitzar copia de seguretat
cp /etc/cron.daily/0logwatch /etc/cron.daily/0logwatch.bbk-$date

# Copiar el nou fitxer per a que sigui la nova configuració
cp 0logwatch /etc/cron.daily/0logwatch

# Canviar permissos del fitxer
chmod +x /etc/cron.daily/0logwatch
chmod 755 /etc/cron.daily/0logwatch
chown root.root /etc/cron.daily/0logwatch
