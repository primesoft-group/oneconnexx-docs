---
layout: page
title: FileCopy
permalink: "addins/de/filecopy/"
---

Das FileCopy Add-In wird dazu verwendet um Dateien von einem Systems auf ein anderes System zu kopieren. Es werden die unterschiedlichsten Übertragungsprotokolle unterstützt.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Logic |
| Schnittstellen | In/Out: Dateiverzeichnis |
| Transaktionen | 1 pro kopierte Datei |
| Ereignisse | Pro kopierte Datei wenn Ziel = FILE: &lt;Instanz&gt;.Output (Parameter = file)<br />&lt;Instanz&gt;.Done<br />&lt;Instanz&gt;.Filter (Parameter = file, siehe Anwendungsbeispiele) |
| | |
| __Parameter__ | |
| sourceProtocol | Das zu verwendende Protokoll zum Lesen der Quelldateien. Zur Auswahl stehen: NULL, FILE, FTP, FTPS, SFTP, S3, WebDAV und SHAREPOINT |
| sourceSystem | Abhängig von "sourceProtocol"<br />FILE: leer lassen<br/>FTP, FTPS, SFTP und WebDAV: IP oder Hostname des Quellsystems <br />S3: RegionEndPoint wenn nicht *EUWest1* <br /> SHAREPOINT: URL zur Quell-Liste auf Sharepoint (ohne Ordner). Der Teil nach dem letzten '/' der URL muss dem Quell-Listennamen entsprechen (ggf. mit Sonderzeichen). |
| sourcePath | Abhängig von "sourceProtocol"<br />FILE: UNC Pfad zu den Quelldateien<br />WebDAV: URL der Quelldateien<br />FTP, FTPS, SFTP: Relativer Pfad<br /> S3: Bucketname <br /> SHAREPOINT: Relativer Pfad von der Quellliste zum Quellverzeichnis|
| sourceArchivePath | Verzeichnis (Format siehe "sourcePath"), wohin erfolgreich kopierte Dateien zusätzlich verschoben werden (Optional) |
| sourceTimeFilter | SHAREPOINT: Zeitfilter, um nur Dateien, welche älter als die gesetzte Zeit (in Minuten) sind, zu verarbeiten |
| destinationFileName | Name der kopierten Dateien auf dem Zielsystem, falls diese anders heissen sollen als die Originaldateien. Mögliche Platzhalter: <br /> {0}: Name der Ursprungsdatei ohne Endung <br /> {1}: Endung der Ursprungsdatei <br /> {2}: Aktuelle Zeit. Default Format = yyyyMMddHHmmss |
| destinationProtocol | Das zu verwendende Protokoll zum Schreiben der Zieldateien. Zur Auswahl stehen: NULL, FILE, FTP, FTPS, SFTP, S3, WebDAV und SHAREPOINT |
| destinationSystem | Abhängig von "destinationProtocol"<br />FILE: leer lassen<br/>FTP, FTPS, SFTP und WebDAV: IP oder Hostname des Zielsystems <br />S3: RegionEndPoint wenn nicht *EUWest1* <br /> SHAREPOINT: URL zur Ziel-Liste auf Sharepoint (ohne Ordner). Der Teil nach dem letzten '/' der URL muss dem Ziel-Listennamen entsprechen (ggf. mit Sonderzeichen). |
| destinationPath | Abhängig von "destinationProtocol"<br />FILE: UNC Pfad des Zielverzeichnis<br/>S3: Bucketname<br /> SHAREPOINT: Relativer Pfad von der Quellliste zum Quellverzeichnis |
| filePattern | Suchmuster der zu kopierenden Dateien<br />Die Platzhalter * und ? können wie von Windows gewohnt benutzt werden. Mehrere Suchmuster können durch Semikolon getrennt angegeben werden. Bsp.: "\*.txt;\*.xml" => alle Text und XML Dateien. |
| moveFiles | true = Dateien werden verschoben, also auf dem Quellsystem gelöscht<br />false = Dateien werden kopiert und verbleiben auf dem Quellsystem |
| skipExistingFiles | Wenn 'true' werden kopierte Dateien nicht aus dem temp Verzeichnis gelöscht und Dateien die im temp Verzeichnis bereits existieren werden übersprungen. |
| sourceUserName | Benutzer für den Zugriff auf das Quellsystem (Optional) |
| sourcePassword | Zugehöriges Passwort (Optional) |
| destUserName | Benutzer für den Zugriff auf das Zielsystem (Optional) |
| destPassword | Zugehöriges Passwort (Optional) |
| tempDirectory | Während eines Kopiervorganges werden Dateien lokal in diesem Verzeichnis abgelegt. (Optional, Default = Temp-Verzeichnis des Systems) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |


