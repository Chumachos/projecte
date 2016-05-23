# JOURNAL
Systemd permet la unificació dels diferents tipus de missatge que es generen
al sistema, ja sigui que provinguin de dimonis o de processos. El sistema que
recull i administra els logs rep el nom de **journal**.

Aquest és implementat pel dimoni **journald**, que recull missatges de tot 
tipus: kernel, initrd, serveis...

Els fitxers de logs de journal estan en format binari,a més d'estar indexats,
i han de ser processats per poder ser llegits. Aquest processat la fa la ordre
`journalctl`. Aquesta ordre té una opció que permet mostrar els logs en 
diferents formats, que es presentaran en aquest tema.

## Característiques de journal
Algunes de les característiques que ens aporta journal vers syslog són les segúents:

* Simplicitat: poc codi i mínim desperdici.

* No requereix manteniment: es pot implementar rotació del journal.

* Robust: la informació dels arxius de logs són accessibles per als administradors 
i poden ser copiats a diferents hosts amb eines com *“scp”* o *“rsync”*. 
No cal tenir el dimoni ences per a buscar arxius del journal.

* Rendiment: és ràpid en termes de complexitat. És aconsellable per a poder 
fer un seguiment i tenir un bon rendiment alhora.

* Integració: Està integrat a la resta del sistema, ja que el logging és 
crucial per a un servei.

* Unificació: les diferents tecnologies de login haurien d'unificarse amb una mateixa
estructura per a la informació, i així funciona journal. Les entrades de firmware 
són seguides per les del kernel, i les ultimes, les d'usuaris.


## EXEMPLES DE CAMPS
### CAMPS D'USUARIS (de clients)
MESSAGE= 

	Cadena de missatge que pot entendre una persona

PRIORITY= 

	Valor de prioritat entre 0 ("emerg") i 7 ("debug"); compatible amb syslog

### CAMPS CONFIABLES (no poden ser alterats)
_PID=, _UID=, _GID= 

	El proces, usuari, i ID del grup ID del procés.

_COMM=, _EXE=, _CMDLINE= 

	Nom del servei o path d'aquest del qual s'origina el procés.

_HOSTNAME= 

	Nom del host d'on s'executa el servei.

### CAMPS DEL KERNEL
_KERNEL_DEVICE= 

	Nom del device del kernel
	  
_UDEV_DEVNODE= 
	
	Node del path del device (/dev)-
	  


### CAMPS EMPRATS PER PROGRAMES
OBJECT_PID=PID 

	PID del programa al qual pertany el missatge. 

__REALTIME_TIMESTAMP= 

	Temps en el qual journal ha rebut la entrada segons UTC, en un format
	que mostra els microsegons

__MONOTONIC_TIMESTAMP= 

	Temps en format monotonic(CLOCK_MONOTONIC) que es mostrat segons en quin
	moment journal ha rebut, en un format que mostra els microsegons.
	Pot ser combinat amb "_BOOT_ID=". 


## MANIPULAR SYSTEMD AMB JOURNAL
### BUSCAR LOG SERVEI
journalctl *path-to-daemon*
journalctl _COMM=*daemon-name*
journalctl --unit *daemon-name*

### INFO BOOT
journalctl --list-boots →llistar boots registrats

journalctl --boot → llistar últim boot

journalctl --boot -1 → llista info boot amb ID 1

journalctl --boot -fc9....6e08 → llistar boot amb ID x 

### LOGS SEGONS EL TEMPS
Aquesta és una utilitat molt acertada per a aquells servidors que romanen 
molt de temps en funcionament.
Mitjançant les opcions --since i --until, permet posar restriccions a l'hora 
de mostrar els logs (segons si es volen mostrar els que s'han fet abans o 
després del moment desitjat).
El valor del dia i l'hora poden tenir diversos formats, però el més recomanable és:

	YYYY-MM-DD HH:MM:SS

Per posar un exemple, si es vol consultar els logs generats des del dia 01 
del mes actual, Maig, emprariem la opció --since de la següent manera:

	journalctl --since "2016-05-01 00:00:00'' 

Si un dels valors és absent, agafa certs valors establerts per defecte. 
Per exemple, si la data és omitida, la data d'avui és la que pren com a 
valor. O si no hi ha hora establerta, el valor per defecte és “00:00:00”. 
Prenent com a model la següent ordre:

	journalctl --since "2016-01-10" --until "2016-01-11 09:00"

El valor de la data del dia 10 seria les 00:00:00, i del dia 11, el camp 
dels segons per defecte és "00''.
També li podriem passar com a opció altres valors, com *yesterday*, *today*, 
*tomorrow* o *now*.

	journalctl --since yesterday

Fins i tot podriem fer cerques sobre un temps predeterminat:

	journalctl --since 09:00 --until "1 hour ago"

