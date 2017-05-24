---
layout: page
title: FileSystemWatcher
permalink: "addins/de/filesystemwatcher/"
---

Das FileSystemWatcher Add-In dient zur Überwachung von Verzeichnissen und Dateien. Die Überwachung kann mit Hilfe eines Suchmusters auf bestimmte Dateien beschränkt werden. Überwacht werden kann das Erstellen, Ändern, Umbenennen und/oder Löschen von Dateien.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Event / Logic |
| Schnittstellen | In: Dateiverzeichnis |
| Transaktionen | 1 Transaktion pro Ereignis |
| Ereignisse | Pro erkannte Änderung und Datei ein Event: &lt;Instanz&gt; (Parameter = file, eventType) |
| | |
| __Parameter__ | |
| directory | Zu überwachendes Verzeichnis als absoluter Pfad |
| usePolling | Art der Überwachung<br />true = Ordner wird periodisch überprüft (siehe "pollingIntervall")<br />false = Ordner wird dauernd überwacht |
| pollingInterval | falls "usePolling" auf "true" gesetzt wurde, kann hier das Interval in Sekunden angegeben werden |
| initialPull | true = Erzeugt beim Start des OneConnexx pro im zu überwachenden Verzeichnis vorhandener Datei ein "create"-Ereignis |
| includeSubdirectories | true = Unterverzeichnisse werden ebenfalls überwacht |
| filter | Das Suchmuster zur Einschränkung der zu überwachenden Dateien<br />Die Platzhalter * und ? können wie von Windows gewohnt benutzt werden. |
| bufferSize | Interne Puffergrösse in Bytes (Default = 8192)<br/>Wenn eine sehr grosse Anzahl Dateien überwacht werden soll, kann es nötig sein, diesen Wert in Schritten von 4096 bis zum Maximalwert von 65536 zu erhöhen. |
| ensureFileWrittenTimeOut | Zeit in Millisekunden die vor dem Auslösen des Ereignisses maximal gewartet wird, bis die Datei fertig geschrieben wurde. Ein Wert von 0 bedeutet, dass immer gewartet wird bis die Datei für Leseoperationen geöffnet werden kann. |
| createEvent | true = Löst ein Ereignis aus beim Erstellen einer Datei |
| changeEvent | true = Löst ein Ereignis aus beim Ändern einer vorhandenen Datei |
| deleteEvent | true = Löst ein Ereignis aus beim Löschen einer Datei |
| renameEvent | true = Löst ein Ereignis aus beim Umbenennen einer Datei |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |

### Anwendungsbeispiele 

In einem sogenannten "Dropfolder" werden Dateien von einem Fremdsystem abgelegt. Sobald eine neue Datei in dieses Verzeichnis kopiert wurde, soll es von OneConnexx in eine SharePoint Dokumentenbibliothek verschoben werden.

Dazu wird eine Instanz des FileSystemWatcher Add-Ins erstellt, die den "Dropfolder" überwacht. Es wird nur das "created" Ereignis überwacht. Wird eine neue Datei erkannt, wird vom FileSystemWatcher Add-In ein Ereignis ausgelöst, und der Pfad und Dateiname der neuen Datei werden im Parameter "file" an nachfolgende Add-Ins mitgegeben.

Ein FileCopy Add-In abonniert das Ereignis des FileSystemWatcher Add-Ins. Da dieses Ereignis einen Parameter "file" enthält, wird dieser als Quelldatei interpretiert und die Datei wird auf das konfigurierte Zielsystem (in diesem Fall SharePoint) kopiert.

##### Wann "polling" gewählt werden sollte

Wenn "usePolling" auf "false" steht, werden betriebssysteminterne Mechanismen zur Überwachung des Verzeichnisses verwendet. Es hat sich allerdings gezeigt, dass dies mit Netzlaufwerken nicht immer zuverlässig funktioniert wenn die Netzwerkverbindung instabil ist. Grundsätzlich wird empfohlen "usePolling" auf "false" zu belassen, und nur auf "true" umzustellen wenn Netzlaufwerke überwacht werden sollen und dies nicht stabil funktioniert.

