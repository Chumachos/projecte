# LOGROTATE
Està dissenyat per a l'administració dels sistemes generant un conjunt de
fitxers de logs. Permet també utilitats com ara la rotació automàtica i 
la compressió dels fitxers de logs.
Cada fitxer pot ésser rotat de manera diaria, setmanalment, mensualment o fins i
tot quan aquest supera un tamany especificat.

El més normal es que s'executi en el cron de manera diària. No rotaria
un mateix fitxer de log méws d'un cop en un període d'un dia, a menys que
el criteri per a la rotació es basi en el tamany o que s'utilitzi la
opció `--force`.

## FITXERS DE CONFIGURACIÓ
**/usr/sbin/logrotate** – la ordre de logrotate

**/etc/cron.daily/logrotate** – script de shell que logrotate executa cada dia

	#!/bin/sh

	/usr/sbin/logrotate /etc/logrotate.conf
	EXITVALUE=$?
	if [ $EXITVALUE != 0 ]; then
		/usr/bin/logger -t logrotate "ALERT exited abnormally with [$EXITVALUE]"
	fi
	exit 0

**/etc/logrotate.conf** – configuració de rotació per a tots aquells arxius 
de logs que s'especifiquin en el fitxer

	# see "man logrotate" for details
	# rotate log files weekly
	weekly

	# keep 4 weeks worth of backlogs
	rotate 4

	# create new (empty) log files after rotating old ones
	create

	# use date as a suffix of the rotated file
	dateext

	# uncomment this if you want your log files compressed
	#compress

	# RPM packages drop log rotation information into this directory
	include /etc/logrotate.d

	# no packages own wtmp and btmp -- we'll rotate them here
	/var/log/wtmp {
		monthly
		create 0664 root utmp
			minsize 1M
		rotate 1
	}

	/var/log/btmp {
		missingok
		monthly
		create 0600 root utmp
		rotate 1
	}

	# system-specific logs may be also be configured here.


**/etc/logrotate.d** - configuracions de rotació de logs de packets individuals
 instal·lats al sistema. Per exemple httpd o el packet yum.

## EXEMPLE LOGROTATE
Seguint l'exemple que vaig iniciar amb la configuració d'un servei amb syslog, 
com va ser el cas de **slapd**, ara es configurarà la rotació per als fitxers de log d'aquest.

1. Creem la configuració per a slapd al fitxer */etc/logrotate.d/slapd*

		/var/log/slapd/slapd.log {
		size 100K
		create 0644 root root
		rotate 4
		copytruncate
		dateext
		dateformat -%Y%m%d-%s
		}


* size: permetrà la rotació en el moment en que el fitxer slapd.log sigui igual 
o major al tamany especificat. Els diferents tamanys que es poden especificar són:

	* Sense lletra: es tracta de bytes.

	* M: megabytes.

	* G: gigabytes.

* create: s'especifican els permissos, propietàri i grup.

* rotate: número de fitxers rotats com a màxim. Un cop arribats al màxim
s'esborraria el més antic i aniria rotaria.

* permet emmagatzemar en el nou fitxer slapd.log el contingut de logs generats.
De no fer-ho d'aquesta manera, crearia el fitxer slapd.log nou, però es 
seguiria enregistrant-se tot en el fitxer rotat.

* arxiva versions antigues del fitxer de log mitjançant la extensió any-mes-dia
(YYYYMMDD)

* dateformat: format del string que segueix al nom del fitxer. Per defecte
al PC de classe es tracta de l'any-mes-dia.

2. S'omple el fitxer de logs (mitjançant **systemctl restart slapd**)

		[isx53866409@i04 slapd]$ ll -h
		total 160K
		-rw-r--r--. 1 root root 157K May 12 10:24 slapd.log