Exemple pràctic: Visualització dels logs en els darrers 5min. 

1. Es mostrarà que no hi ha cap log:

	[isx53866409@i04 scripts]$ journalctl --since "2016-05-06 12:35:00" --until "2016-05-06 12:40:00"
	-- Logs begin at Wed 2015-09-16 11:01:36 CEST, end at Fri 2016-05-06 12:26:50 CEST. --

2. Encenem servei slapd, per a que generi logs: **systemctl start slapd**

3. Tornem a comprovar els logs en el mateix interval de temps que abans.

	[isx53866409@i04 scripts]$ journalctl --since "2016-05-06 12:35:00" --until "2016-05-06 12:40:00"
	-- Logs begin at Wed 2015-09-16 11:01:36 CEST, end at Fri 2016-05-06 12:26:50 CEST. --
	May 06 12:39:20 i04.informatica.escoladeltreball.org systemd[1]: Started OpenLDAP Server Daemon.


### FILTRAR PER PROCES, USUARI O GRUPID
Donat un determinat servei, pot tenir diversos processos fills. Si es vol 
filtrar segons el número exacte de PID del procés cal realitzar:

	journalctl _PID=nºpid

Per filtrar segons el log d'un usuari, primer l'administrador hauria de 
saber quin és el seu UID, que pot extreure fàcilment de la comanda: 
**id --user** ***nomusuari***.

Tot seguit, amb journalctl ja es podria seguir l'objectiu d'esbrinar i 
visualitzar quins logs provenen de l'usuari. Per a realitzar-ho, cal fer 
la ordre:

	journalctl _UID=UID

També, si emprem la opció **--field** seguit de *_UID* o de *_GID*, podem o
btenir una llista de UIDs o GIDs dels qual systemd disposa d'entrades de logs.

### LOGS DEL KERNEL
journalctl -k (la ordre en format extens és: journalctl *--dmesg*)

### LLISTAR SEGONS LA PRIORITAT
Com a administradors del sistema, també interessa filtrar els missatges 
segons la seva prioritat. Sovint és útil guardar els logs amb un alt nivell 
de verbose, és a dir, amb gran quantitat d'informació, i quan es processa 
la informació disponible, els logs de baixa prioritat poden distreure i arribar 
a causar confusió.
Per utilitzar journalctl per especificar només el tipus de prioritat a mostrar, 
cal utilitzar la opció *-p* de manera reduïda o *--priority*). Això permetrà filtrar 
els missatges segons la prioritat que volguem. Per veure les entrades del log 
amb la prioritat seleccionada, realitzariem:

	journalctl --priority prioritat

La opció de prioritat en la ordre anterior pot tenir dos diferents valors: 
numèrics o pel nom. La llista de més a menys prioritat és:

* 0: emerg 
* 1: alert 
* 2: crit 
* 3: err 
* 4: warning 
* 5: notice 
* 6: info 
* 7: debug 

Seleccionar una prioritat provocarà que journal mostri els logs d'aquell 
nivel de prioritat i, a més a més, les que pertanyin a un nivell per sobre 
(més importants). Per exemple, si seleccionem el nivell d'alerta 2, mostrarà 
els logs de crit (2), alert (1) i emerg (0).

	[isx53866409@i04 scripts]$ journalctl --priority 3 --output=json-pretty | grep PRIORITY | sort | uniq
		"PRIORITY" : "1",
		"PRIORITY" : "2",
		"PRIORITY" : "3",

### TOT JOURNAL OUTPUT
Per defecte, la ordre journalctl mostra només una pàgina de la sortida per 
defecte (output). Si volem que mostri tot el llistat de logs i no només 
la última pàgina, la ordre necessària és journalctl **--no-pager**. Aquesta 
ordre també podria ser processada i per exemple, emmagatzemada en el disc 
dur, segons les necessitats que tinguem.

### FORMATS DE SORTIDA
Journal es pot mostrar en diferents formats segons ho necessitem. Per a fer-ho, 
cal emprar la opció *-o* (*--output=*). Els diferents tipus d'opcions són:

* short : és el format per defecte més semblant als arxius de syslog, 
mostrant una linia per cada entrada.

		[isx53866409@i04 scripts]$ journalctl --output=short
		Sep 16 11:47:50 i04.informatica.escoladeltreball.org systemd[1004]: Starting Default.
		Sep 16 11:47:50 i04.informatica.escoladeltreball.org systemd[1004]: Reached target Default.
		Sep 16 11:47:50 i04.informatica.escoladeltreball.org systemd[1004]: Startup finished in 7ms.

