# Phase 2 Netzwerk und Cloud

## Backup
- Im VirtualBox neue Festplatte erstellen Format VDI
- Einloggen in S9-SVR01
- Windows + R Befehl diskmgmt.msc ausführen
- Neues einfaches Volume auswählen
- Laufwerk Buchstaben festlegen

### Dateien wiederherstellen 
- Windows Server Backup GUI
- 


##Erkenntnisse Phase 2

### Troubleshooting Phase 2
Keine Verbindung ins Internet um Wireshark herunterzuladen. Adapter 2 (NAT) hinzugefügt der zuvor entfernt wurde. 
Firewall Policy angepasst Inbound und Outbound erlaubt und Outbound Regel erlauben Port 443 (HTTPS).
