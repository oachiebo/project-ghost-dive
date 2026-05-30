# Phase 0 Infrastruktur

**Benötigte Dateien**
- Windows 10 ISO: https://www.microsoft.com/de-de/software-download/windows10
- Windows Server 2022 ISO (SERVER_EVAL_x64FRE_en-us.iso): https://www.microsoft.com/en-us/evalcenter/download-windows-server-2022

## 1. Server und Workstation bereitstellen
- S9-DC01, S9-SRV01 und S9-WRK01 im VirtualBox erstellt
  - Internes Netzwerk "ghost-net" erstellt und alle VMs verknüpft
- S9-DC01 und S9-SRV01: Windows Server 2022 ISO installiert
- S9-WRK01: Windows 10 ISO installiert

## 2. Grundkonfiguration
- Statische IP auf S9-DC01 gesetzt
- Domain "section9.gov.jp" erstellt
- DNS, DHCP und Gateway konfiguriert
- S9-WRK01 der Domain "section9.gov.jp" beigetreten (Domain Join)
- Erster Benutzer "Motoko Kusanagi" angelegt

### 3. Active Directory
- Organizational Units (OUs) erstellt

## Erkenntnisse
- Das DSRM-Passwort (Directory Services Restore Mode) ist das Notfall-Recovery-Passwort für den Domain Controller.
- Der NAT-Adapter in VirtualBox sollte für ein sauberes internes Lab deaktiviert werden, damit der gesamte Traffic nur über ghost-net läuft.
- Der DNS-Server auf dem DC muss auf sich selbst zeigen, also die eigene IP als bevorzugten DNS eintragen, nicht auf externe Server.
- Bei zwei Ethernet-Adaptern (Ethernet und Ethernet 2) wird nur der erste konfiguriert. Ethernet 2 ist der NAT-Adapter und bleibt unberührt.

## Troubleshooting
### Problem: nslookup zeigt DNS-Server als "Unknown"
- **Symptom:** "nslookup section9.gov.jp" gibt als Server "Unknown" mit Adresse "::1" (IPv6) zurück statt "192.168.9.10"
- **Ursache:** Windows bevorzugt standardmässig IPv6 – der DNS-Request ging auf den IPv6-Loopback statt auf den konfigurierten IPv4-DNS.
- **Lösung:** IPv6 auf dem Ethernet-Adapter deaktiviert
- **Ergebnis:** DNS-Server zeigt korrekt "192.168.9.10" – "Unknown" beim Servernamen ist normal und kein Fehler (fehlender Reverse-DNS-Eintrag)