* short-iso : similar a short, però horari segons 8601

		[isx53866409@i04 scripts]$ journalctl --output=short-iso
		2015-09-16T11:47:50+0200 i04.informatica.escoladeltreball.org systemd[1004]: Starting Default.
		2015-09-16T11:47:50+0200 i04.informatica.escoladeltreball.org systemd[1004]: Reached target Default.
		2015-09-16T11:47:50+0200 i04.informatica.escoladeltreball.org systemd[1004]: Startup finished in 7ms.


* short-precise : similar a short, però mostrant el temps amb microsegons inclosos.

		[isx53866409@i04 scripts]$ journalctl --output=short-precise
		Sep 16 11:47:50.455787 i04.informatica.escoladeltreball.org systemd[1004]: Starting Default.
		Sep 16 11:47:50.455796 i04.informatica.escoladeltreball.org systemd[1004]: Reached target Default.
		Sep 16 11:47:50.455809 i04.informatica.escoladeltreball.org systemd[1004]: Startup finished in 7ms.

* short-monotonic : mostra el temps en format monotonic.

		[isx53866409@i04 scripts]$ journalctl --output=short-monotonic
		[   29.363509] i04.informatica.escoladeltreball.org systemd[1004]: Starting Default.
		[   29.363676] i04.informatica.escoladeltreball.org systemd[1004]: Reached target Default.
		[   29.363824] i04.informatica.escoladeltreball.org systemd[1004]: Startup finished in 7ms.

* verbose: mostra mitjançant camps estructurats tota la informació del log.

		[isx53866409@i04 scripts]$ journalctl --output=verbose
		Wed 2015-09-16 11:47:50.449335 CEST [s=438c332ec89a44e7a03b82849e5c4101;i=1d8f;b=a6bd3cfac4094b1abd8939580214d025;m=1c00a55;t=51fda311829a1;x=847eed9058620800]
			PRIORITY=4
			SYSLOG_FACILITY=3
			CODE_FILE=../src/core/dbus.c
			CODE_LINE=971
			CODE_FUNCTION=manager_bus_connect_private
			SYSLOG_IDENTIFIER=systemd
			MESSAGE=Failed to open private bus connection: Failed to connect to socket /run/user/201930/dbus/user_bus_socket: No such file or directory
			_TRANSPORT=journal
			_PID=1004
			_UID=201930
			_GID=200012
			_COMM=systemd
			_EXE=/usr/lib/systemd/systemd
			_CMDLINE=/usr/lib/systemd/systemd --user
			_CAP_EFFECTIVE=0
			_SYSTEMD_CGROUP=/user.slice/user-201930.slice/user@201930.service
			_SYSTEMD_OWNER_UID=201930
			_SYSTEMD_UNIT=user@201930.service
			_SYSTEMD_SLICE=user-201930.slice
			_SELINUX_CONTEXT=system_u:system_r:init_t:s0
			_SOURCE_REALTIME_TIMESTAMP=1442396870449335
			_BOOT_ID=a6bd3cfac4094b1abd8939580214d025
			_MACHINE_ID=11c4ccf99e5e4d148e51b0394ec4d780
			_HOSTNAME=i04.informatica.escoladeltreball.org

* export: exporta journal en format binari per a poder enviar-lo per xarxa. També serveix per a backups

		[isx53866409@i04 scripts]$ journalctl --output=export
		__CURSOR=s=438c332ec89a44e7a03b82849e5c4101;i=1d8f;b=a6bd3cfac4094b1abd8939580214d025;m=1c00a55;t=51fda311829a1;x=847eed9058620800
		__REALTIME_TIMESTAMP=1442396870551969
		__MONOTONIC_TIMESTAMP=29362773
		_BOOT_ID=a6bd3cfac4094b1abd8939580214d025
		PRIORITY=4
		SYSLOG_FACILITY=3
		CODE_FILE=../src/core/dbus.c
		CODE_LINE=971
		CODE_FUNCTION=manager_bus_connect_private
		SYSLOG_IDENTIFIER=systemd
		MESSAGE=Failed to open private bus connection: Failed to connect to socket /run/user/201930/dbus/user_bus_socket: No such file or directory
		_TRANSPORT=journal
		_PID=1004
		_UID=201930
		_GID=200012
		_COMM=systemd
		_EXE=/usr/lib/systemd/systemd
		_CMDLINE=/usr/lib/systemd/systemd --user
		_CAP_EFFECTIVE=0
		_SYSTEMD_CGROUP=/user.slice/user-201930.slice/user@201930.service
		_SYSTEMD_OWNER_UID=201930
		_SYSTEMD_UNIT=user@201930.service
		_SYSTEMD_SLICE=user-201930.slice
		_SELINUX_CONTEXT=system_u:system_r:init_t:s0
		_SOURCE_REALTIME_TIMESTAMP=1442396870449335
		_MACHINE_ID=11c4ccf99e5e4d148e51b0394ec4d780
		_HOSTNAME=i04.informatica.escoladeltreball.org


