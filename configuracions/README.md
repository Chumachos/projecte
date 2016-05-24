# FITXERS DE CONFIGURACIÓ I SCRIPTS
En aquest directori es preten explicar quines són les rutes dels fitxers
que hi ha per a poder ser copiats de manera ràpida.

## Fitxers LDAP
Canvi nivell de grau d'informació de logs

	cp cn=config.ldif /etc/openldap/slapd.d/cn=config.ldif

Fitxer de configuració de la rotació del servei slapd

	cp etc.logrotate.d.slapd /etc/logrotate.d/slapd

Fitxer del servei slapd. Especifica opcions a utilitzar (facility)

	cp etc.sysconfig.slapd /etc/sysconfig/slapd

## Logrotate
Fitxer de rotació general dels serveis
	
	cp logrotate.conf /etc/logrotate.conf

Cron que controla el temps de rotació

	cp logrotate /etc/cron.d/logrotate
	
Script que executa la rotació de logrotate

	cp logrotate.sh /var/tmp/projecte/logrotate.sh

Script per emmagatzemar en directori de backups els fitxers de logs rotats

	cp save-logrotate.sh /var/tmp/projecte/save-logrotate.sh

## Journal rotate
Fitxer de configuració per a la rotació de journal

	cp journald.conf /etc/systemd/journald.conf


## Journal centralització
Configuració per connectar-se de client a servidor

	cp journal-upload.conf /etc/systemd/journal-upload.conf

Configuracions del servidor

	cp systemd-journal-remote.service /lib/systemd/system/systemd-journal-remote.service

	cp systemd-journal-remote.socket /etc/systemd/system/sockets.target.wants/systemd-journal-remote.socket
