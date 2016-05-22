# Centralització de logs
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


## Per què no hi ha exemple amb journal?
Després d'haver navegat per diversos fòrums, he arribat a la conclusió després
de llegir comentaris i diverses opinions que journal **no està preparat**
per a centralitzar els logs, degut als diferents problemes que comporta.

Tot i això, si que es pot centralitzar els logs amb journal, però d'una
manera més complicada que syslog.s
