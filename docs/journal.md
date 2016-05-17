# JOURNAL
## CAMPS
### CAMPS D'USUARIS (de clients)
MESSAGE= 
	The human-readable message string for this entry. This is supposed to be 
	the primary text shown to the user. It is usually not translated (but 
	might be in some cases), and is not supposed to be parsed for meta data.

MESSAGE_ID= 
	A 128-bit message identifier ID for recognizing certain message types, if 
	this is desirable. This should contain a 128-bit ID formatted as a 
	lower-case hexadecimal string, without any separating dashes or suchlike. 
	This is recommended to be a UUID-compatible ID, but this is not enforced, 
	and formatted differently. Developers can generate a new ID for this 
	purpose with journalctl –new-id.

PRIORITY= 
	A priority value between 0 ("emerg") and 7 ("debug") formatted as a 
	decimal string. This field is compatible with syslog's priority concept.

CODE_FILE=, CODE_LINE=, CODE_FUNC= 
	The code location generating this message, if known. Contains the source 
	filename, the line number and the function name.

ERRNO= 
	The low-level Unix error number causing this entry, if any. Contains the 
	numeric value of errno(3) formatted as a decimal string.

SYSLOG_FACILITY=, SYSLOG_IDENTIFIER=, SYSLOG_PID= 
	Syslog compatibility fields containing the facility (formatted as decimal 
	string), the identifier string (i.e. "tag"), and the client PID. (Note 
	that the tag is usually derived from glibc's program_invocation_short_name 
	variable, see program_invocation_short_name(3).)

### CAMPS CONFIABLES (no poden ser alterats)
_PID=, _UID=, _GID= 
	The process, user, and group ID of the process the journal entry 
	originates from formatted as a decimal string.

_COMM=, _EXE=, _CMDLINE= 
	The name, the executable path, and the command line of the process the 
	journal entry originates from.

_CAP_EFFECTIVE= 
	The effective capabilities(7) of the process the journal entry originates 
	from. 

_AUDIT_SESSION=, _AUDIT_LOGINUID= 
	The session and login UID of the process the journal entry originates 
	from, as maintained by the kernel audit subsystem. 

_SYSTEMD_CGROUP=, _SYSTEMD_SESSION=, _SYSTEMD_UNIT=, _SYSTEMD_USER_UNIT=, 
_SYSTEMD_OWNER_UID=, _SYSTEMD_SLICE= 
	The control group path in the systemd hierarchy, the systemd session ID 
	(if any), the systemd unit name (if any), the systemd user session unit 
	name (if any), the owner UID of the systemd session (if any) and the 
	systemd slice unit of the process the journal entry originates from. 

_SELINUX_CONTEXT= 
	The SELinux security context of the process the journal entry originates 
	from. 

_SOURCE_REALTIME_TIMESTAMP= 
	The earliest trusted timestamp of the message, if any is known that is 
	different from the reception time of the journal. This is the time in 
	microseconds since the epoch UTC, formatted as a decimal string. 

_BOOT_ID= 
	The kernel boot ID for the boot the message was generated in, formatted as 
	a 128-bit hexadecimal string. 

_MACHINE_ID= 
	The machine ID of the originating host, as available in machine-id(5). 

_HOSTNAME= 
	

_TRANSPORT= 
	How the entry was received by the journal service. Valid transports are: 

	* driver: for internally generated messages.

	* syslog: for those received via the local syslog socket with the syslog protocol.

	* journal: for those received via the native journal protocol.

	* stdout: for those read from a service's standard output or error output.

	* kernel: for those read from the kernel

### CAMPS DEL KERNEL
_KERNEL_DEVICE= 
	The kernel device name. If the entry is associated to a block device, the 
	major and minor of the 	device node, separated by ":" and prefixed by "b". 
	Similar for character devices but prefixed by "c". For network devices, this is the 
	interface index prefixed by "n". For all other devices, this is the subsystem name 
	prefixed by "+", followed by ":", followed by the kernel device name. 

	_KERNEL_SUBSYSTEM= 
	The kernel subsystem name. 
  
	_UDEV_SYSNAME= 
	  The kernel device name as it shows up in the device tree below /sys. 
	  
	_UDEV_DEVNODE= 
	  The device node path of this device in /dev. 
	  
	_UDEV_DEVLINK= 
	  Additional symlink names pointing to the device node in /dev. This field 
	  is frequently set more than once per entry. 


### CAMPS EMPRATS PER PROGRAMES
COREDUMP_UNIT=, COREDUMP_USER_UNIT= 
	Used to annotate messages containing coredumps from system and session units. 
	See systemd-coredumpctl(1). 
	Priviledged programs (currently UID 0) may attach OBJECT_PID= to a message. 
	This will instruct systemd-journald to attach additional fields on behalf of the caller: 
OBJECT_PID=PID 
	PID of the program that this message pertains to. 

OBJECT_UID=, OBJECT_GID=, OBJECT_COMM=, OBJECT_EXE=, OBJECT_CMDLINE=, 
OBJECT_AUDIT_SESSION=, OBJECT_AUDIT_LOGINUID=, OBJECT_SYSTEMD_CGROUP=, 
OBJECT_SYSTEMD_SESSION=, OBJECT_SYSTEMD_OWNER_UID=, OBJECT_SYSTEMD_UNIT=, 
OBJECT_SYSTEMD_USER_UNIT= 

