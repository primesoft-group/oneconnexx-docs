---
layout: page
title: Ldap2CSV
permalink: "addins/de/ldap2csv/"
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
| userName | Benutzer mit den für das LDAP erforderlichen Berechtigungen. Der Benutzer muss im LDAP Format angegeben werden, z.B. cn=read-only-admin,dc=example,dc=com. Falls kein Benutzer angegeben wird und authenticationType = Secure ist, wird die Identität des OneConnexx Services verwendet. (Optional) |
| password | Zugehöriges Passwort (Optional) |
| domain | Name oder IP-Adresse des LDAP Servers |
| root | Bei der Suche nach unterliegenden Objekt Klassen, kann das Root Objekt definiert werden (Optional) |
| authenticationType | Secure = Für die Anmeldung an den LDAP Server wird der im Paramter "userName" angegebene Benutzer verwendet, bzw. die Identität des OneConnexx Service wenn kein Benutzer angegeben wurde.<br/>Anonymous = Die Anmeldung am LDAP Server erfolgt anonym. |
| sizeLimit | Anzahl Einträge, welche maximal exportiert werden (Optional, Default = 1000) |
| filter | Zur Einschränkung auf bestimmte Klassen (Optional) |
| properties | Zu exportierende Properties<br />Domänen Attribute starten mit $<br/>Typ, Format und Kolonnen Namen werden mit # getrennt (Bsp. "$DomänenAttribut#date#yyyy-MM-dd#KolonnenNamen")<br/>Mehrere Eingaben werden mit "," getrennt |
| fileNamePattern | Name der zu erstellenden Datei. Folgende Platzhalter stehen zur Verfügung: <br />{now}: Aktuelles Datum<br />{lastMonth}: Datum des letzten Monates |
| fileSaveLocation | Verzeichnis wohin die Datei erstellt wird |
| delimiter | Trennzeichen der Spalten in der CSV Datei (Optional, Default = Semikolon ) |
| includeHeaderRow | true = inklusive Spaltenüberschriften (Optional, Default = true) |
| encoding | Kodierung der CSV-Datei (Optional, Default = "utf-8") |
| additionalData |  |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |

<!-- 
### Anwendungsbeispiele 

ToDo
-->

