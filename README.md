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

## Phase 1 - 
- Benutzer angelegt mit CSV-Datei und import in Powershell
- Sicherheitsgruppen erstellt und Benutzer hinzugefügt
- Sicherheitsgruppe allUser erstellt und Benutzer hinzugefügt
- Group Policy Objects (GPO) gesetzt
  Password-Policy, Account-Lockout, Desktop-Policy, Firewall-Policy, USB-Restriction, Software-Restriction

### Troubleshooting
Restriction bei allen auch local admin/ Domain User gesetzt. Hatte zu folge das ich keine Systemaplikationen mehr öffnen konnte.
Software-Restriction gezielt auf Abteilung Field_Ops gesetzt.
  

  
