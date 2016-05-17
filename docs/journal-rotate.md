# ROTACIÓ AMB JOURNAL
El fitxer de configuració dels logs generats per journal es troba a 
*/etc/systemd/journald.conf*.

Per defecte, podem observar-hi el següent codi:

	#  This file is part of systemd.
	#
	#  systemd is free software; you can redistribute it and/or modify it
	#  under the terms of the GNU Lesser General Public License as published by
	#  the Free Software Foundation; either version 2.1 of the License, or
	#  (at your option) any later version.
	#
	# See journald.conf(5) for details

	[Journal]
	#Storage=auto
	#Compress=yes
	#Seal=yes
	#SplitMode=login
	#SyncIntervalSec=5m
	#RateLimitInterval=30s
	#RateLimitBurst=1000
	#SystemMaxUse=
	#SystemKeepFree=
	#SystemMaxFileSize=
	#RuntimeMaxUse=
	#RuntimeKeepFree=
	#RuntimeMaxFileSize=
	#MaxRetentionSec=
	#MaxFileSec=1month
	#ForwardToSyslog=yes
	#ForwardToKMsg=no
	#ForwardToConsole=no
	#TTYPath=/dev/console
	#MaxLevelStore=debug
	#MaxLevelSyslog=debug
	#MaxLevelKMsg=notice
	#MaxLevelConsole=info

## Explicacions de les diferents opcions
* **Storage**: controla on emmagatzemar les dades del journal. Les diferents 
opcions que pot tenir són:
	* volatile: s'emmagatzema en memoria, com ara */run/log/journal*.
	
	* persistent: s'emmagatzema en disc, crea */var/log/journal* si cal, i amb
	opció de ser emmagatzemat a /run/log/journal en cas que hi hagi qualsevol
	tipus d'error, com per exemple que no hi hagi permís d'escriptura.
	
	* auto: similar a **persistent**, però no crea el directori */var/log/journal*
	si no existeix, sinó que altres eines controlarien on anirien els logs.
	
	* None: no s'emmagatzema, tots els logs s'esborren automaticament.

	Per defecte, la opció automàtica és **auto**.

* **Compress**: (*yes*/*no*). Controla si es comprimeixen els logs emmagatzemats del journal.

* **Seal**: (*yes*/*no*). Protegeix els fitxers de journal de qualsevol possible alteració
mitjançant claus. (**FSS**, **F**orward **S**ecure **S**ealing)

* **SplitMode**: controla on dividir els fitxers de journal. Les diferents opcions són:
	* login: cada usuari loguejat (prèviament en el journal) rebrà el seu propi fitxer de journal.
	
	* uid: cada usuari amb *x* ID rebrà el seu pròpi fitxer de journal, 
	independentment de si és un usuari registrat o d'un servei del sistema.
	
	* none: no es divideix el fitxer de journal a cap usuari. 
	
	Les dues primeres opcions s'aplicarien sempre i quan el mode d'emmagatzemament 
	sigui en mode **persistent**, en cas contrari, només hi hauria un sol
	fitxer de journal per a totes les ID d'usuari.

* **RateLimitInterval**, RateLimitBurst: confingura el limit d'interval de temps en el 
que el sistema pot generar logs. Si es configura mitjançant *RateLimitInterval* els serveis
generaran més missatges que si es configura amb *RateLimitBurst*. Els missatges que es generin
un cop sobrepassat el limit seran eliminats fins que es torni a reinicialitzar. 
S'aplica cada el limit per cada servei.

	Per defecte, es permeten 1000 missatges cada 30s.
	
	El temps per a especificar a la opció *RateLimitInterval* pren els valors
	de "*s*", "*min*", "*h*", "*ms*" "*us*". **Si el valor és 0**, no hi ha limits.

* **SystemMaxUse, SystemKeepFree, SystemMaxFileSize, RuntimeMaxUse, RuntimeKeepFree, RuntimeMaxFileSize**: 
controla el tamany màxim que pot tenir un fitxer del journal emmagatzemat. 
Les opcions amb prefix *System* s'aplica als fitxers quan estan en mode **persistent**.
*Runtime* als que estan en mode **volatile**.

	Per a que s'apliquin les regles, els fitxers del journal han d'acabar en 
	*.journal* o *journal*.
	
	* **SystemMaxUse, RuntimeMaxUse**: controla espai que el journal pot emprar com  a màxim.
	
		Per defecte és el 10% del sistema.
	
	* **SystemKeepFree, RuntimeKeepFree**: controla l'espai que journal ha de deixar lliure
	com a mínim per a altres usos.
	
		Per defecte ha de deixar lliure el 15% del sistema.
	
		**Atenció:** Si al arrencar systemd-journald es sobrepassa el limit que ha de deixar lliure
		per al sistema, s'aturaria journald, però els arxius que sobrepassen els 
		limits encara romandrien existents.
	
	* **SystemMaxFileSize, RuntimeMaxFileSize**: controla el tamany màxim individual
	de cada fitxer de logs de journal. Els valors són K, M, G, T, P, E.

* **MaxFileSec**: temps màxim que emmagatzemarà les entrades en single journal file
abans de la rotació. Les opcions que pot prendre són: 0 (equival a que 
sempre s'emmagatzemarà els fitxers, "*year*", "*month*", "*week*", "*day*", "*h*" o "*m*".

* **MaxRetentionSec**: temps màxim que emmagatzemarà les entrades del journal. 
Controla que si els fitxers de journal contenen entrades més antigues vers 
el temps especificat seràn eliminats. Les opcions que pot prendre són: 0 (equival a que 
sempre s'emmagatzemarà els fitxers, "*year*", "*month*", "*week*", "*day*", "*h*" o "*m*".

* **SyncIntervalSec**: . Temps que ha de transcorrer abans de fer la sincronització
del fitxer de journal cap al disc. Només s'aplica a err, warning, notice, info, debug.
	
	Per defecte és de 5min.

* **ForwardToSyslog, ForwardToKMsg, ForwardToConsole**: controla si els missatges
d'errors serian enviats al dimoni de syslog, al buffer de logs del kernel o a 
la consola del sistema. Si s'envien els missatges a syslog però aquest no està activat
no hi haurà cap efecte.

* **MaxLevelStore, MaxLevelSyslog, MaxLevelKMsg, MaxLevelConsole**: controla
el màxim nivell de missatges de logs emmagatzemats en el disc. Pren arguments
de 0-7 o "*emerg*", "*alert*", "*crit*", "*err*", "*warning*", "*notice*", "*info*", "*debug*".

	Els valors per defecte són:

	* MaxLevelStore=debug
	
	* MaxLevelSyslog=debug
	
	* MaxLevelKMsg=notice
	
	* MaxLevelConsole=info

* **TTYPath**: disponible si ForwardToConsole=yes. Canvia la consola TTY (per
defecte */dev/console*).
