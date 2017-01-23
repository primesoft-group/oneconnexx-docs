---
layout: page
title: OneOffixxDocumentCreator
permalink: "addins/de/oneoffixxdocumentcreator/"
---


Das AddIn OneOffixxDocumentCreator erstellt über die OneOffixx Schnittstelle "OneOffixxDocumentCreationServer" (OODCS) Dokumente im CI/CD des Kunden.

## Merkmale

{:.table .table-striped}
| --- | --- |
| AddIn Type | Konnektor / Logic |
| Schnittstellen | In/Out: OneOffixx |
| Transaktionen |  |
| Ereignisse |  |
| Ereignis-Parameter |  |


## Parameter

{:.table .table-striped}                    
| --- | --- |
| configFilename | Datei mit Mapping-Konfiguration (Bsp. $(config)\oodcs.xml) |
| oodcsUrl | URL des OODCS WebServices |
| oodcsUsername | Benutzername des OODCS WebServices |
| oodcsPassword | Passwort des OODCS WebServices |
| enableTrace | true = Datenaustausch wird zur Analyse gespeichert<br />false = "" (Default = false) |
| traceFolder | Ablageordner der Analyse-Dateien |
| messageTransformFolder | Ordner, welche die MessageTransform Dateien (*.mt) beinhaltet |
| retryCount | Falls eine Anfrage fehlschlägt, wird diese wiederholt. Der Parameter retryCount definiert, wie oft eine Anfrage wiederholt werden soll. (Optional, Default = 1) |
| maxRequests | Anzahl paralleler Anfragen (Optional, Default = 8) |

## Anwendungsbeispiele

Beim [Anwendungesbeipiel "Dokumentendienst"]({{ site.baseurl }}/usecases/de/documentcreation/) werden die Dokumente über das OneOffixxDocumentCreator AddIn erstellt.
