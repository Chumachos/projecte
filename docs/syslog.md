# SYSLOG
Syslog és utilitzat per al registre de missatges, tant a nivell individual
d'un sistema, com una xarxa informàtica. Permet la separació
entre els logs generats, l'emmagatzematge que fa el sistema d'aquests i
l'anàlisi dels logs.

El sistema utilitza el syslog per a l'administració del sistema i la seguretat
d'aquest, també com a mode de d'informació i anàlisi. Permet que els diferents
tipus de logs del sistema quedint enregistrats en un repositori central.

Syslog utilitza el dimoni amb el nom de **syslogd**, i aquest envia missatges
mitjançant protocol UDP i el port 514, tot i que, si l'administrador així 
ho desitja es podria arribar a enviar per TCP.

El format de logs dels missatges és petit, el que fa que siguin versatil, i 
és alhora el seu principal inconvenient. Com no hi ha una estructura definida, 
molta informació del missatge es perd en la transformació, és poc entenible per 
al llenguatge humà.

Algunes de les seves característiques són:

* El missatge no està autenticat. Qualsevol procés local podria fer-se 
passar per un altre servei com ara Apache, i s'emmagatzemaria en disc.

* El timestamp no acaba de definir concretament algunes especificacions 
necessàries per a entendre-la sense cap error (exemple: 14:00, pero no de 
quin horari (Japó, Europa, America...)).

* Syslog és un dels diferents logs del sistema que hi ha al sistema. Hi 
ha d'altres com ara de kernel, aplicacions especifiques, et.c.
 
* Llegir els logs del fitxer és simple, pero no eficient. Es requereixen 
certes operacions complexes.

# RSYSLOG
Implementa el syslog, extenent-lo amb altres utilitats, com ara una configuració
més flexible amb diverses opcions i permet utilitzar TCP pel transport.

Al nostre sistema operatiu de *Fedora*, **rsyslog** és el que s'utilitza desde
Novembre de 2007, tot i que a *Fedora Heisenbug* aquest ha estat complementat
per **journald**. 

## Format per defecte dels missatges
Una plantilla ens permet especificar el tipus de format en el qual es
mostra un missatge loguejat. Una plantilla pot ser configurada per l'administrador
del sistema, i en cas que no hagi estat configurada, s'utilitzaria la
plantilla per defecte.

Tenint en compte els missatges que es generen a */var/log/messages* o un 
altre fitxer de logs com ara */var/log/maillog*,
el format que tenen aquests fitxers és el següent:

	TIMESTAMP HOST DAEMON MESSAGE

Un exemple d'aquest format pot ser el següent, on el missatge ens permet veure
quin tipus d'error s'ha generat:

	May 22 18:07:52 fedora gnome-session: Fontconfig error: Cannot load default config file

Els missatges de logs també podrien mostrar altres tipus de metadata, és a dir,
informació sobre el missatge, com ara el **TAG** del missatge, **PROCID** per 
poder veure la id del procés... etc.

## TIPUS DE FITXERS DE LOGS
He considerat adient dividir els diferents tipus de logs que ens dóna el 
sistema i que analitzaré en tres tipus. Per una banda trobem els que hi ha a /var/log/messages, 
que són el conjunt de missatges globals del sistema, i també inclou els missatges 
produïts en l'arrencada d'aquest. També registra l'activitat general del sistema.

Alhora estàn aquells logs que genera el kernel, que la ordre *dmesg* ens els 
permet mostrar encara que estiguin emmagatzemats en diferents fitxers de logs.

I per últim, estan aquells fitxers de logs situats a la carpeta /var/log, 
però que el servei té el seu propi arxiu de log, separat de la resta de serveis.

