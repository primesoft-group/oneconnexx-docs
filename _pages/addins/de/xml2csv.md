---
layout: page
title: Xml2Csv
permalink: "addins/de/xml2csv/"
---

Das Xml2Csv AddIn schreibt bestimmte XML Nodes in eine CSV Datei. Über die Parameter wird konfiguriert, welche Nodes er übernommen werden und wohin die neue Datei gespeichert wird.

## Merkmale

{:.table .table-striped}
| --- | --- |
| AddIn Type |  |
| Schnittstellen |  |
| Transaktionen | 1 pro erstellte Datei |
| Ereignisse | <Instanz>.Done<br />Pro erstellte Datei: <Instanz>.Output |
| Ereignis-Parameter | Datei |


## Parameter

{:.table .table-striped}
| --- | --- |
| sourceDirectory | Das Verzeichnis der Quelldateien (XML-Dateien) |
| sourceFilePattern | Das Dateipattern dient zur Einschränkung der Quelldateien. (Optional, Default = *.xml) |
| rowXPath | XPath zur Einschränkung der Zeilen |
| additionalColumnXPath | XPath um Spalten ausserhalb der mit rowXPath definierten Zeile miteinzubeziehen. Mehrere Spalten mit Semikolon trennen. (Optional) |
| stripNamespace | true = Namespace Präfixes des XML File werden im neuen CSV File nicht als Kolonnennamen angezeigt. (Optional, Default = true) |
| delimiter | Trennzeichen der Spalten in der CSV Datei (Optional, Default = ";") |
| destinationDirectory | Verzeichnis zum Speichern der CSV-Datei. (Optional, Default = sourceDirectory) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional) |

<!-- 
## Anwendungsbeispiele 

ToDo
-->
