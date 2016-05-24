# Migració de Syslog a Journal
**Alumne**: Carlos Hormigo

**Centre**: Escola del Treball

**Curs**: ASIX-2 (2015-2016)

**Data**: 2016/05/24

---------------

# COMPARACIÓ INICIAL SYSLOG-JOURNAL 

DIFERÈNCIES

* Autenticació

* Timestamp

* Integració

* Visualitzar logs

* Format logs

---------------

# MANIPULACIÓ LOGS

* Logs de syslog - grep

	* /var/log/messages
	
	* /var/log/*file.log*
	
	* /var/log/*servei*/*file.log*

* Logs de journal - journalctl 

	* /var/log/journal/*ID*


---------------

# MANIPULACIÓ LOGS

* Logs de syslog

		TIMESTAMP HOST DAEMON MESSAGE
		
		May 22 18:07:52 fedora gnome-session: 
		Fontconfig error: Cannot load default 
		config file
	
	* grep
	
	* cut
	
	* sed
	
	* head / tail
	
---------------

# MANIPULACIÓ LOGS

* Logs de journal - journalctl 

	* Filtre segons nom daemon
	
	* Temps
	
	* Prioritat
	
	* ID boot
	
---------------

# COMPARACIONS

1. Rotació

	* Logrotate
	
		* /etc/logrotate.conf 
		
		* /etc/logrotate.d/*fitxer-servei*
	
	* Journal rotate

		* /etc/systemd/journald.conf
		
---------------

# COMPARACIONS

2. Informes de logs

	* Logwatch
		
		* /etc/cron.daily/0logwatch
		
		* /etc/logwatch/conf/logwatch.conf

	* Journal watch

---------------

# COMPARACIONS

3. Centralització de logs

	* Syslog
	
		* /etc/rsyslog.conf

	* Journal
	
		* /etc/systemd/system/sockets.target.wants/\
		systemd-journal-remote.socket
	
		* /lib/systemd/system/systemd-journal-remote.service
		
---------------

# ROTACIÓ: SYSLOG

**SIMILITUTS**: Període per ésser rotat

* hourly
	
* daily
	
* weekly 
	
* monthly

---------------

# ROTACIÓ: JOURNAL

**SIMILITUTS**: Període per ésser rotat

MaxFileSec=

* m 

* h 

* day 

* week 

* month 

* year

---------------

# ROTACIÓ

**SIMILITUTS**: Tamany per rotar

* Syslog

	size x(M/G)

* Journal
	
	SystemMaxFileSize=x(K/M/G/T/P/E)

---------------

# ROTACIÓ

DIFERENTS UTILITATS

* Syslog

	* Quantitat arxius que es roten: *rotate x*
	
		* slapd.log-20160512-1463049001
		* slapd.log-20160517-1463474706
		* slapd.log
	
	* Format files
	
	* Afegir script al haver rotat
	
---------------

# ROTACIÓ

DIFERENTS UTILITATS

* Journal

	* Eliminar logs amb x antiguitat
	
	* Limitar tamany que ocupa en disc
	
	* Logs d'usuaris
	
		* system.journal
		* user-1000.journal
		* user-1001.journal
	
---------------

# GENERACIÓ D'INFORME

* Logwatch

	* Opcions
	
		* --mailto root --detail 10 --service All"

	* Fitxer de configuració
		
		* MailFrom - MailTo - Service
	
	* Ús de crontab

---------------

# GENERACIÓ D'INFORME

* I journal?

	* syslog-ng/rsysnc
	
	* Script
	
	* Exportar journalctl
	

---------------

# CENTRALITZACIÓ

* Syslog 

	* Client
	
		servei @IP_host_desti:port
	
	* Servidor
	
		servei *directori*

---------------

# CENTRALITZACIÓ

* Journal - 
systemd-journal-gateway 

	* Client - upload:
		
		* /etc/systemd/journal-upload.conf
		
	* Servidor - remote
	
		* /lib/systemd/system/systemd-journal\
		-remote.service

---------------

# PREGUNTES?

---------------

# GRÀCIES

