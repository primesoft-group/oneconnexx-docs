---
layout: page
title: FileCompressor
permalink: "addins/de/filecompressor/"
---

Das FileCompressor AddIn komprimiert bestimmte Dateien aus einem bestimmten Verzeichnis und speichert diese dann in einem Archiv ab

## Merkmale

{:.table .table-striped}
| --- | --- |
| AddIn Type |  |
| Schnittstellen |  |
| Transaktionen | 1 wenn erfolgreich |
| Ereignisse | <Instanz>.Done |
| Ereignis-Parameter | Datei |


## Parameter

{:.table .table-striped}
| --- | --- |
| sourceDirectory | Verzeichnis der Quelldatei(en) |
| sourceFilePattern | Das Format nach welchem die Files gefiltert werden sollen. Mehrere Pattern werden mit Semikolons getrennt. Platzhalter "*" ist erlaubt. (Default = *.*) |
| archiveName | Ganzer Pfad mit Dateiname des Archives. Die Eingabe {0} wird als Platzhalter für das aktuelle Datum benutzt. Bsp. {0:yyyyMMdd}.zip => 20161128.zip. |
| archiveType | Angabe des Archivierungstypes. Zur Auswahl stehen Zip, Tar, GZip. (Default = Zip) |
| compressionType | Der Kompressionstyp. Ist abhängig vom Archivtyp: Zip => BZip2, PPMd, Deflate, LZMA, Tar => GZip, BZip2, GZip => GZip. (Default = LZMA) |
| deleteSourceAfterProcessing | true = Die Quelldateien werden nach dem Komprimieren gelöscht. (Optional, Default = false) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional) |

## Anwendungsbeispiele

Platzsparendes Archvieren irgendwelcher Nutzerdaten
