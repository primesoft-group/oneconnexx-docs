---
layout: page
title: FileDecompressor
permalink: "addins/de/filedecompressor/"
---


Das FileDecompressor AddIn entpacket Zip-, GZip-, oder Tar-Dateien in ein bestimmtes Verzeichnis.

## Merkmale

{:.table .table-striped}
| --- | --- |
| AddIn Type |  |
| Schnittstellen |  |
| Transaktionen | 1 pro erstellte Datei |
| Ereignisse | <Instanz>.Done <br />Pro erstellte Datei: <Instanz>.Output |
| Ereignis-Parameter | Datei |


## Parameter

{:.table .table-striped}
| --- | --- |
| sourceDirectory | Pfad, in welchem sich die komprimierten Dateien befinden |
| sourceFilePattern | Das Dateipattern dient zur Einschränkung der komprimierten Dateien. <br /> * = alles; Bsp. "*.zip" => alle Dateien mit Endung .zip <br />? = unsicher wie die Datei heisst. Bsp. "1?.zip" => alle Zip-Dateien welche mindestens eine 1 beinhalten. <br />Auch können mehrere Patterns eingegeben, indem sie mit ";" getrennt werden. Bsp. "*.zip; *.tar" |
| destinationDirectory | Zielverzeichnis, wohin die Dateien entpackt werden |
| archivePassword | Zum automatischen Entpacken von passwortgeschützten Archiven |
| deleteSourceAfterProcessing | true = Die komprimierte Datei wird nach dem Entpacken gelöscht <br />false = Die komprimierte Datei wird nicht gelöscht (Default = false) | 
| decompressToSubFolder | true = Die Dateien werden in ein Unterverzeichnis mit demselben Namen wie das Archiv entpackt <br /> false = Die Dateien werden in das Zielverzeichnis entpackt (Default = false)|
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional) |

<!-- 
## Anwendungsbeispiele 

ToDo
-->

