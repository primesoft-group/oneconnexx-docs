---
layout: page
title: FileCompressor
permalink: "addins/de/filecompressor/"
language: de
---

Das FileCompressor Add-In komprimiert bestimmte Dateien aus einem bestimmten Verzeichnis und speichert diese dann in einem Archiv ab<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Logic |
| Schnittstellen | In/Out: Dateieverzeichnis |
| Transaktionen | 1 wenn erfolgreich |
| Ereignisse | &lt;Instanz&gt;.Done (Parameter = file) |
| | |
| __Parameter__ | |
| sourceDirectory | Verzeichnis der Quelldatei(en) |
| sourceFilePattern | Das Dateipattern dient zur Einschränkung der Quelldateien (\* = alles; Bsp. «\*.txt» => alle Dateien mit Endung .txt)<br />Mehrere Pattern werden mit Semikolon getrennt. Bsp. «\*.txt; \*.xml» => alle Text und XML Dateien. |
| archiveName | Dateiname (inkl. Verzeichnis) des Archivs. Die Eingabe {0} wird als Platzhalter für das aktuelle Datum benutzt. Bsp. {0:yyyyMMdd}.zip => 20161128.zip. |
| archiveType | Typ der Archivdatei: Zip, Tar oder GZip. (Default = "Zip") |
| compressionType | Kompressionstyp in Abhängigkeit vom Typ des Archivs (Default = "LZMA"):<br />- Zip => BZip2, PPMd, Deflate, LZMA<br />- Tar => GZip, BZip2<br />- GZip => GZip. |
| deleteSourceAfterProcessing | true = Die Quelldateien werden nach dem Komprimieren gelöscht. (Optional, Default = false) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |

### Anwendungsbeispiele

Platzsparendes Archvieren irgendwelcher Nutzerdaten
