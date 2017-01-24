---
layout: page
title: FileCopy
permalink: "addins/de/filecopy/"
---

Das FileCopy AddIn wird dazu verwendet um Dateien in einem bestimmten Verzeichnis eines Systems auf ein anderes System mit einem bestimmten Protokoll zu kopieren.
Das FileCopy AddIn unterstützt auch FTP und SFTP.

## Merkmale

{:.table .table-striped}
| --- | --- |
| AddIn Type | Logic |
| Schnittstellen | In/Out: Dateiverzeichnis |
| Transaktionen | 1 pro kopierte Datei |
| Ereignisse | Pro kopierte Datei wenn Ziel = FILE: &lt;Instanz&gt;.Output (Parameter = file)<br />&lt;Instanz&gt;.Done |


## Parameter

{:.table .table-striped}
| --- | --- |
| sourceProtocol | Das zu verwendende Protokoll beim Laden der Quelldateien. Zur Auswahl stehen FILE, FTP, FTPS, SFTP, S3 und WebDAV |
| sourceSystem | URL-Adresse des Quellservers <br />bei FILE leer lassen<br/>bei FTP, FTPS, SFTP und WebDAV: IP oder Hostname des Quellservers <br />bei S3: RegionEndPoint wenn nicht EUWest1 |
| sourcePath | Pfad zu den Quelldateien. Bei S3 wird der Bucket Name definiert. |
| sourceArchivePath | Verzeichnis, wohin erfolgreich kopierte Dateien zusätzlich verschoben werden. (Optional) |
| destinationFileName | Name der neu erstellten Datei. Mögliche Platzhalter: <br /> {0}: Name der Ursprungsdatei ohne Endung <br /> {1}: Endung der Ursprungsdatei <br /> {2}: Aktuelle Zeit. Default Format = yyyyMMddHHss |
| destinationProtocol | Das zu verwendende Protokoll beim Speichern der Zieldateien. Zur Auswahl stehen FILE, FTP, FTPS, SFTP, S3 und WebDAV |
| destinationSystem | URL-Adresse des Zielservers<br />bei FILE leer lassen<br/>bei FTP, FTPS, SFTP und WebDAV: IP oder Hostname des Quellservers <br /> bei S3: RegionEndPoint wenn nicht EUWest1 |
| destinationPath | Zielverzeichnis, in welches die Dateien geschrieben werden. Bei S3 => Bucketname, bei Sharepoint => Dokument Library URL |
| filePattern | Das Dateipattern dient zur Einschränkung der zu kopierenden Dateien. <br /> * = alles; Bsp. "*.txt" => alle Dateien mit Endung .txt <br />? = unsicher wie die Datei heisst. Bsp. "1?.txt" => alle Text Dateien welche mindestens eine 1 beinhalten. <br />Mehrere Patterns werden mit Semikolon getrennt. Bsp. "*.txt; *.xml" => alle Text und XML Dateien. |
| moveFiles | true = Dateien werden verschoben, also im Quellverzeichnis  gelöscht<br />false = Dateien werden kopiert, also im Quellverzeichnis belassen |
| sourceUserName | Benutzer mit den für das Quellverzeichnis erforderlichen Berechtigungen (Optional) |
| sourcePassword | Zugehöriges Passwort (Optional) |
| destUserName | Benutzer mit den für das Zielverzeichnis erforderlichen Berechtigungen (Optional) |
| destPassword | Zugehöriges Passwort (Optional) |
| tempDirectory | Während eines Kopiervorganges werden Dateien lokal im Verzeichnis tempDirectory gespeichert. (Optional, Default = Temp-Verzeichnis des Systems) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |


## Anwendungsbeispiele

Das FileCopy AddIn wird beim automatischen Austauchs mit FTP-Servern aber auch bei automatischen Abgleichen innerhalb des Firmenetzes eingesetzt.
Das FileCopy AddIn ist Dank den Möglichkeiten des Archivierens und des Verschiebens, sowie der Einschränkung mit DateiPattern vielseitig einsetzbar.

