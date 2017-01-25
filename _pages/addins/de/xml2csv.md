---
layout: page
title: Xml2Csv
permalink: "addins/de/xml2csv/"
---

Das Xml2Csv AddIn schreibt bestimmte XML Nodes in eine CSV Datei. Über die Parameter wird konfiguriert, welche Nodes er übernommen werden und wohin die neue Datei gespeichert wird.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| AddIn Type | Logic |
| Schnittstellen | Dateiverzeichnis |
| Transaktionen | 1 pro erstellte Datei |
| Ereignisse | Pro erstellte Datei: &lt;Instanz&gt;.Output (Parameter = file)<br />&lt;Instanz&gt;.Done |
| | |
| __Parameter__ | |
| sourceDirectory | Das Verzeichnis der Quelldateien (XML-Dateien) |
| sourceFilePattern | Das Dateipattern dient zur Einschränkung der Quelldateien. (Optional, Default = *.xml) |
| rowXPath | XPath zur Einschränkung der Zeilen |
| additionalColumnXPath | XPath um Spalten ausserhalb der mit rowXPath definierten Zeile miteinzubeziehen. Mehrere Spalten mit Semikolon trennen. (Optional) |
| stripNamespace | true = Namespace Präfixes der XML Datei werden in der neuen CSV Datei nicht als Kolonnennamen angezeigt. (Optional, Default = true) |
| delimiter | Trennzeichen der Spalten in der CSV Datei (Optional, Default = Semikolon) |
| destinationDirectory | Verzeichnis zum Speichern der CSV-Datei. (Optional, Default = sourceDirectory) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |

<!-- 
### Anwendungsbeispiele 

ToDo
-->
