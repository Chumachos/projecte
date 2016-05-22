# ROTACIÓ AMB JOURNAL
Permet la rotació dels fitxers de logs de journal que sobrepassen certs limits
configurats, com ara el tamany o antiguitat que tenen.

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

El que aquest fitxer ens permet fer és el controlar els missatges dels
logs de journal, administrar l'espai del disc i el de enviar els logs de journal
cap a altres syslogs o serveis.

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

* **RateLimitInterval, RateLimitBurst**: configura el limit d'interval de temps en el 
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

## EXEMPLES DE CONFIGURACIÓ DE ROTACIÓ DE JOURNAL
### Exemple 1: Limitar a 3Gb com a espai màxim que journal pot ocupar
Abans de tocar la configuració, mostro el resultat de fer la ordre **systemctl status systemd-journald.service**.

	systemd-journald.service - Journal Service
	   Loaded: loaded (/usr/lib/systemd/system/systemd-journald.service; static)
	   Active: active (running) since Tue 2016-05-17 09:00:09 CEST; 3h 11min ago
		 Docs: man:systemd-journald.service(8)
			   man:journald.conf(5)
	 Main PID: 320 (systemd-journal)
	   Status: "Processing requests..."
	   CGroup: /system.slice/systemd-journald.service
			   └─320 /usr/lib/systemd/systemd-journald

	May 17 09:00:10 i04.informatica.escoladeltreball.org systemd-journal[320]: Runtime journal is using 8.0M (max allowed 182.1M, trying to leave 273.2M free of 1.7G avail...182.1M).
	May 17 09:00:10 i04.informatica.escoladeltreball.org systemd-journal[320]: Runtime journal is using 8.0M (max allowed 182.1M, trying to leave 273.2M free of 1.7G avail...182.1M).
	May 17 09:00:10 i04.informatica.escoladeltreball.org systemd-journal[320]: Journal started
	May 17 09:00:12 i04.informatica.escoladeltreball.org systemd-journal[320]: Permanent journal is using 1.5G (max allowed 4.0G, trying to leave 4.0G free of 64.2G availa...t 4.0G).
	May 17 09:00:29 i04.informatica.escoladeltreball.org systemd-journal[320]: Time spent on flushing to /var is 17.792631s for 911 entries.
	Hint: Some lines were ellipsized, use -l to show in full.

El status ens mostra que el màxim d'ocupació en disc que es permet a journal és de 4G,
que és la configuració per defecte.

S'edita el fitxer **/etc/systemd/journald.conf**, i s'edita la opció pertinent:
	
	SystemMaxUse=3G

Després de fer un **restart** del servei, al fer el status de nou es podrà visualitzar que ara
el tamany màxim que pot ocupar journal és de 3Gb

	systemd-journald.service - Journal Service
	   Loaded: loaded (/usr/lib/systemd/system/systemd-journald.service; static)
	   Active: active (running) since Tue 2016-05-17 12:11:31 CEST; 952ms ago
		 Docs: man:systemd-journald.service(8)
			   man:journald.conf(5)
	 Main PID: 5671 (systemd-journal)
	   Status: "Processing requests..."
	   CGroup: /system.slice/systemd-journald.service
			   └─5671 /usr/lib/systemd/systemd-journald

	May 17 12:11:31 i04.informatica.escoladeltreball.org systemd-journal[5671]: Permanent journal is using 1.5G (max allowed 3.0G, trying to leave 4.0G free of 64.2G avail...t 3.0G).
	May 17 12:11:31 i04.informatica.escoladeltreball.org systemd-journal[5671]: Journal started
	Hint: Some lines were ellipsized, use -l to show in full.

### Exemple 1.2: Limitar journal amb un tamany màxim inferior al que ocupa ara
Segons la teoria, en el moment en que l'espai de logs que s'ocupa mitjançant
journal és superior al que està configurat, el servei s'atura i no permet
que augmenti el tamany de logs en disc.

