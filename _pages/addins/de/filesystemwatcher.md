---
layout: page
title: FileSystemWatcher
permalink: "addins/de/filesystemwatcher/"
---

Der FileSystemWatcher dient zur Überwachung von Dateiordern und Dateien. Die Überwachung kann mit Filepattern auf bestimmte Dateien eingeschränkt werden. Überwacht wird das Erstellen, Ändern, Umbenennen und/oder Löschen von Dateien.

## Merkmale

{:.table .table-striped}
| --- | --- |
| AddIn Type | Event / Logic |
| Schnittstellen | In: Dateiverzeichnis |
| Transaktionen | 1 Transaktion pro Event |
| Ereignisse | Pro erkannte Änderung und Datei ein Event: <Instanz> |
| Ereignis-Parameter | Datei |


## Parameter

{:.table .table-striped}
| --- | --- |
| directory | Zu überwachender Ordner, Pfad immer absolut. Bsp. "C:/users/currentUser/documents" |
| usePolling | Art der Überwachung<br />true = Ordner wird periodisch überprüft, anhand pollingIntervall<br />false = Ordner wird dauernd überwacht |
| pollingInterval | PollingIntervall in Sekunden, falls usePolling = true |
| initialPull | true = Erzeugt beim Start des OneConnexx pro Datei ein CreateEvent<br />false = "" |
| includeSubdirectories | true = Alle Unterordner werden ebenfalls überwacht<br />false = "" |
| filter | Filename Pattern der zu überwachenden Dateinamen. Bsp. "*.txt" -> Alle Dateien mit der Endung «.txt» werden überwacht |
| bufferSize | Interner Buffer in Bytes, Default =  8192 |
| ensureFileWrittenTimeOut | Das Schreiben einer Datei wird sofort erkannt. Um sicherzustellen, dass die Datei fertig geschrieben ist, bevor ein Event ausgelöst wird, kann ensureFileWrittenTimeOut gesetzt werden.<br />>0 = Wartezeit im ms bis Event ausgelöst wird<br />0 = Event sofort auslösen |
| createEvent | true = Löst einen Event aus beim Erstellen einer Datei<br />false = Kein Event |
| changeEvent | true = Löst einen Event aus beim Bearbeiten einer vorhandenen Datei<br />false = Kein Event |
| deleteEvent | true = Löst einen Event aus beim Löschen einer Datei<br />false = Kein Event |
| renameEvent | true = Löst einen Event aus beim Umbenennen einer Datei<br />false = Kein Event |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional) |


<!-- 
## Anwendungsbeispiele 

ToDo
-->

