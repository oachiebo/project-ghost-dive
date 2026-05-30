# Phase 0 Infrastruktur aufsetzen

## Erkenntnisse
- DSRM Passwort = Notfall Recovery Passwort
- NAT Adapter deaktivieren für sauberes Lab

#### Benötigte Dateien
- Windows 10.iso für Workstation heruntergeladen
https://www.microsoft.com/de-de/software-download/windows10

- SERVER_EVAL_x64FRE_en-us.iso (Windows Server 2022) für VM Server heruntergeladen
https://www.microsoft.com/en-us/evalcenter/download-windows-server-2022

## 1. Server und Workstation bereitstellen
- Server S9-DC01, S9-SV01 und Workstation S9-WRK01 im VirtualBox erstellt
  - Netzwerk festgelegt: "ghost-net" und verknüpfen
  - Bei S9-DC01 und S9-SRV01 Windows Server 2022 ISO installiert
  - S9-WRK01 Windows 10 ISO installiert

## 2. Grundkonfiguration/ Active Directory Domain 
- Domain section9.gov.jp erstellt
- DNS, DHCP und Gateway gemäss Dokumentation konfiguriert
- Workstation S9-WRK01 in ghost.local einbinden (Domain joine)
- Erster Benutzer  "Motoko Kusanagi" angelegt 

### Troubleshooting
Workstation in Domain Join beim ersten mal nicht funktioniert. 
In S9-WRK01 Grundkonfig geprüft, DNS Adresse hat gefehlt, manuell gesetzt.

