---
layout: page
title: Csv2Database
permalink: "addins/de/csv2database/"
---

Das Csv2Database Add-In lädt Daten aus einer CSV-Datei in eine SQL Datenbanktabelle.
Alle Zeilen in der CSV-Datei werden entweder als neue Datensätze in die Datenbank eingefügt, oder wenn ein Primärschlüssel
angegeben wurde aktualisiert.
Die erste Zeile der CSV-Datei muss die Spaltennamen enthalten. Es werden nur diejenigen Spalten in die Datenbank eingefügt, deren Namen exakt mit den Spaltennamen der Datenbanktabelle übereinstimmen.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Logic |
| Schnittstellen | In: CSV-Datei<br /> Out: Datenbank|
| Transaktionen | 1 pro verarbeitete Datei |
| Ereignisse | 1x am Schluss: &lt;Instanz&gt;.Done |
| | |
| __Parameter__ | |
| connectionString | Verbindungszeichenfolge der Datenbank | 
| tableName | Name der Datenbanktabelle in welche Daten eingefügt werden | 
| sourceDirectory | Quellverzeichnis in dem CSV Dateien gesucht werden | 
| sourceFilePattern | Muster für die Suche nach CSV-Dateien | 
| csvDelimiter | Das genutzte Trennzeichen in der CSV-Datei |
| archiveDirectory | Optional ein Verzeichnis in das die eingelesenen Dateien verschoben werden |
| errorDirectory | Optional ein Verzeichnis in das Dateien verschoben werden wenn ein Fehler aufgetreten ist |
| useDbTransaction | Wenn 'true' werden alle Datenbankoperationen innerhalb einer Transaktion ausgeführt. Wenn ein INSERT/UPDATE fehlschlägt wird die gesamte Transaktion rückgängig gemacht. |
| preCommand | Optional ein SQL Befehl der vor dem Einlesen der CSV-Dateien ausgeführt wird |
| postCommand | Optional ein SQL Befehl der nach dem Einlesen der CSV-Dateien ausgeführt wird |
| primaryKey | Optional der Name des Primärschlüssels der Datenbanktabelle. Falls angegeben, wird zuerst nach einem Datensatz mit diesem Primärschlüssel gesucht und dieser aktualisiert. Wenn kein solcher Datensatz gefunden wurde wird ein neuer Datensatz eingefügt. |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |
 
 
### Anwendungsbeispiele 

##### Quelldatei über "file" Parameter

Wird das Csv2Database Add-In über ein Ereignis aktiviert das einen Parameter "file" enthält, wird die Datei in diesem Parameter als CSV-Datei interpretiert und in eine CSV-Datei umgewandelt. In diesem Fall werden die konfigurierten Parameter "sourceDirectory" und "sourceFilePattern" ignoriert.

Ereignisse mit "file" Parameter können von folgenden Add-Ins abonniert werden:
* DatabaseToCSV
* FileDecompressor
* FileCompressor
* FileCopy
* FileReconstructor
* FileSystemWatcher
* Ldap2CSV
* Xml2Csv