Amb la ordre **du -sh */var/log/journal*** miraré el tamany que ocupa, i 
tot seguit, configuraré l'arxiu de journald.conf per que el tamany permès 
sigui inferior.

	[isx53866409@i23 ~]$ du -sh /var/log/journal/
	163M	/var/log/journal/

I tot seguit, editar **/etc/systemd/journald.conf**:

	SystemMaxUse=150M

Es fa un **restart** del servei **systemd-journald**, i comproven el status:

	[isx53866409@i23 ~]$ systemctl status systemd-journald
	systemd-journald.service - Journal Service
	   Loaded: loaded (/usr/lib/systemd/system/systemd-journald.service; static)
	   Active: active (running) since Wed 2016-05-18 11:40:37 CEST; 47s ago
		 Docs: man:systemd-journald.service(8)
			   man:journald.conf(5)
	 Main PID: 3053 (systemd-journal)
	   Status: "Processing requests..."
	   CGroup: /system.slice/systemd-journald.service
			   └─3053 /usr/lib/systemd/systemd-journald

	May 18 11:40:37 i23.informatica.escoladeltreball.org systemd-journal[3053]: Permanent journal is using 162.0M (max allowed 150.0M, trying to leave 4.0G free of 71.3G a...162.0M).
	May 18 11:40:37 i23.informatica.escoladeltreball.org systemd-journal[3053]: Journal started
	Hint: Some lines were ellipsized, use -l to show in full.

Com es pot visualitzar, el màxim permès està per sota del que ocupa actualment.
Això demostra la teoria esmentada anteriorment de que no s'esborren els 
arxius tot i estar per sobre del permès, sino que s'hauria de fer manualment.

### Exemple 2: Canviar tamany màxim d'espai que pot ocupar un fitxer
Utilitzant com a exemple el fitxer de log que es genera de l'usuari, mostro
com el tamany per defecte és de 8M. 

	[isx53866409@i23 ~]$ ll -h /var/log/journal/7dc4580e27be4581a3978fea99ae5c7c/

	-rw-r-----+ 1 root systemd-journal 8.0M May 18 12:02 user-201925.journal

Si es vol canviar, editem el fitxer de configuracio de journald.conf

**/etc/systemd/journald.conf**

	SystemMaxFileSize=4M

Per a comprovar que realment s'han fet els canvis, s'han de seguir els
següents passos:

1. Reiniciar el servei: **systemctl restart systemd-journald**

2. S'esborra el fitxer de log de journal de l'usuari en qüestió (el meu). 

3. Tancar la sessió amb l'usuari.

	* Si és mitjançant ssh, sortir de la sessió i tornar a entrar.
	
	* Si és mitjançant una sessió normal, reiniciar servei gdm: **systemctl restart gdm**.

4. Tornar a connectar-se

Si tornem a mostrar els fitxers i ens fixem en el mateix que registra els
logs de l'usuari, el tamany màxim d'aquest ha disminuït degut a la configuració
establerta. 

	[isx53866409@i23 ~]$ ll -h /var/log/journal/7dc4580e27be4581a3978fea99ae5c7c/

	-rw-r-----+ 1 root systemd-journal 4.0M May 18 12:05 user-201925.journal

### Exemple 3: Eliminar que no es generin logs per usuaris
Prenent com a model el fitxer de log d'usuari mencionat en el exemple 2,
vaig a provocar que journal deixi de generar aquest tipus de logs per als
usuaris. Per a fer-ho, en el fitxer de configuració, es configura la següent
opció:

	SplitMode=none

Es realitzen els mateixos passos que abans, amb la diferència que al tornar-se
a connectar amb ssh, ja no es generarà de nou el fitxer com si que ho feia
en l'exemple anterior.

1. Reiniciar el servei: **systemctl restart systemd-journald**

2. S'esborra el fitxer de log de journal de l'usuari en qüestió (el meu). 