These are additional fields added automatically by systemd-journald. Their 
meaning is the same as _UID=, _GID=, _COMM=, _EXE=, _CMDLINE=, _AUDIT_SESSION=, 
_AUDIT_LOGINUID=, _SYSTEMD_CGROUP=, _SYSTEMD_SESSION=, _SYSTEMD_UNIT=, 
_SYSTEMD_USER_UNIT=, and _SYSTEMD_OWNER_UID= as described above, except 
that the process  identified by PID is described, instead of the process 
which logged the message.

### ADDRESS FIELDS
During serialization into external formats, such as the Journal Export Format 
or the Journal JSON Format, the addresses of journal entries are serialized into 
fields prefixed with double underscores. Note that these are not proper fields 
when stored in the journal but for addressing metadata of entries. They cannot be 
written as part of structured log entries via calls such as sd_journal_send(3). 
They may also not be used as matches for sd_journal_add_match(3) 

__CURSOR= 
	The cursor for the entry. A cursor is an opaque text string that uniquely 
	describes the position of an entry in the journal and is portable across 
	machines, platforms and journal files. 

__REALTIME_TIMESTAMP= 
	The wallclock time (CLOCK_REALTIME) at the point in time the entry was 
	received by the journal, in microseconds since the epoch UTC, formatted 
	as a decimal string. This has different properties from "_SOURCE_REALTIME_TIMESTAMP=", 
	as it is usually a bit later but more likely to be monotonic. 

__MONOTONIC_TIMESTAMP= 
	The monotonic time (CLOCK_MONOTONIC) at the point in time the entry was 
	received by the journal in microseconds, formatted as a decimal string. 
	To be useful as an for the entry, this should be combined with with the 
	boot ID in "_BOOT_ID=". 


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

![Exemple que no hi ha logs en x min](/img/no-logs-time.png)

2. Encenem servei slapd, per a que generi logs: **systemctl start slapd**

3. Tornem a comprovar els logs en el mateix interval de temps que abans.

![Exemple logs en x minuts](/img/logs-time.png)

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

![Exemple prioritat seleccionada](/img/uniq-priority-journal.png)

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

![journalctl format short](/img/journalctl-format-short.png)

* short-iso : similar a short, però horari segons 8601

![journalctl format short-iso](/img/journalctl-format-short-iso.png)

* short-precise : similar a short, però mostrant el temps amb microsegons inclosos.

![journalctl format short-precise](/img/journalctl-format-short-precise.png)

* short-monotonic : mostra el temps en format monotonic.

![journalctl format short-monotonic](/img/journalctl-format-short-monotonic.png)

* verbose: mostra mitjançant camps estructurats tota la informació del log.

![journalctl format verbose](/img/journalctl-format-verbose.png)

* export: exporta journal en format binari per a poder enviar-lo per xarxa. També serveix per a backups

![journalctl format export](/img/journalctl-format-export.png)

* json: entrades amb estructures de tipus JSON

![journalctl format json](/img/journalctl-format-json.png)

* json-pretty: entrades amb estructures de tipus JSON, però el format és de múltiples linies per cada entrada, permetent que sigui més llegible.

![journalctl format json-pretty](/img/journalctl-format-json-pretty1.png)

![journalctl format json-pretty](/img/journalctl-format-json-pretty2.png)

* json-sse: entrades amb estructures de tipus JSON, però en un format adequat per a ser un missatge enviat per servidors	

![journalctl format json-sse](/img/journalctl-format-json-sse.png)

* cat: mostra només el missatge, sense cap altre tipus d'informació (com hora, host...)

![journalctl format cat](/img/journalctl-format-cat.png)

### MONITORITZACIÓ
Per mostrar x número de logs, cal emprar la opció *-n* (**journalctl --lines=**), que 
seria equivalen a *tail -n* (*tail --lines=*). Per defecte, mostra les 10 darreres entrades, és 
a dir, les més recents. També es podria especificar un número després de *-n*, 
per veure *y* nombre d'entrades.

Per a visualitzar de manera continua els logs, la opció eś *-f* (**journalctl --follow**), 
equivalent a tail *-f* (*tail --follow*).

### MANTENIMENT DE JOURNAL
La ordre per comprovar la quantitat d'espai en disc que el journal està ocupant 
es realitza de la següent manera:

	journalctl --disk-usage

#### Limitació dels logs
Si es vol limitar el l'espai del journal emprat per part dels logs es pot 
configurar desde l'arxiu de configuració situat a */etc/systemd/journald.conf*. 
En el fitxer trobem diferents opcions que poden ser configurades relacionades 
amb el tema d'ús de disc:

* SystemMaxUse: s'especifica la quantitat màxima d'espai que el journal pot 
emmagatzemar en el disc.

* SystemKeepFree: tamany d'espai en disc mínim que journal ha de deixar 
lliure encara que hagi d'emmagatzemar els logs

* SystemMaxFileSize: determina la mida màxima dels fitxers rotats del journal.

* RuntimeMaxUse: tamany màxim que es pot utilitzar en un directori volatil (com /run)

* RuntimeKeepFree: Specifies the amount of space to be set aside for other 
uses when writing data to volatile storage (within the /run filesystem).

* RuntimeMaxFileSize: especifica el tamany màxim d'un arxiu del journal a 
/run abans de ser rotat.





























