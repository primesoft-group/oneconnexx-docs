---
layout: page
title: FileSystemWatcher
permalink: "addins/de/filesystemwatcher/"
---

Das FileSystemWatcher AddIn dient zur Überwachung von Dateiordern und Dateien. Die Überwachung kann mit Detaipattern auf bestimmte Dateien eingeschränkt werden. Überwacht wird das Erstellen, Ändern, Umbenennen und/oder Löschen von Dateien.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | |
| AddIn Type | Event / Logic |
| Schnittstellen | In: Dateiverzeichnis |
| Transaktionen | 1 Transaktion pro Event |
| Ereignisse | Pro erkannte Änderung und Datei ein Event: &lt;Instanz&gt; (Parameter = file) |
| | |
| __Parameter__ | |
| directory | Zu überwachendes Verzeichnis (Pfad immer absolut) |
| usePolling | Art der Überwachung<br />true = Ordner wird periodisch überprüft, anhand pollingIntervall<br />false = Ordner wird dauernd überwacht |
| pollingInterval | PollingIntervall in Sekunden, falls usePolling = true |
| initialPull | true = Erzeugt beim Start des OneConnexx pro im zu überwachenden Verzeichnis vorhanderer Datei ein CreateEvent |
| includeSubdirectories | true = Alle Unterordner werden ebenfalls überwacht |
| filter | Das Dateipattern dient zur Einschränkungder der zu überwachenden Dateinamen. Bsp. "*.txt" -> Alle Dateien mit der Endung «.txt» werden überwacht |
| bufferSize | Interner Buffer in Bytes, Default =  8192 |
| ensureFileWrittenTimeOut | Das Schreiben einer Datei wird sofort erkannt. Um sicherzustellen, dass die Datei fertig geschrieben ist, bevor ein Event ausgelöst wird, kann ensureFileWrittenTimeOut gesetzt werden.<br />>0 = Wartezeit im ms bis Event ausgelöst wird<br />0 = Event sofort auslösen |
| createEvent | true = Löst einen Event aus beim Erstellen einer Datei |
| changeEvent | true = Löst einen Event aus beim Bearbeiten einer vorhandenen Datei |
| deleteEvent | true = Löst einen Event aus beim Löschen einer Datei |
| renameEvent | true = Löst einen Event aus beim Umbenennen einer Datei |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |


<!-- 
### Anwendungsbeispiele 

ToDo
-->

