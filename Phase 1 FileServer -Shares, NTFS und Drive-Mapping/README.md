# Phase 1 FileServer (Shares, NTFS und Drive-Mapping)

## 1. Active Directory – Benutzer und Gruppen
- Alle 20 Section 9 Benutzer per PowerShell mit CSV-Import angelegt
- Sicherheitsgruppen erstellt und Benutzer den entsprechenden Gruppen und OUs zugewiesen

## 2. File Server – Ordnerstruktur und Freigaben
- S9-SRV01 in Domain `section9.gov.jp` eingebunden
- Ordnerstruktur auf S9-SRV01 erstellt und Freigaben konfiguriert
- Share Permissions auf "Everyone – Full Control" gesetzt
- NTFS-Berechtigungen pro Sicherheitsgruppe gesetzt

## 3. Group Policy Objects (GPOs)
- Password Policy und Account Lockout Policy konfiguriert
- Desktop Policy, Firewall Policy und USB-Restriction erstellt
- Software Restriction Policy für OU Field_Ops eingerichtet
- Drive Mapping: Laufwerk M: → `\\S9-SRV01\Missions` per GPO verteilt
- GPOs mit `gpresult /r` auf S9-WRK01 geprüft und verifiziert

---

## Erkenntnisse
- Share Permissions immer auf "Everyone – Full Control" belassen – die eigentliche Zugriffskontrolle
  erfolgt ausschliesslich über NTFS Permissions, da immer die restriktivere Berechtigung gilt.
- GPOs werden nicht sofort angewendet – mit `gpupdate /force` kann man die Aktualisierung
  manuell erzwingen ohne Neustart.
- `gpresult /r` zeigt welche GPOs tatsächlich auf einem System wirksam sind und ist das 
  wichtigste Tool zur GPO-Fehlersuche.
- Beim CSV-Import müssen die Spaltenbezeichnungen in der CSV-Datei exakt mit dem Skript 
  übereinstimmen, sonst werden die Werte nicht eingelesen.

---

## Troubleshooting

### Problem: Laufwerk M: wird nach GPO nicht angezeigt
- **Symptom:** Laufwerk M: erscheint nach Login auf S9-WRK01 nicht
- **Ursache:** GPO noch nicht angewendet oder Benutzer nicht Mitglied der richtigen Gruppe
- **Lösung:** `gpupdate /force` ausführen, danach neu einloggen. Gruppenmitgliedschaft in AD prüfen.

### Problem: Zugriff auf Share wird verweigert
- **Symptom:** Fehlermeldung "Zugriff verweigert" beim Öffnen des gemappten Laufwerks
- **Ursache:** NTFS-Berechtigungen fehlten oder Benutzer war noch nicht der Sicherheitsgruppe zugewiesen
- **Lösung:** NTFS-Berechtigungen geprüft und korrigiert. Nach Gruppenänderung muss der Benutzer
  sich neu anmelden damit das Zugriffstoken aktualisiert wird.
