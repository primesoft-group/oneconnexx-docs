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
| AddIn Type |  |
| Schnittstellen |  |
| Transaktionen | 1 wenn mind. 1 Datensatz |
| Ereignisse | <Instanz>.Done <br/> Pro DataRow: <Instanz> |
| Ereignis-Parameter | Alle Spalten der SQL-Abfrage |


## Parameter

{:.table .table-striped}
| --- | --- |
| connectionString | Angabe der Datenbank Verbindung der Datenbank, mit welcher man sich verbinden will. |
| query | SQL Query welche benutzt werden soll, um das Dataset zu bekommen, von welchem dann pro Zeile ein Event ausgeführt wird. |
| dueTimeColumn | Kolonnen Angabe welche besagt, ob für diese Zeile ein Event ausgeführt werden soll oder nicht. (Optional) |
| lastProcessedColumn | Angabe der Kolonne, welche die Informationen darüber hat, wann die Zeile als letztes verarbeitet wurde. (Optional) |
| updateQuery | SQL Query um das Datum in der Kolonne, welche im Parameter «lastProcessedColumn» angegeben wurde, zu aktualisieren. (Optional)  |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional) |

## Anwendungsbeispiele

Das Dispatcher AddIn wird von einem Timer AddIn stündlich aufgerufen. Es fragt den Inhalt einer bestimmten Tabelle mit einem bestimmten Status oder weiteren bestimmen Angaben ab. So werden neue Einträge erkannt und können weiterverarbeitet werden.
In der Antwort erhält das Dispatcher AddIn weitere Angaben, welche zur Weiterverarbeitung benötigt werden.
Pro Eintrag erstellt das Dispatcher AddIn  einen Event, welcher von weiteren AddIns abonniert werden können.