3. Es realitza la següent ordre, per rotar el fitxer slapd.log un cop ja 
ha sobrepassat el limit establert configurat (100K). La ordre rotarà tots 
els fitxers que esitguin configurats en el fitxer. Es pot fer la mateixa 
ordre però en comptes d'indicar el fitxer logrotate.conf utilitzar el fitxer 
slapd creat per a que només faci la rotació d'aquest:

		logrotate -s /var/log/logstatus /etc/logrotate.conf

	(la opció *-s* especifica el nom del fitxer on s'escriurà el status de logrotate)

4. Es torna a comprovar que realment s'ha rotat el fitxer, i tornem a afegir-hi dades 
(**systemctl restart slapd** x2)

		[isx53866409@i04 slapd]$ ll -h
		total 160K
		-rw-r--r--. 1 root root    0 May 12 10:24 slapd.log
		-rw-r--r--. 1 root root 157K May 12 10:24 slapd.log-20160512-1463041625

		[isx53866409@i04 slapd]$ sudo systemctl restart slapd
		[isx53866409@i04 slapd]$ sudo systemctl restart slapd
		[isx53866409@i04 slapd]$ ll -h
		total 476K
		-rw-r--r--. 1 root root 314K May 12 10:24 slapd.log
		-rw-r--r--. 1 root root 157K May 12 10:24 slapd.log-20160512-1463041625

Aquests passos si es tornen a realitzar crearien un nou fitxer rotat, i 
hauria fins un màxim de 4 rotats (per la configuració que s'ha establert 
en el fitxer) més el fitxer slapd.log.

## ALTRES OPCIONS INTERESSANTS
* compress: comprimeix l'arxiu rotat mitjançant gzip.

* compresscdm: estableix el path del tipus de compressió.

* compresstext: especifica extensió de l'arxiu rotat (Exemple: .bz2)

* monhtly: rotació mensual.

* weekly: rotació semanal.

* daily: rotació diaria.

* hourly: rotació cada hora.

* Path to script:

		postrotate

		  /path/to/script
  
		endscript
 
 
Utilitza un script personalitzat al ser executat el fitxer de configuració de rotació de slapd.
* maxage: logrotate esborra automaticament l'arxiu rotat un cop transcorreguts x dies.

* missingok: no retorna error si no hi ha arxiu de log.

## EXEMPLE SCRIPT PER FER BACKUP
Suposant que en una empresa demanen a l'administrador que no s'esborrin els
fitxers que han estat rotats, he creat un script que s'executa després de
la rotació i que copiarà els fitxers de logs que han rotat en una carpeta
de backup.

Per a fer-ho, els passos que he seguit han estat:

1. Editar el fitxer de configuració del servei que continuament utilitzo
com a exemple per a fer syslog, **slapd**, i afegir les següents linies:

**/etc/logrotate.d/slapd**

			postrotate
			
				/var/tmp/projecte/save-logrotate.sh
			
			endscript

2. Provocar la rotació del servei, per a que s'executi el script.

3. Comprovar que s'ha fet el backup dels logs

			[isx53866409@i04 projecte]$ ll -h backup/
			total 1.1M
			-rw-r--r--. 1 root root 314K May 18 09:57 slapd.log-20160512-1463049001
			-rw-r--r--. 1 root root 471K May 18 09:57 slapd.log-20160517-1463474706
			-rw-r--r--. 1 root root 156K May 18 09:57 slapd.log-20160518-1463557104
			-rw-r--r--. 1 root root 157K May 18 09:57 slapd.log-20160518-1463558264

4. Fer noves rotacions i comprovar de nou que a la carpeta de backup
hi ha nous arxius de logs

			[isx53866409@i04 projecte]$ ll -h backup/
			total 2.0M
			-rw-r--r--. 1 root root 314K May 18 09:57 slapd.log-20160512-1463049001
			-rw-r--r--. 1 root root 471K May 18 09:57 slapd.log-20160517-1463474706
			-rw-r--r--. 1 root root 156K May 18 09:57 slapd.log-20160518-1463557104
			-rw-r--r--. 1 root root 157K May 18 09:57 slapd.log-20160518-1463558264
			-rw-r--r--. 1 root root 313K May 18 10:07 slapd.log-20160518-1463558862
			-rw-r--r--. 1 root root 625K May 18 10:08 slapd.log-20160518-1463558889

## ROTACIÓ MITJANÇANT CRONTAB
Si es vol establir que es realitzi a una hora/dia/mes concret, podriem 
establir que executi la ordre esmentada anteriorment hem de realitzar el 
següent:

1. Crear un fitxer a /etc/cron.d que contingui la informació necessària 
de quan executar el script que es crearà, en nom de quin usuari s'executarà, 
i el path d'on es troba el script.

		#! /bin/bash

		*/1 * * * * root       /var/tmp/projecte/logrotate.sh

2. Crear el script amb permisos apropiats (+x). En aquest cas estarà en /var/tmp/projecte/logrotate.sh

		#! /bin/bash

		/usr/sbin/logrotate -s /var/log/logstatus /etc/logrotate.conf

3. Reiniciar servei de crond per a posar-ho en funcionament
