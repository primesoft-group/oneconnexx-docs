---
layout: page
title: OneOffixxDocumentCreator
permalink: "addins/de/oneoffixxdocumentcreator/"
---


Das AddIn OneOffixxDocumentCreator erstellt über die OneOffixx Schnittstelle "OneOffixxDocumentCreationServer" (OODCS) Dokumente im CI/CD des Kunden.

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | |
| AddIn Type | Konnektor / Logic |
| Schnittstellen | In/Out: OneOffixx |
| Transaktionen |  |
| Ereignisse |  |
| | |
| __Parameter__ | |
| configFilename | Datei mit Mapping-Konfiguration (Bsp. $(config)\oodcs.xml) |
| oodcsUrl | URL des OODCS WebServices |
| oodcsUsername | Benutzername des OODCS WebServices |
| oodcsPassword | Passwort des OODCS WebServices |
| enableTrace | true = Nachrichten werden in Analyse-Dateien gespeichert (Optional, Default = false) |
| traceFolder | Verzeichnis der Analyse-Dateien (Optional, Default = "Trace") |
| messageTransformFolder | Ordner, welche die MessageTransform Dateien (*.mt) beinhaltet |
| retryCount | Falls eine Anfrage fehlschlägt, wird diese wiederholt. Der Parameter retryCount definiert, wie oft eine Anfrage wiederholt werden soll. (Optional, Default = 1) |
| maxRequests | Anzahl paralleler Anfragen (Optional, Default = 8) |

## Anwendungsbeispiele

Beim [Anwendungesbeipiel "Dokumentendienst"]({{ site.baseurl }}/usecases/de/documentcreation/) werden die Dokumente über das OneOffixxDocumentCreator AddIn erstellt.
