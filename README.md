# Projekt Ghost Dive - Junior Sysadmin Homelab
Inspiriert durch den Anime Ghost in the Shell 1998 I Public Security Section 9

## Vorbereitung
- Dokumentation geschrieben

## Phase 0 - Infrastruktur aufsetzten 
- Windows Server 2022 Active Directory Domain aufgebaut
- Domain: section9.gov.jp
- DNS und DHCP konfiguriert
- Workstation S9-WRK01 domain joined
- Erster Domain User m.kusanagi erfolgreich eingeloggt

### Erkenntnisse Phase 0
- Shutdown Event Tracker - jeder shutdown muss begründet werden
- DSRM Passwort ist das Notfall Passwort für den DC
- NAT Adapter deaktiviert damit DC nur auf ghost-net antwortet

### Troubleshooting Phase 0
- WRK01 wurde keine automatische IP durch DHCP zugeteilt
  Lösung: Ethernet 2 aktiviert und kontroll mite ipconfig
- Domain Join fehlgeschalgen - Erstellter Benutzer Motoko Kusanagi wurde auf S9-WRK01 nicht als Benutzer erkannt.
  Lösung: Statische IP mit DNS 192.168.9.10 manuell gesetzt und Domain manuell hinzugefügt, war immer noch auf Arbeitsgruppe hinterlegt.

## Phase 1 - FileServer - Shares, NTFS und Drive Mapping
- 20 Benutzer per PowerShell angelegt
- 5 OUs erstellt + AllUsers
- 6 GPOs erstellt
- FileServer S9-SRV01 aufgebaut
- 6 Shares mit NTFS Berehctigungen erstellt
- NTFS Berechtigungen gesetzt
- Drive-Mapping Mission M: hinzugefügt

### Erkenntnis


### Troubleshooting
Restriction bei allen auch local admin/ Domain User gesetzt. Hatte zu folge das ich keine Systemaplikationen mehr öffnen konnte.
Software-Restriction gezielt auf Abteilung Field_Ops gesetzt.
  

  
