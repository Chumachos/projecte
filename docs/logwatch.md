# LOGWATCH
Eines instal·lades:
* logwatch
* mutt

Logwatch és una eina que serveix per analitzar i reportar els missatges de logs.

## COM FER LOGWATCH - EXEMPLE 1
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

![Visualització de missatges desde mutt](/img/mutt-llista-missatges.png)

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

## COM FER LOGWATCH - EXEMPLE 2
Després de mirar maneres més senzilles de poder fer servir el logwatch, configurant
alguns serveis per poder tenir-ne un control sobre ells, vaig veure que
si es segueixen els següents passos també es pot configurar logwatch.

Els passos a seguir són els següents:

1. Copiar la configuració d'exemple de logwatch

	cp /usr/share/logwatch/default.conf/logwatch.conf \
/etc/logwatch/conf/logwatch.conf

2. Personalitzar les opcions del fitxer /etc/logwatch/conf/logwatch.conf

	 # {mail|stdout|file}
	Output = mail
	
	 # Compte local o adreça de correu
	MailFrom = Logwatch

	MailTo = root

	 # Nivell de detall (0-10)
	 # Alt = 10
	Detail = 10
	
	 # Servei a monitoritzar {All|nom-servei}
	Service = All

3. Comprovar els serveis i fitxers de logs més comuns del sistema que 
logwatch és capaç de processar.
	
	[hscarlos@fedora ~]$ ls /usr/share/logwatch/default.conf/services/
	afpd.conf       clamav.conf         dpkg.conf              freeradius.conf     iptables.conf       mysql-mmm.conf  php.conf               pureftpd.conf      samba.conf                spamassassin.conf  vdr.conf            zz-network.conf
	amavis.conf     clamav-milter.conf  emerge.conf            ftpd-messages.conf  kernel.conf         named.conf      pix.conf               qmail.conf         saslauthd.conf            sshd2.conf         vpopmail.conf       zz-runtime.conf
	arpwatch.conf   clam-update.conf    evtapplication.conf    ftpd-xferlog.conf   knockd.conf         netopia.conf    pluto.conf             qmail-pop3d.conf   scsi.conf                 sshd.conf          vsftpd.conf         zz-sys.conf
	audit.conf      courier.conf        evtsecurity.conf       http.conf           lvm.conf            netscreen.conf  pop3.conf              qmail-pop3ds.conf  secure.conf               stunnel.conf       windows.conf        zz-zfs.conf
	automount.conf  cron.conf           evtsystem.conf         http-error.conf     mailscanner.conf    oidentd.conf    portsentry.conf        qmail-send.conf    sendmail.conf             sudo.conf          xntpd.conf
	autorpm.conf    denyhosts.conf      exim.conf              identd.conf         mdadm.conf          omsa.conf       postfix.conf           qmail-smtpd.conf   sendmail-largeboxes.conf  syslogd.conf       yum.conf
	barracuda.conf  dhcpd.conf          eximstats.conf         imapd.conf          modprobe.conf       openvpn.conf    postgresql.conf        raid.conf          shaperd.conf              syslog-ng.conf     zypp.conf
	bfd.conf        dirsrv.conf         extreme-networks.conf  init.conf           mod_security2.conf  pam.conf        pound.conf             resolver.conf      slon.conf                 tac_acc.conf       zz-disk_space.conf
	cisco.conf      dnssec.conf         fail2ban.conf          in.qpopper.conf     mountd.conf         pam_pwdb.conf   proftpd-messages.conf  rsyslogd.conf      smartd.conf               tivoli-smc.conf    zz-fortune.conf
	citadel.conf    dovecot.conf        fetchmail.conf         ipop3d.conf         mysql.conf          pam_unix.conf   puppet.conf            rt314.conf         sonicwall.conf            up2date.conf       zz-lm_sensors.conf

	[hscarlos@fedora ~]$ ls /usr/share/logwatch/default.conf/logfiles/

4. Debug de logwatch per a que envii el informe a root

	/usr/share/logwatch/scripts/logwatch.pl --debug 10 > debug_logwatch.txt

Si desde root es visualitza els mails que ha rebut, es podrà veure el següent missatge:

	logwatch@localhost.l  Sun May 22 19:44  41/1482  "Logwatch for fedora (Linux)"

Amb el contingut tipus:

	 ################### Logwatch 7.4.0 (03/01/11) ####################
			Processing Initiated: Sun May 22 19:53:34 2016
			Date Range Processed: yesterday
								  ( 2016-May-21 )
								  Period is day.
			Detail Level of Output: 10
			Type of Output/Format: mail / text
			Logfiles for Host: fedora
	 ##################################################################

	 --------------------- Disk Space Begin ------------------------

	 DEBUG: Inside zz-disk-space Filter

	 Filesystem               Size  Used Avail Use% Mounted on
	 devtmpfs                 2.0G     0  2.0G   0% /dev
	 /dev/mapper/fedora-root   45G   26G   17G  61% /
	 /dev/sda6                477M  146M  302M  33% /boot
	 /dev/sdb1                 30G  4.1G   26G  14% /run/media/hscarlos/CHARLY
	 /dev/sda3                105G   82G   23G  79% /run/media/hscarlos/DATA


	 ---------------------- Disk Space End -------------------------


	 ###################### Logwatch End #########################

Per executar logwatch, es pot escriure només la comanda `logwatch` sense cap
opció, i agafarà per defecte el que hi ha configurat al fitxer.

Es pot posar al cron aquesta ordre per a que es realitzi en el moment
que desitjem.

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