### Anwendungsbeispiele

Das FileCopy Add-In wird beim automatischen Austauchs mit FTP-Servern aber auch bei automatischen Abgleichen innerhalb des Firmenetzes eingesetzt.
Das FileCopy Add-In ist Dank den Möglichkeiten des Archivierens und des Verschiebens, sowie der Unterstützung vieler Protokolle sehr vielseitig einsetzbar.

##### Zeitstempel hinzufügen

Sollen alle kopierten Dateien auf dem Zielsystem mit einem Zeitstempel versehen werden, lässt sich das über den Parameter "destinationFileName" mit dem Wert "{0}\_{2:yyyyMMdd\_HHmmss}.{1}" umsetzen.

*Beispiel:* Eine Datei "test.txt" wird auf dem Zielsystem zu "test_20170524_094825.txt"

##### NULL Protokoll

Das NULL Übertragungsprotokoll kann als "destinationProtocol" verwendet werden, wenn nur die Existenz einer Datei auf dem Quellsystem überprüft werden soll. Dieses Protokoll kopiert keine Dateien, aber es wird trotzdem für jede gefundene Datei auf dem Quellsystem eine Transaktion geschrieben, welche dann durch eine Regel überwacht werden kann.

##### Quelldatei über "file" Parameter

Wird das FileCopy Add-In über ein Ereignis aktiviert das einen Parameter "file" enthält, wird die Datei in diesem Parameter als Quelldatei interpretiert und auf das Zielsystem kopiert. In diesem Fall werden die konfigurierten Parameter "sourcePath" und "filePattern" ignoriert.

Ereignisse mit "file" Parameter werden von folgenden Add-Ins ausgelöst:
* DatabaseToCSV
* FileDecompressor
* FileCompressor
* FileCopy
* FileReconstructor
* FileSystemWatcher
* Ldap2CSV
* Xml2Csv

##### Verwenden des "Filter" Ereignisses

Das "Filter" Ereignis wird ausgelöst, nach dem die FileCopy Instanz eine Datei vom Quellsystem ins temporäre Verzeichnis kopiert hat. Der Parameter "file" zeigt auf die zu kopierende Datei im temporären Verzeichnis. Hat ein anderes Add-In dieses Ereignis abonniert, wartet die FileCopy Instanz mit dem Kopieren auf das Zielsystem bis das andere Add-In das Ereinigs fertig bearbeitet hat. In Kombination mit dem "TextReplace" Add-In kann so eine Datei von A nach B kopiert, und gleichzeitig konvertiert werden.

##### Verwenden des "skipExistingFiles" Parameters

Der Parameter 'skipExistingFiles' kann auf 'true' gesetzt werden, wenn Dateien auf dem Quellsystem nicht gelöscht oder verschoben werden können, aber trotzdem nur neu hinzugekommene Dateien kopiert werden sollen. Dabei werden Dateien nach dem Kopieren nicht aus dem lokalen temporären Verzeichnis gelöscht, und Dateien die bereits im lokalen temporären Verzeichnis existieren werden übersprungen. Wird diese Option verwendet, sollte 'tempDirectory' auf ein Verzeichnis gesetzt werden das ausschliesslich diesem Zweck dient.