## EINES PER A FILTRAR
Al treballar en linux, l'administrador ha de configurar el servidor, i per 
a realitzar-ho de la millor manera possible ha d'estar pendent dels logs que 
es generen (depenen del sistema operatiu es generarà a un fitxer o a un altre). 
Per exemple, a Fedora20 de classe, aquests logs es troben a /var/log/messages. 
El problema està en que aquest fitxer emmagatzema una gran quantitat de logs 
dels diferents serveis i/o aplicacions. Per a poder visualitzar el syslog 
(per veure els logs que es s'estan produïnt en aquell instant) s'ha de realitzar:

	tail -f /var/log/fitxer-de-logs

Si ara imaginem que només es volen consultar els logs produïts per x servei, 
s'ha d'utilitzar les comandes de **grep** o **egrep** per a conseguir l'objectiu 
de mirar només els logs d'aquell servei. 
Amb **grep**:

	tail -f /var/log/fitxer-de-logs | grep "nom-servei"

I amb **egrep**:

	tail -f /var/log/fitxer-de-logs | egrep "nom-servei"

Per a posar-ho en pràctica, es fara un start del servidor de LDAP, i tot 
seguit el stop.
Si volem consultar els logs que aquest servei ha generat, seguint les ordres 
mencionades anteriorment:

	tail -f /var/log/messages | grep ''slapd''

I les corresponents ordres per a encendre i aturar el servei:

	systemctl start slapd

	systemctl stop slapd

En aquest cas, no s'ha trobat cap log del servei **slapd**, però si en comptes 
de buscar el servei slapd es busca per **LDAP**, si que mostra com s'encen 
i s'atura el servidor:

	[isx53866409@i04 ~]$ sudo cat /var/log/messages | grep 'LDAP'
	May 23 13:01:49 i04 systemd: Starting OpenLDAP Server Daemon...
	May 23 13:01:49 i04 systemd: Started OpenLDAP Server Daemon.


També ens mostraria el log de si es produeix qualsevol error, però no la explicació d'aquest:

	[isx53866409@i04 ~]$ sudo cat /var/log/messages | grep 'LDAP'
	May 23 13:02:34 i04 systemd: Starting OpenLDAP Server Daemon...
	May 23 13:02:34 i04 systemd: Failed to start OpenLDAP Server Daemon.


## FILTRAR CAMP DONAT
Com a administradors, potser interessaria veure el missatge generat per un 
log. En syslog, aquest tipus de filtre és bastant complicat i cal utilitzar 
altres eines, com el sed, awk o cut.
Prenent com a model els logs generats al arrencar el sistema, donats per la 
ordre **dmesg**, obtenim la següent resposta:

	[isx53866409@i04 ~]$ dmesg
	[May23 08:58] Initializing cgroup subsys cpuset
	[  +0.000000] Initializing cgroup subsys cpu
	[  +0.000000] Initializing cgroup subsys cpuacct


Si volem filtrar el camp del missatge, tenim diverses opcions per a realitzar-ho.

Per un costat, com el primer camp és de mida fixa, podriem emprar el sed, però 
no seria gaire còmode, ja que hauriem de contar la quantitat de caràcters que 
volem descartar i després escriure'ls: **dmesg | sed 's/^..............//'**.

	[isx53866409@i04 ~]$ dmesg | sed 's/^..............//'
	 Initializing cgroup subsys cpuset
	 Initializing cgroup subsys cpu
	 Initializing cgroup subsys cpuacct

Una altre eina que disposem és la ordre **awk**, que permet mostrar el 
camp que se li dóna. Per a mostrar aquest exemple, aquest cop s'utilitzaran 
els logs de */var/log/messages*, que hi ha més camps que els resultants de la 
ordre **dmesg**.

Una mostra del contingut d'aquest fitxer de logs seria:

	[isx53866409@i04 ~]$ sudo head -5 /var/log/messages
	May 23 09:39:05 i04 rsyslogd: [origin software="rsyslogd" swVersion="7.4.8" x-pid="493" x-info="http://www.rsyslog.com"] rsyslogd was HUPed
	May 23 09:40:12 i04 systemd: Job dev-disk-by\x2duuid-73c63776\x2d7177\x2d4fcd\x2dbfaa\x2d611f42a85320.device/start timed out.
	May 23 09:40:12 i04 systemd: Timed out waiting for device dev-disk-by\x2duuid-73c63776\x2d7177\x2d4fcd\x2dbfaa\x2d611f42a85320.device.
	May 23 09:40:12 i04 systemd: Dependency failed for /dev/disk/by-uuid/73c63776-7177-4fcd-bfaa-611f42a85320.
	May 23 09:40:12 i04 systemd:

Si només volem veure els missatges, mitjançant la ordre awk podriem arribar 
a visualitzar només la primera paraula de la descripció, i no seria el que 
es vol aconseguir (tot i que s'apropa):

	[isx53866409@i04 ~]$ sudo head -4 /var/log/messages | awk '{print $6}'
	[origin
	Job
	Timed
	Dependency


Finalment, vaig arribar a la conclusió que amb la eina de cut, si es pot 
retallar la quantitat de camps desitjats, així que un cop seleccionat el 
camp de la descripció del log, se li podria passar per argument que mostri 
tota la informació des del punt mencionat fins al final del log, que equival 
al final del missatge. La ordre a realitzar seria: **head -5 /var/log/messages | cut -d' ' -f7**

	[isx53866409@i04 ~]$ sudo head -4 /var/log/messages | cut -d' ' -f7-
	software="rsyslogd" swVersion="7.4.8" x-pid="493" x-info="http://www.rsyslog.com"] rsyslogd was HUPed
	dev-disk-by\x2duuid-73c63776\x2d7177\x2d4fcd\x2dbfaa\x2d611f42a85320.device/start timed out.
	out waiting for device dev-disk-by\x2duuid-73c63776\x2d7177\x2d4fcd\x2dbfaa\x2d611f42a85320.device.
	failed for /dev/disk/by-uuid/73c63776-7177-4fcd-bfaa-611f42a85320.


## CONFIGURAR LOGGING MANUAL
Syslog també permet ser configurar per tenir fitxers de logs per a un 
determinat servei.

Seguint amb l'exemple anterior dels logs de slapd, voldriem saber què passa 
amb el servei i descobrir per quin motiu ha fallat. Com el fitxer de logs de 
Fedora20 no dóna la explicació, s'haura de configurar un fitxer de logs que 
emmagatzemi els que produeix, en aquest cas, el de **slapd**.

Per començar, s'ha de tenir coneixement dels diferents nivells de log que 
es poden aplicar. Aquests diferents tipus de logs més coneguts són:

* -1 tots els logs

* 0 no logs	

* 1 localitzar trucada de funcions

* 2 depuració de paquets manipulatts

* 4 explicacions extenses de logs

* 8 connexions establertes

* 16 paquets enviats i rebuts

* 32 filtrats processats

* 64 configuració dels arxius processats

* 256 estadístiques de les connexions

* 512 mostrar debugging

Un cop escollit quin nivell de log volem, l'establiríem al fitxer de configuració 
de openldap. Aquest és troba sota el directori */etc/openldap/slapd.d/*.

Editem l'arxiu /etc/openldap/slapd.d/**cn=config.ldif**, la següent linia, per 
a veure tots els logs:

	olcLogLevel: -1

En el següent pas, creariem el directori on volem emmagatzemar els logs del servei, amb els adients permisos i propietaris:

	mkdir /var/log/slapd

	chmod 755 /var/log/slapd

	chown ldap:ldap /var/log/slapd

Tot seguit, afegim al fitxer de configuració de syslog /etc/rsyslog.conf 
la linia que establirà on s'han de guardar els logs generats pel servei 
de slapd. Aquest fitxer conté els directoris on s'emmagatzemaran els logs 
de serveis separats, és a dir, logs que no apareixen a /var/log/messages, 
sinó al directori que s'ha configurat com s'ha fet en els passos anteriors.

	# Enable LDAP Logging 
	local4.*  /var/log/slapd/slapd.log

També cal editar el fitxer de configuració de slapd (/etc/sysconfig/slapd) 
per a que quan s'arrenqui prengui la facility LOCAL4, que és la que hi ha 
per defecte i no caldria especificar-la.

	SLAPD_OPTIONS="-l LOCAL4"

Es **reinicia** el servei de **rsyslog**, i a partir d'aquest moment, el 
directori de logs de slapd estarà actiu per a emmagatzemar-los.

Si tornem a controlar el log que es produeix en el fitxer, ens donarà una 
extensa informació del que succeeix, ja què està mostrant **tots** els missatges 
que genera el servei slapd.

	[isx53866409@i04 ~]$ sudo tail -f /var/log/slapd/slapd.log | grep slapd
	May 23 13:02:34 i04 slapd[5802]: 
	May 23 13:02:34 i04 slapd[5802]: daemon: epoll: listen=7 active_threads=0 tvp=NULL
	May 23 13:02:34 i04 slapd[5802]: daemon: epoll: listen=8 active_threads=0 tvp=NULL
	May 23 13:02:34 i04 slapd[5802]: daemon: epoll: listen=9 active_threads=0 tvp=NULL
	May 23 13:02:34 i04 slapd[5802]: daemon: shutdown requested and initiated.
	May 23 13:02:34 i04 slapd[5802]: daemon: closing 7
	May 23 13:02:34 i04 slapd[5802]: daemon: closing 8
	May 23 13:02:34 i04 slapd[5802]: daemon: closing 9
	May 23 13:02:34 i04 slapd[5802]: slapd shutdown: waiting for 0 operations/tasks to finish
	May 23 13:02:34 i04 slapd[5802]: slapd shutdown: initiated