3. Tancar la sessió amb l'usuari.

	* Si és mitjançant ssh, sortir de la sessió i tornar a entrar.
	
	* Si és mitjançant una sessió normal, reiniciar servei gdm: **systemctl restart gdm**.

4. Tornar a connectar-se

5. Fer un llistat dels arxius de **/var/log/journal/** i veure que no ha
generat de nou el fitxer

	[isx53866409@i23 ~]$ ll -h /var/log/journal/7dc4580e27be4581a3978fea99ae5c7c/user-201925.journal

	ls: cannot access user-201925.journal: No such file or directory

Això mostra que estan desactivats els logs que es generen per als usuaris. 
Els únics logs que s'enregistraran aniran a **system.journal**.


### Exemple 4: eliminar logs superiors a un temps predeterminat
Si configurem l'arxiu **journald.conf** de manera que elimini tots aquells
arxius de log que han sobrepassat cert temps establert, s'eliminaran
**només** els que ha produït per missatges del sistema. En canvi, aquells
logs que no siguin d'aquest tipus, és a dir, d'aquells que sigui de l'usuari,
no seràn.

Per a mostrar-ho, tenim la següent llista de fitxers de logs al directori
*/var/log/journal/*:

![Imatge de logs sense filtre](/img/all.logs.var.log.journal.png)

S'estableix la opció de filtre per a que elimini aquells que sobrepassin
el mes de distància:

	MaxRetentionSec=1month

Reiniciem el servei **systemd-journald**, i al mostrar de nou els logs
de journal, es podrà comprovar que aquells **logs del sistema** que la seva
data és superior a un mes, hauran desaparegut, a excepció dels fitxers
de logs dels usuaris:

![Logs filtrats amb 1 mes](/img/filtre.logs.var.log.journal.png)

## DIFERÈNCIA FITXERS DE ROTACIÓ VERS SYSLOG
Els fitxers de rotació de journal vers el de syslog es diferencien principalment
en la manera en com s'acumulan els logs en els fitxers.

Per una part, tenim els fitxers de syslog, que s'acumulen en un mateix
fitxer fins que es sobrepassa la quantitat de tamany que està configurat per
cadascun i es genera un d'altre.
Tots els logs que es generen de syslog van dirigits al fitxer actiu fins 
que aquest es rotat.

Per una altre part, els fitxers de journal, també s'acumulen en un mateix
fitxer com és el cas de syslog, amb la diferència en que aquest té una mida
com a màxim, i quan es supera aquesta, en el mateix fitxer són eliminats els
logs més antics i hi podem trobar els nous.

Donat aquest fet, surt la qüestió de si es pot emmagatzemar d'alguna manera
tota la quantitat de logs que genera journal per tal de que la informació
no es perdi. Per a aconseguir això, exposaré dos diferents opcions a tenir en
compte.

### Exportar mitjançant journalctl
Una de les opcions de journalctl ens permet controlar la visualització
de logs en un determinat temps. Per exemple, si emprem la opció de 
*`--since yesterday`*, obtindriem la llista de logs que han sorgit des del 
passat dia.

Aprofitant aquesta opció que ens dóna la eina de journalctl, podriem guardar
en un fitxer tots aquells logs generats en l'últim dia. A més a més, mitjançant
el crontab el configurem per a que cada dia s'emmagatzemi en un fitxer 
els logs produïts en les darreres 24 hores.

Per exemple, el crontab per a podria ser el següent:

	* * */1 * * journalctl --since yesterday >> /var/tmp/projecte/backup-journal/journal.log

També es podria passar la opció del tipus de sortida, com ara *`output=json-pretty`*
i així tenir més informació dels logs.

### Deixar que ho fagi syslog
Syslog conté diferents utilitats que journalctl no pot fer. Aquest és
un d'aquests casos. Com journal de manera directa no hi ha cap utilitat que
permeti realitzar còpies i emmagatzemar-les en el disc i encarà estem en un
procés de migració, es podria prendre la decisió de tenir syslog per a 
realitzar aquest funcionament de manera complementària a journal.

