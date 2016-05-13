# LOGWATCH
Eines instal·lades:
* logwatch
* mutt

## EXPLICACIÓ
Logwatch és una eina que serveix per analitzar i reportar els missatges de logs.

L'arxiu per a configurar el logwatch, per defecte no genera cap tipus de log i 
ha d'ésser editat. Aquest arxiu es troba a **/etc/cron.daily/0logwatch**.

![Configuració per defecte de 0logwatch](/img/etc.cron.daily.0logwatch.default.png)

Això va provocar a l'hora de provar-ho que ni tan sols root, al no generar 
logwatch missatges, rebés res al seu correu. Per a solucionar aquest problema, 
calia afegir noves opcions per defecte en la variable definida al arxiu.

![Configuració personalitzada de 0logwatch](/img/etc.cron.daily.0logwatch.configurat.png)

Les opcions afegides, com es pot observar són les següents:
* --mailto: per defecte root ja rep els missatges generats per logwatch, 
però com fent les proves no sabia quin era el motiu pel qual no es rebien els 
missatges, es va deixar aquesta opció per si es desviaven cap a un altre 
usuari. Tot i que amb la configuració de dalt ja s'envien els missatges, 
veig oportú de totes maneres especificar a quin usuari vagin aquests.

* --detail 10: mostrarà el màxim de detall possible de l'informe. Sembla 
ser que aquest era el problema 	pel qual no es generaven informes. Al executar 
logwatch sense aquesta opció és com si el nivell de detall fos equivalent 
a 0, i per tant no generaria cap missatge amb l'informe.

* --service All: es pot especificar de quins serveis es vol fer l'informe 
susbstituïnt All pel nom del servei. La opció especificada en aquest cas 
generarà logs per a aquells serveis que tinguin filtres instal·lats.
Si s'esborra del fitxer aquesta opció generarà el missatge de totes 
maneres, al menys en el nostre 	Fedora20 de classe.

Per visualitzar l'informe generat, he instal·lat el packet de **mutt**, que 
permet veure els missatges d'un usuari extrets de */var/mail/usuari-que-executa-la-ordre*.

És una eina que permet navegar a l'usuari pels seus missatges de manera més 
fàcil, i seleccionar-ne un per veure el contingut.

![Visualització de missatges desde mutt](/img/mutt-lista-missatges.png)

En la següent pàgina es pot visualitzar un exemple de com es mostren les 
diferents parts de l'informe.

## CRON
Ara només caldria configurar el crontab per tal de que es generi un informe 
cada x temps que l'administrador desitgi. La configuració del cron podria 
ser la següent:

		**crontab -e**

		* * 1 * *./script-name

Els camps del cron són:
* El primer camp: els minuts (0-59).
* El segon camp: les hores (0-23).
* El tercer camp: dia del mes (1-31).
* El quart camp: mes (1-12).
* El cinquè camp: dia de la setmana (0-7) (de 0 a 6 equival de diumenge a 
dissabte, el 7 seria diumenge de nou).

Prenent aquestes explicacions dels camps del cron, l'exemple definit per a 
executar el script equival a ser executat una vegada al mes, ja que està 
configurat per a que s'executi el dia 1 del mes.

![Visualització desde mutt informe logwatch](/img/mutt-exemple-informe.png)

## LOGWATCH EN JOURNAL
Logwatch no soporta llegir fitxers de systemd journal de manera directa. 
Caldria un logger com ara syslog-ng, rsync... per a poder duplicar la sortida 
del journal en fitxers de logs externs (com ara /var/log).

Una altre opció seria crear un script que dupliques algunes de les utilitats 
que logwatch presenta, i envies un mail.

També, es podria programar al cron una recerca al journal d'alguna expressió 
que interessi filtrar per a buscar informació per un tema en concret i posteriorment 
sigui enviada al mail. Un exemple d'aquest podria ser el d'obtenir un informe 
sobre quan s'ha reiniciat el nostre ordinador. Per a realitzar això, podriem 
emprar la utilitat de **grep**, filtrant les linies de la ordre journalctl que 
més ens interessa:

journalctl --since yesterday | grep --context=5 '^-- Reboot --$' | mail -s "Boot Report $(date)" root

