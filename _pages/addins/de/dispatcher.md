---
layout: page
title: Dispatcher
permalink: "addins/de/dispatcher/"
---

Das Dispatcher Add-In löst aufgrund einer SQL Abfrage Ereignisse aus. Pro Datensatz im Ergebnis der SQL Abfrage wird ein Ereignis mit den zurückgegebenen Spalten als Parameter ausgelöst.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Event / Logic |
| Schnittstellen |  |
| Transaktionen | 1 wenn mindestens 1 Datensatz zurückgegeben wurde |
| Ereignisse | Pro Datensatz: &lt;Instanz&gt; (Parameter = Alle Spalten des Resultats der SQL Abfrage)<br />1x am Schluss: &lt;Instanz&gt;.Done |
| | |
| __Parameter__ | |
| connectionString | Verbindungszeichenfolge der Datenbank |
| query | SQL Abfrage<br />Für jede zurückgegebene Zeile wird ein Ereignis ausgelöst. |
| dueTimeColumn | Name der Spalte die eine Tageszeit enthält, zu der der Datensatz verarbeitet werden soll (Optional, Default = "") |
| lastProcessedColumn | Name der Spalte die einen Zeitstempel enthält, wann der Datensatz zuletzt verarbeitet wurde (Optional, Default = "") |
| updateQuery | SQL Befehl zum Aktualisieren des Zeitstempels (in 'lastProcessedColumn') nachdem ein Datensatz verarbeitet wurde (Optional, Default = "")<br />Platzhalter in geschweiften Klammern werden durch die entsprechenden Felder aus dem Resultat der SQL Abfrage "query" ersetzt. |
| configUrl | Link zur erweiterten Konfiguration (Optional, Default = "")<br />Der Platzhalter @instance wird durch den Namen der Add-In Instanz ersetzt. |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |

### Anwendungsbeispiele

Das Dispatcher Add-In wird von einem Timer Add-In stündlich aufgerufen. Es fragt den Inhalt einer bestimmten Tabelle mit einem bestimmten Status oder weiteren bestimmen Angaben ab. So werden neue Einträge erkannt und können weiterverarbeitet werden.
In der Antwort erhält das Dispatcher Add-In weitere Angaben, welche zur Weiterverarbeitung benötigt werden.
Pro Eintrag löst das Dispatcher Add-In ein Ereignis aus, welches von weiteren Add-Ins abonniert werden kann.

##### Ausführen zu bestimmten Tageszeiten

Voraussetzung: Eine Datenbank-Tabelle "Dispatcher" mit mindestens den Spalten "DispatcherId" vom Typ "int", "DueTime" vom Typ "nvarchar" und "LastProcessed" vom Typ "datetime".

Parameter: "dueTimeColumn" = "DueTime", "lastProcessedColumn" = "LastProcessed", "updateQuery" = "UPDATE Dispatcher SET LastProcessed = GETDATE() WHERE DispatcherId = {DispatcherId}"

Funktionsweise: Für jede Zeile im Resultat der SQL Abfrage wird nur dann ein Ereignis ausgelöst, wenn die aktuelle Tageszeit grösser als die Uhrzeit in "DueTime" ist, und die letzte Ausführung (in "LastProcessed") nicht innerhalb des aktuellen Tages liegt. Wurde ein Ereignis ausgelöst, wird die aktuelle Uhrzeit in die Spalte "LastProcessed" geschrieben.