* json: entrades amb estructures de tipus JSON

		[isx53866409@i04 scripts]$ journalctl --output=json
		{ "__CURSOR" : "s=438c332ec89a44e7a03b82849e5c4101;i=1d8f;b=a6bd3cfac4094b1abd8939580214d025;m=1c00a55;t=51fda311829a1;x=847eed9058620800", "__REALTIME_TIMESTAMP" : "144239687055
		{ "__CURSOR" : "s=438c332ec89a44e7a03b82849e5c4101;i=1d90;b=a6bd3cfac4094b1abd8939580214d025;m=1c00d35;t=51fda31182c81;x=3f24be45b6d727f0", "__REALTIME_TIMESTAMP" : "144239687055
		{ "__CURSOR" : "s=438c332ec89a44e7a03b82849e5c4101;i=1d91;b=a6bd3cfac4094b1abd8939580214d025;m=1c00ddc;t=51fda31182d27;x=1a6743953ffffd6b", "__REALTIME_TIMESTAMP" : "144239687055


* json-pretty: entrades amb estructures de tipus JSON, però el format és de múltiples linies per cada entrada, permetent que sigui més llegible.

		[isx53866409@i04 scripts]$ journalctl --output=json-pretty
		{
				"__CURSOR" : "s=438c332ec89a44e7a03b82849e5c4101;i=1d8f;b=a6bd3cfac4094b1abd8939580214d025;m=1c00a55;t=51fda311829a1;x=847eed9058620800",
				"__REALTIME_TIMESTAMP" : "1442396870551969",
				"__MONOTONIC_TIMESTAMP" : "29362773",
				"_BOOT_ID" : "a6bd3cfac4094b1abd8939580214d025",
				"PRIORITY" : "4",
				"SYSLOG_FACILITY" : "3",
				"CODE_FILE" : "../src/core/dbus.c",
				"CODE_LINE" : "971",
				"CODE_FUNCTION" : "manager_bus_connect_private",
				"SYSLOG_IDENTIFIER" : "systemd",
				"MESSAGE" : "Failed to open private bus connection: Failed to connect to socket /run/user/201930/dbus/user_bus_socket: No such file or directory",
				"_TRANSPORT" : "journal",
				"_PID" : "1004",
				"_UID" : "201930",
				"_GID" : "200012",
				"_COMM" : "systemd",
				"_EXE" : "/usr/lib/systemd/systemd",
				"_CMDLINE" : "/usr/lib/systemd/systemd --user",
				"_CAP_EFFECTIVE" : "0",
				"_SYSTEMD_CGROUP" : "/user.slice/user-201930.slice/user@201930.service",
				"_SYSTEMD_OWNER_UID" : "201930",
				"_SYSTEMD_UNIT" : "user@201930.service",
				"_SYSTEMD_SLICE" : "user-201930.slice",
				"_SELINUX_CONTEXT" : "system_u:system_r:init_t:s0",
				"_SOURCE_REALTIME_TIMESTAMP" : "1442396870449335",
				"_MACHINE_ID" : "11c4ccf99e5e4d148e51b0394ec4d780",
				"_HOSTNAME" : "i04.informatica.escoladeltreball.org"
		}


* json-sse: entrades amb estructures de tipus JSON, però en un format adequat per a ser un missatge enviat per servidors	

		[isx53866409@i04 scripts]$ journalctl --output=json-sse
		data: { "__CURSOR" : "s=438c332ec89a44e7a03b82849e5c4101;i=1d8f;b=a6bd3cfac4094b1abd8939580214d025;m=1c00a55;t=51fda311829a1;x=847eed9058620800", "__REALTIME_TIMESTAMP" : "144239

		data: { "__CURSOR" : "s=438c332ec89a44e7a03b82849e5c4101;i=1d90;b=a6bd3cfac4094b1abd8939580214d025;m=1c00d35;t=51fda31182c81;x=3f24be45b6d727f0", "__REALTIME_TIMESTAMP" : "144239

		data: { "__CURSOR" : "s=438c332ec89a44e7a03b82849e5c4101;i=1d91;b=a6bd3cfac4094b1abd8939580214d025;m=1c00ddc;t=51fda31182d27;x=1a6743953ffffd6b", "__REALTIME_TIMESTAMP" : "144239


* cat: mostra només el missatge, sense cap altre tipus d'informació (com hora, host...)

		[isx53866409@i04 scripts]$ journalctl --output=cat
		Failed to open private bus connection: Failed to connect to socket /run/user/201930/dbus/user_bus_socket: No such file or directory
		Starting Default.
		Reached target Default.
		Startup finished in 7ms.






























