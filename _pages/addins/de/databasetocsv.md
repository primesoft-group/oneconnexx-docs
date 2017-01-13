---
layout: page
title: Standard AddIns
permalink: "addins/de/databasetocsv/"
---

##  DatabaseToCSV

Erzeugt aus einer SQL Abfrage eine oder mehrere CSV-Dateien

__Merkmale__

{:.table .table-striped}
| --- | --- |
| AddIn Type |  |
| Schnittstellen |  |
| Transaktionen |  |
| Ereignisse |  |
| Ereignis-Parameter |  |


__Parameter__

{:.table .table-striped}
| Parameter | Beschreibung |                      
| --- | --- |
| connectionString | Verbindung zur Datenbank | 
| delimiter | Trennzeichen in CSV-Datei (Optional, default = ;) | 
| encoding | Kodierung der CSV-Datei (Optional, default = «UTF-8») | 
| fileNamePattern | Dateiname der CSV-Datei. 
Mit dem Platzhalter {0} kann das aktuelle Datum/Zeit verwendet werden. Bsp. File_{0: yyyyMMdd_hhmmss}.csv = File_20160523_115620.csv 
Falls ein File mit diesem Namen in demselben Directory bereits existiert, wird dieses überschrieben. | 
 | fileSaveLocation | Zielordner der CSV-Datei | 
 | includeColumnName  |  
true: Spaltenname werden in oberste Zeile geschrieben
false: Keine Überschriften | 
 | query | Die SQL Abfrage für die Ermittlung der Daten
-	Nur SELECT oder EXEC sind erlaubt
-	Pro Datensatz wird eine CSV-Datei erstellt
-	Bei mehreren Datensätzen wird der Dateiname im SQL nach den Daten definiert. Zum Beispiel:
select * from BR_StatusText; select 'BR_StatusText.csv'; 
select * from RE_EFStatus; select 'RE_EFStatus.csv'
 | 
 | timeOut | Timeout in Sekunden bis der SQL-Befehl abgebrochen wird. (Optional, default = 30) | 
 | endpoint | Endpunktname für die Transaktion (Statistik) | 
 
 
__Anwendungsbeispiele__

