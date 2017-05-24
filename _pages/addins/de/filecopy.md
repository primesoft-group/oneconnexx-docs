---
layout: page
title: FileCopy
permalink: "addins/de/filecopy/"
---

Das FileCopy Add-In wird dazu verwendet um Dateien von einem Systems auf ein anderes System zu kopieren. Es werden die unterschiedlichsten Übertragungsprotokolle unterstützt..<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Logic |
| Schnittstellen | In/Out: Dateiverzeichnis |
| Transaktionen | 1 pro kopierte Datei |
| Ereignisse | Pro kopierte Datei wenn Ziel = FILE: &lt;Instanz&gt;.Output (Parameter = file)<br />&lt;Instanz&gt;.Done |
| | |
| __Parameter__ | |
| sourceProtocol | Das zu verwendende Protokoll zum Lesen der Quelldateien. Zur Auswahl stehen: NULL, FILE, FTP, FTPS, SFTP, S3 und WebDAV |
| sourceSystem | Abhängig von "sourceProtocol"<br />FILE: leer lassen<br/>FTP, FTPS, SFTP und WebDAV: IP oder Hostname des Quellsystems <br />S3: RegionEndPoint wenn nicht *EUWest1* |
| sourcePath | Abhängig von "sourceProtocol"<br />FILE: UNC Pfad zu den Quelldateien<br />WebDAV: URL der Quelldateien<br />FTP, FTPS, SFTP: Relativer Pfad<br /> S3: Bucketname |
| sourceArchivePath | Verzeichnis (Format siehe "sourcePath"), wohin erfolgreich kopierte Dateien zusätzlich verschoben werden (Optional) |
| destinationFileName | Name der kopierten Dateien auf dem Zielsystem, falls diese anders heissen sollen als die Originaldateien. Mögliche Platzhalter: <br /> {0}: Name der Ursprungsdatei ohne Endung <br /> {1}: Endung der Ursprungsdatei <br /> {2}: Aktuelle Zeit. Default Format = yyyyMMddHHss |
| destinationProtocol | Das zu verwendende Protokoll zum Schreiben der Zieldateien. Zur Auswahl stehen: NULL, FILE, FTP, FTPS, SFTP, S3, WebDAV und SHAREPOINT |
| destinationSystem | Abhängig von "destinationProtocol"<br />FILE, SHAREPOINT: leer lassen<br/>FTP, FTPS, SFTP und WebDAV: IP oder Hostname des Zielsystems <br />S3: RegionEndPoint wenn nicht *EUWest1* |
| destinationPath | Abhängig von "destinationProtocol"<br />FILE: UNC Pfad des Zielverzeichnis<br/>S3: Bucketname<br/>SHAREPOINT: URL der Dokumentenbibliothek |
| filePattern | Suchmuster der zu kopierenden Dateien<br />Die Platzhalter * und ? können wie von Windows gewohnt benutzt werden. Mehrere Suchmuster können durch Semikolon getrennt angegeben werden. Bsp.: "\*.txt;\*.xml" => alle Text und XML Dateien. |
| moveFiles | true = Dateien werden verschoben, also auf dem Quellsystem gelöscht<br />false = Dateien werden kopiert und verbleiben auf dem Quellsystem |
| sourceUserName | Benutzer für den Zugriff auf das Quellsystem (Optional) |
| sourcePassword | Zugehöriges Passwort (Optional) |
| destUserName | Benutzer für den Zugriff auf das Zielsystem (Optional) |
| destPassword | Zugehöriges Passwort (Optional) |
| tempDirectory | Während eines Kopiervorganges werden Dateien lokal in diesem Verzeichnis abgelegt. (Optional, Default = Temp-Verzeichnis des Systems) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |


### Anwendungsbeispiele

Das FileCopy Add-In wird beim automatischen Austauchs mit FTP-Servern aber auch bei automatischen Abgleichen innerhalb des Firmenetzes eingesetzt.
Das FileCopy Add-In ist Dank den Möglichkeiten des Archivierens und des Verschiebens, sowie der Einschränkung mit DateiPattern vielseitig einsetzbar.

