---
layout: page
title: SharepointToDB
permalink: "addins/de/sharepointtodb/"
---

Das SharepointToDatabase Add-In exportiert Items einer Sharepoint Liste/Bibliothek in eine SQL Datenbank. Im Falle einer Dokumentenbibliothek kann das Dokument in ein binäres Datenbankfeld gespeichert werden.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Logic |
| Schnittstellen | Sharepoint |
| Transaktionen | 1 |
| Ereignisse | &lt;Instanz&gt;.Done |
| | |
| __Parameter__ | |
| spWebUrl | Sharepoint Web URL. |
| spListName | Name der Sharepoint-Liste oder -Bibliothek. |
| spViewName | (Optional) Name der Sharepoint-View welche die zu exportierenden Felder enthält. Wenn leer wird die Default-View verwendet. |
| spUser | (Optional) Benutzername zur Authentifizierung auf Sharepoint. |
| spPassword | (Optional) Passwort zur Authentifizierung auf Sharepoint. |
| entriesToExport | Legt fest, ob alle oder nur die seit der letzten Ausführung geänderten Einträge exportiert werden. |
| connectionString | Verbindungszeichenfolge zur Datenbank. |
| useDbTransaction | Wenn aktiv, wird eine Datenbank-Transaktion verwendet und bei einem Fehler ein Rollback durchgeführt. |
| tableName | Name der Datenbanktabelle. |
| primaryKeyColumn | (Optional) Name der Primärschlüssel-Spalte. Existierende Zeilen mit passendem Primärschlüssel werden gelöscht und neu eingefügt. |
| fileColumn | (Optional) Name der binären Datenbankspalte in welche die Datei geschrieben wird wenn es sich um eine Sharepoint Bibliothek handelt. |
| columnMapping | (Optional) Zuordnung von Sharepoint Feldern zu Datanbank Spalten. Beispiel: spField1:dbColumn1,spField2:dbColumn2 |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |


### Mapping der SharePoint-Felder zu Datenbank-Spalten

Standardmässig werden SharePoint-Felder in Datenbank-Spalten geschrieben die gleich heissen. Mittels des *columnMapping* Parameters kann dieses Verhalten beeinflusst werden. Folgendes Beispiel mappt ein SharePoint Feld "Account Type" auf die Datenbank-Spalte "AccountType":

Account_x0020_Type:AccountType


