---
layout: page
title: Xml2Csv
permalink: "addins/en/xml2csv/"
language: en
---

Das Xml2Csv Add-In schreibt bestimmte XML Nodes in eine CSV-Datei. Über die Parameter wird konfiguriert, welche Nodes übernommen werden und wohin die neue Datei gespeichert wird.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Logic |
| Schnittstellen | Dateiverzeichnis |
| Transaktionen | 1 pro erstellte Datei |
| Ereignisse | Pro erstellte Datei: &lt;Instanz&gt;.Output (Parameter = file)<br />1x am Schluss: &lt;Instanz&gt;.Done |
| | |
| __Parameter__ | |
| sourceDirectory | Das Verzeichnis der Quelldateien (XML-Dateien) |
| sourceFilePattern | Das Suchmuster zur Einschränkung der Quelldateien (Optional, Default = \*.xml) |
| rowXPath | XPath zur Auswahl der Zeilen in der CSV-Datei |
| additionalColumnXPath | XPath um Spalten ausserhalb der mit rowXPath definierten Zeile miteinzubeziehen. Mehrere Spalten können durch Semikolon getrennt angegeben werden. (Optional) |
| stripNamespace | true = Namespace Präfixe aus der XML-Datei werden in der erstellten CSV-Datei aus den Spaltennamen entfernt (Optional, Default = true) |
| delimiter | Trennzeichen der Spalten in der CSV-Datei (Optional, Default = Semikolon) |
| destinationDirectory | Verzeichnis in dem die CSV-Datei erstellt wird (Optional, Default = sourceDirectory) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |

### Anwendungsbeispiele 

##### Quelldatei über "file" Parameter

Wird das Xml2Csv Add-In über ein Ereignis aktiviert das einen Parameter "file" enthält, wird die Datei in diesem Parameter als XML-Datei interpretiert und in eine CSV-Datei umgewandelt. In diesem Fall werden die konfigurierten Parameter "sourceDirectory" und "sourceFilePattern" ignoriert.

Ereignisse mit  "file" Parameter werden von folgenden Add-Ins ausgelöst:
* DatabaseToCSV
* FileDecompressor
* FileCompressor
* FileCopy
* FileReconstructor
* FileSystemWatcher
* Ldap2CSV
* Xml2Csv
