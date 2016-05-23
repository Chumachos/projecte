# Centralització de logs amb syslog
Es pot definit la centralització de logs com el fet de que un pc servidor
reculli els logs generats per un altre pc o conjunt de pc's.

Per a que s'entengui millor que és al centralització, es posarà un exemple
de quina manera realitzar-ho amb el classic syslog. 

L'arxiu de configuració que es mencionarà al llarg d'aquest apartat és 
el que es troba a **/etc/rsyslog.conf**.

Per a fer-ho, cal especificar en el servidor en quin directori es vol
emmagatzemar els logs que provinguin del servei especificat.

A més, també es podria crear una plantilla per a que tots els logs compleixin
el format que l'administrador desitja.

La part important d'aquesta centralització és com fer que el client pugui
enviar els logs al servidor. Per a fer-ho, en l'arxiu de configuració
s'ha d'afegir la següent linia amb la substitució corresponent:

	SERVEI_A_ENVIAR @IP_HOST_DESTI:PORT


## Centralització de logs amb journal
### Servidor

	dnf install -y systemd-journal-gateway 

systemctl enable systemd-journal-remote.socket

Editar /etc/systemd/system/sockets.target.wants/systemd-journal-remote.socket

	 [Socket]
	 ListenStream=19532

No es tocarà res, sino que es deixarà per defecte. Aquest mateix port
es configurarà al client també.

L'arxiu per a canviar el protocol de transferència de journal està situat a 
**/lib/systemd/system/systemd-journal-remote.service**. En aquest cas, utilitzaré
el que hi ha per defecte.

Crear el directori on emmagatzemar logs:

	mkdir /var/log/journal/central

Canviar els permissos per a que pugui emmagatzemar-los:

	chown systemd-journal-remote /var/log/journal/central

Reiniciarel servei després de configurar tot:

	systemctl restart systemd-journal-remote

### Client

	dnf install -y systemd-journal-gateway 

Editar /etc/systemd/journal-upload.conf

	 [Upload]
	 URL=http://10.250.2.0:19532

Permetre a journal-upload estar encès al iniciar el sistema

	systemctl enable systemd-journal-upload.service

Reiniciar la configuració de journal-upload:

	systemctl restart systemd-journal-upload.service

Si fem un status, podem veure el següent codi d'error, per tant, encara
no funciona:

	Failed to read state file /var/lib/systemd/journal-upload/state: Permission denied

Una solució, tot i que incorrecte, seria la de canviar els permisos al directori
i permetre que qualsevol tingui accés. Per tant es realitzarà la ordre
`chmod 777 /var/lib/systemd/journal-upload`.

Afegir a l'usuari al grup per a que pugui escriure i veure el directori:

	usermod -a -G systemd-journal systemd-journal-remote 

	 [vimet@localhost ~] systemctl status systemd-journal-upload
	
	  systemd-journal-upload.service - Journal Remote Upload Service
	   Loaded: loaded (/usr/lib/systemd/system/systemd-journal-upload.service; enabled; vendor preset: disabled)
	   Active: active (running) since dl 2016-05-23 10:10:57 CEST; 836ms ago
	 Main PID: 1570 (systemd-journal)
	   Status: "Processing input..."
	   CGroup: /system.slice/systemd-journal-upload.service
			   └─1570 /usr/lib/systemd/systemd-journal-upload --save-state

	mai 23 10:10:57 localhost.localdomain systemd[1]: Started Journal Remote Upload Service.
	mai 23 10:10:57 localhost.localdomain systemd[1]: Starting Journal Remote Upload Service...

