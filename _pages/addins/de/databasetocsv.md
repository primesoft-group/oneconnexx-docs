---
layout: page
title: DatabaseToCSV
permalink: "addins/de/databasetocsv/"
---

Erzeugt aus einer SQL Abfrage eine oder mehrere CSV-Dateien.

## Merkmale

{:.table .table-striped}
| --- | --- |
| AddIn Type | Logic |
| Schnittstellen | In: Datenbank<br /> Out: CSV-Datei|
| Transaktionen | 1 pro erstellte Datei |
| Ereignisse | <Instanz>.Done <br /> Pro erstellte Datei: <Instanz>.Output |
| Ereignis-Parameter | Datei                                                                                           |


## Parameter

{:.table .table-striped}
| --- | --- |
| connectionString | Verbindung zur Datenbank | 
| delimiter | Trennzeichen in CSV-Datei (Optional, default = ;) | 
| encoding | Kodierung der CSV-Datei (Optional, default = «UTF-8») | 
| fileNamePattern | Dateiname der CSV-Datei.<br/> Mit dem Platzhalter {0} kann das aktuelle Datum/Zeit verwendet werden. Bsp. File_{0: yyyyMMdd_hhmmss}.csv = File_20160523_115620.csv<br/> Falls ein File mit diesem Namen in demselben Directory bereits existiert, wird dieses überschrieben. | 
| fileSaveLocation | Zielordner der CSV-Datei | 
| includeColumnName | true: Spaltenname werden in oberste Zeile geschrieben<br/> false: Keine Überschriften | 
| query | Die SQL Abfrage für die Ermittlung der Daten; Nur SELECT oder EXEC sind erlaubt; Pro Datensatz wird eine CSV-Datei erstellt; Bei mehreren Datensätzen wird der Dateiname im SQL nach den Daten definiert. Zum Beispiel:<br/> select * from BR_StatusText; select 'BR_StatusText.csv'; <br/> select * from RE_EFStatus; select 'RE_EFStatus.csv' | 
| timeOut | Timeout in Sekunden bis der SQL-Befehl abgebrochen wird. (Optional, default = 30) | 
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional) |
 
 

## Anwendungsbeispiele 

Oftmals erhält die IT den Auftrag periodisch Datensätze aus einer Datenbank zu exportieren, damit die Fachbereiche die Angaben überprüfen oder weiterverarbeiten können.<br />
<br />
__Das AddIn DatabaseToCSV übernimmt künftig diesen Job!__<br />
<br />
Dazu wird eine SQL-Abfrage definiert, welcher einen oder mehrere Datensätze retourniert. Pro Datensatz wird eine CSV-Datei generiert.
Ein Timer, welcher das AddIn DatabaseToCSV periodisch aufruft und ein MailSender, welcher den Fachbereich über die neu erstellten CSV-Dateien informiert, runden das Paket ab.

