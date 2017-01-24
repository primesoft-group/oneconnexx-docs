---
layout: page
title: Dispatcher
permalink: "addins/de/dispatcher/"
---

Das Dispatcher AddIn löst aufgrund einer SQL Abfrage OneConnexx Events aus.
Pro Eintrag im Ergebnis der SQL Abfrage wird ein Event mit den retournierten Werten ausgelöst.

## Merkmale

{:.table .table-striped}
| --- | --- |
| AddIn Type | Event / Logic |
| Schnittstellen |  |
| Transaktionen | 1 wenn mind. 1 Datensatz |
| Ereignisse | Pro DataRow: <Instanz> (Parameter = Alle Spalten der SQL-Abfrage)<br /><Instanz>.Done |


## Parameter

{:.table .table-striped}
| --- | --- |
| connectionString | Verbindungszeichenfolge der Datenbank |
| query | SQL Abfrage<br />Für jede zurückgegebene Zeile wird ein Ereignis ausgelöst |
| dueTimeColumn | Name der Spalte die eine Tageszeit enthält, zu der der Datensatz verarbeitet werden soll (Optional, Default = "") |
| lastProcessedColumn | Name der Spalte die einen Zeitstempel enthält, wann der Datensatz zuletzt verarbeitet wurde (Optional, Default = "") |
| updateQuery | SQL Befehl zum Aktualisieren des Zeitstempels (in 'lastProcessedColumn') nachdem ein Datensatz verarbeitet wurde (Optional, Default = "") |
| configUrl | Link zur erweiterten Konfiguration (Optional, Default = "") |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |

## Anwendungsbeispiele

Das Dispatcher AddIn wird von einem Timer AddIn stündlich aufgerufen. Es fragt den Inhalt einer bestimmten Tabelle mit einem bestimmten Status oder weiteren bestimmen Angaben ab. So werden neue Einträge erkannt und können weiterverarbeitet werden.
In der Antwort erhält das Dispatcher AddIn weitere Angaben, welche zur Weiterverarbeitung benötigt werden.
Pro Eintrag erstellt das Dispatcher AddIn  einen Event, welcher von weiteren AddIns abonniert werden können.

