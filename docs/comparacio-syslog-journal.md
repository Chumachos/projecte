# JOURNAL -  COMPARACIÓ AMB SYSLOG
## LOGS AL ARRENCAR EL SISTEMA
syslog → dmesg
journalctl  → journalctl -k

## CONJUNT DE LOGS DEL SISTEMA
syslog → [tail -10] /var/log/file-log
journalctl → journalctl [-n 10]
