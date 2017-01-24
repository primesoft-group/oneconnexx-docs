---
layout: page
title: XSLTransform
permalink: "addins/de/xsltransform/"
---

Das XMLTransform AddIn transformiert XML Dateien

## Merkmale

{:.table .table-striped}
| --- | --- |
| AddIn Type | Logic |
| Schnittstellen | Dateiverzeichnis |
| Transaktionen |  |
| Ereignisse |  |


## Parameter

{:.table .table-striped}
| --- | --- |
| directory | Angabe des Verzeichnisses in welches die transformierte XML Datei gespeichert wird |
| archive | Verzeichnis, in welchem die Originaldatei und die transformierte Datei archiviert werden sollen. (Optional, Default = "" = nichts archivieren) |
| enableDocumentFunction | true = Aktiviert die Documentfunction für den Zugriff auf Nodes im XML Dokument (Details unter https://msdn.microsoft.com/de-de/library/ms256465(v=vs.120).aspx) <br />(Optional, Default = false) |
| enableScript | true = Erlaubt das Verwenden von Scripts im XSL. (Optional, Default = true) |
| xsltStylesheet | Verzeichnis der XSLT Datei |
| outputExtension | Dateiendung der transformierten Datei (Optional, Default = ".xml") |


<!-- 
## Anwendungsbeispiele 

ToDo
-->
