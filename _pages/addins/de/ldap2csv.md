---
layout: page
title: Ldap2CSV
permalink: "addins/de/ldap2csv/"
language: de
---

Das Ldap2CSV Add-In ermittelt via LDAP Angaben aus dem AD (Active Directory) und speichert diese in einer CSV-Datei.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Logic |
| Schnittstellen | In: LDAP<br />Out: File |
| Transaktionen | 1 wenn erfolgreich |
| Ereignisse | &lt;Instanz&gt;.Done (Parameter = file)|
| | |
| __Parameter__ | |
| userName | Benutzer mit den für das LDAP erforderlichen Berechtigungen. Der Benutzer muss im LDAP Format angegeben werden, z.B. cn=read-only-admin,dc=example,dc=com. Falls kein Benutzer angegeben wird und authenticationType = Secure ist, wird die Identität des OneConnexx Services verwendet. |
| password | Zugehöriges Passwort (Optional) |
| domain | Name oder IP-Adresse des LDAP Servers<br/>Bsp.: corp.sevitec.ch |
| root | Die BaseDN definiert, wo im Verzeichnisbaum abwärts die Suche nach bestimmten Objekten gestartet werden soll<br/>Bsp.: CN=Configuration,DC=corp,DC=sevitec,DC=ch |
| authenticationType | Secure = Für die Anmeldung an den LDAP Server wird der im Paramter "userName" angegebene Benutzer verwendet, bzw. die Identität des OneConnexx Service wenn kein Benutzer angegeben wurde.<br/>Anonymous = Die Anmeldung am LDAP Server erfolgt anonym. |
| sizeLimit | Anzahl Einträge, welche maximal exportiert werden (Optional, Default = 1000) |
| filter | Zur Einschränkung auf bestimmte Objekte, z.B. "(objectClass=person)" (Optional)<br/>Der Platzhalter {lastrun} wird durch einen Zeitstempel der letzten erfolgreichen Ausführung ersetzt. |
| properties | Die zu exportierende LDAP-Spalten durch Kommas getrennt.<br />Datentyp, Format und CSV-Spaltenname können durch # getrennt angefügt werden (Beispiel: "pwdLastSet#date#yyyy-MM-dd#Passwort gesetzt")<br/>Domänenattribute starten mit $ (Beispiel: "$maxPwdAge#ticks").<br/>Die Platzhalter {now} und {lastMonth} können für das aktuelle Datum bzw. den letzten Monat verwendet werden (Beispiel: "{now:yyyy-MM-dd}###todayDate").<br/>Datentyp: leer = Text, "date" = Datum, "ticks" = Ticks<br/>Format: Datumsformat als .NET String-Format Ausdruck, nur für Datentyp "date" (z.B. "dd.MM.yyyy" oder "yyyMMddHHmmss") |
| fileNamePattern | Name der zu erstellenden Datei. Folgende Platzhalter stehen zur Verfügung: <br />{now}: Aktuelles Datum<br />{lastMonth}: Datum des letzten Monates |
| fileSaveLocation | Verzeichnis in dem die Datei erstellt wird |
| delimiter | Trennzeichen der Spalten in der CSV Datei (Optional, Default = Semikolon) |
| includeHeaderRow | true = inklusive Spaltenüberschriften in der ersten Zeile<br/>false = ohne Spaltenüberschriften |
| encoding | Kodierung der CSV-Datei (Optional, Default = "utf-8") |
| additionalData | Kommaseparierte List von Schlüssel-Wert-Paaren welche die im Parameter "properties" angegebenen Spalten überschreiben. Der Schlüssel muss dabei dem Spaltenname entsprechen. (Optional)<br/>Beispiel: Spalte1=Wert1,Spalte2=Wert2  |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |

### Anwendungsbeispiele 

##### Datum formatieren

Um zum Beispiel das Datum auszugeben, an dem ein Benutzer zuletzt sein Passwort geändert hat, kann folgender Ausdruck im Parameter "properties" verwendet werden:
```
pwdLastSet#date#yyyy-MM-dd#Passwort gesetzt
```

##### Ein Feld mit fixem Text einfügen

Soll in der erstellten CSV Datei eine Spalte mit fixem Text eingefügt werden, kann der fixe Text im Parameter "additionalData" angegeben werden:

```
identifier_manager=keepmymanager
```

Falls unter "properties" ein Attribut mit dem Namen "identifier_manager" existiert, wird dieses durch den fixen Text "keepmymanager" ersetzt.

##### Den Wert eines Bits aus einer Bitmaske anzeigen

Mit dem Datentyp "bitmask" kann ein integer oder long Wert mit einer Bitmaske UND verknüpft werden. Die Bitmaske wird dabei dem Datentyp durch einen Unterstrich getrennt nachgestellt. Folgendes Beispiel prüft das 2. Bit des AD Attributs "userAccountControl":

```
userAccountControl#bitmask_2#!bool#active
```

Wird kein Format angegeben, wird direkt das Resultat der UND Verknüpfung angezeigt, in diesem Beispiel also 2. Das Format "bool" gibt 1 zurück, falls der Wert ungleich 0 ist, oder 0 wenn der Wert gleich 0 ist. Das Format "!bool" funktioniert genau gleich, invertiert aber das Ergebnis.
