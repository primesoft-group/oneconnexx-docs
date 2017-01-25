---
layout: page
title: DatabaseToCSV
permalink: "addins/de/databasetocsv/"
---

Das DatabaseToCSV AddIn erzeugt aus einer SQL Abfrage eine oder mehrere CSV-Dateien.

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | |
| AddIn Type | Logic |
| Schnittstellen | In: Datenbank<br /> Out: CSV-Datei|
| Transaktionen | 1 pro erstellte Datei |
| Ereignisse | Pro erstellte Datei: &lt;Instanz&gt;.Output (Parameter = file) <br />&lt;Instanz&gt;.Done |
| | |
| __Parameter__ | |
| connectionString | Verbindungszeichenfolge der Datenbank | 
| delimiter | Trennzeichen in CSV-Datei (Optional, Default = Semikolon) | 
| encoding | Kodierung der CSV-Datei (Optional, Default = "UTF-8") | 
| fileNamePattern | Dateiname der CSV-Datei.<br/> Mit dem Platzhalter {0} kann das aktuelle Datum/Zeit verwendet werden. Bsp. File_{0: yyyyMMdd_hhmmss}.csv = File_20160523_115620.csv<br/>Bestehende Dateien werden überschrieben | 
| fileSaveLocation | Zielverzeichnis der CSV-Datei | 
| includeColumnName | true: Spaltenname werden in oberste Zeile geschrieben (Optional, default = false) | 
| query | Eine SQL Abfrage welche die zu exportierenden Daten zurückgibt; Nur SELECT oder EXEC sind erlaubt; Pro Datensatz wird eine CSV-Datei erstellt; Bei mehreren Datensätzen wird der Dateiname im SQL nach den Daten definiert. Zum Beispiel:<br/> select * from BR_StatusText; select 'BR_StatusText.csv'; <br/> select * from RE_EFStatus; select 'RE_EFStatus.csv' | 
| timeOut | Timeout in Sekunden bis der SQL-Befehl abgebrochen wird. (Optional, default = 30) | 
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |
 
 
## Anwendungsbeispiele 

Oftmals erhält die IT den Auftrag periodisch Datensätze aus einer Datenbank zu exportieren, damit die Fachbereiche die Angaben überprüfen oder weiterverarbeiten können.<br />
<br />
__Das AddIn DatabaseToCSV übernimmt künftig diesen Job!__<br />
<br />
Dazu wird eine SQL-Abfrage definiert, welcher einen oder mehrere Datensätze retourniert. Pro Datensatz wird eine CSV-Datei generiert.
Ein Timer, welcher das AddIn DatabaseToCSV periodisch aufruft und ein MailSender, welcher den Fachbereich über die neu erstellten CSV-Dateien informiert, runden das Paket ab.

