---
layout: page
title: DatabaseToCSV
permalink: "addins/de/databasetocsv/"
---

Das DatabaseToCSV Add-In erzeugt aus einer SQL Abfrage eine oder mehrere CSV-Dateien.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Logic |
| Schnittstellen | In: Datenbank<br /> Out: CSV-Datei|
| Transaktionen | 1 pro erstellte Datei |
| Ereignisse | Pro erstellte Datei: &lt;Instanz&gt;.Output (Parameter = file) <br />1x am Schluss: &lt;Instanz&gt;.Done |
| | |
| __Parameter__ | |
| connectionString | Verbindungszeichenfolge der Datenbank | 
| delimiter | Trennzeichen in der CSV-Datei (Optional, Default = Semikolon) | 
| encoding | Kodierung der CSV-Datei (Optional, Default = "UTF-8") | 
| fileNamePattern | Dateiname der CSV-Datei<br/>Wird ignoriert wenn der Dateiname von der SQL Abfrage zurückgegeben wird. Der Platzhalter {0} wird durch einen aktuellen Zeitstempel ersetzt. Bsp.: File\_{0: yyyyMMdd_hhmmss}.csv = File\_20160523\_115620.csv<br/>Bestehende Dateien werden überschrieben. | 
| fileSaveLocation | Zielverzeichnis der CSV-Datei | 
| includeColumnName | true: Spaltenname werden in die 1. Zeile geschrieben (Optional, default = false) | 
| query | Eine SQL Abfrage welche die zu exportierenden Daten zurückgibt<br />Nur SELECT oder EXEC sind erlaubt. Pro Resultatset wird eine CSV-Datei erstellt | 
| timeOut | Timeout in Sekunden bis der SQL-Befehl abgebrochen wird. (Optional, default = 30) | 
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |
 
 
### Anwendungsbeispiele 

Oftmals erhält die IT den Auftrag periodisch Datensätze aus einer Datenbank zu exportieren, damit die Fachbereiche die Angaben überprüfen oder weiterverarbeiten können.

Dazu wird eine SQL-Abfrage definiert, welche die Daten zurückgibt. Ein Timer, welcher das Add-In DatabaseToCSV periodisch aufruft und ein MailSender, welcher den Fachbereich über die neu erstellten CSV-Dateien informiert, runden das Paket ab.

##### Dateiname in SQL-Abfrage festlegen

Wird von der SQL-Abfrage ein 2. Resultatset zurückgegeben, dann wird die 1. Spalte der 1. Zeile des 2. Resultatsets als Dateiname interpretiert. Beispiel:
```
SELECT * FROM DataTable;
SELECT 'DataTable_export.csv'; 
```

##### Erstellen mehrerer CSV-Dateien


