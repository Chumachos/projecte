# SYSLOG
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

![Start i stop LDAP](/img/var.log.messages-slapd.png)

També ens mostraria el log de si es produeix qualsevol error, però no la explicació d'aquest:

![Error al iniciar LDAP](/img/failed-start-slapd.png)

## FILTRAR CAMP DONAT
Com a administradors, potser interessaria veure el missatge generat per un 
log. En syslog, aquest tipus de filtre és bastant complicat i cal utilitzar 
altres eines, com el sed, awk o cut.
Prenent com a model els logs generats al arrencar el sistema, donats per la 
ordre **dmesg**, obtenim la següent resposta:

![Missatges amb dmesg](/img/dmesg-humanredeable.png)

Si volem filtrar el camp del missatge, tenim diverses opcions per a realitzar-ho.

Per un costat, com el primer camp és de mida fixa, podriem emprar el sed, però 
no seria gaire còmode, ja que hauriem de contar la quantitat de caràcters que 
volem descartar i després escriure'ls: **dmesg | sed 's/^..............//'**.

![Filtrat dmesg camp del missatge](/img/dmesg-sed.png)

Una altre eina que disposem és la ordre **awk**, que permet mostrar el 
camp que se li dóna. Per a mostrar aquest exemple, aquest cop s'utilitzaran 
els logs de */var/log/messages*, que hi ha més camps que els resultants de la 
ordre **dmesg**.

Una mostra del contingut d'aquest fitxer de logs seria:

![Exemple missatges /var/log/messages](/img/head-var.log.messages.png)

Si només volem veure els missatges, mitjançant la ordre awk podriem arribar 
a visualitzar només la primera paraula de la descripció, i no seria el que 
es vol aconseguir (tot i que s'apropa):

![Missatges processats per awk](/img/awk-var.log.messages.png)

Finalment, vaig arribar a la conclusió que amb la eina de cut, si es pot 
retallar la quantitat de camps desitjats, així que un cop seleccionat el 
camp de la descripció del log, se li podria passar per argument que mostri 
tota la informació des del punt mencionat fins al final del log, que equival 
al final del missatge. La ordre a realitzar seria: **head -5 /var/log/messages | cut -d' ' -f7**

![Missatges processats per cut](/img/cut-var.log.messages.png)

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

![Logs generats per slapd](/img/var.log.slapd.slapd.log-slapd.png)






