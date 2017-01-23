---
layout: page
title: WebConnect
permalink: "addins/de/webconnect/"
---
 

Das WebConnect AddIn funktioniert als WebService, welcher von externen Applikation aufgerufen wird. 
Das WebConnect AddIn löst einen Event aus mit dem Instanznamen aus. Als Parameter wird eine OneMessage mitgegeben.

## Merkmale

{:.table .table-striped}
| --- | --- |
| AddIn Type | Event |
| Schnittstellen | In: Externe Applikationen |
| Transaktionen |  |
| Ereignisse | <Instanz>.<service> |
| Ereignis-Parameter | OneMessage |


## Parameter

{:.table .table-striped}
| Parameter | Beschreibung |                      
| --- | --- |
| baseAddress | URL des WebServices |
| enableTrace | true = Datenaustausch wird zur Analyse gespeichert<br />false = "" (Default = false) |
| traceFolder | Ablageordner der Analyse-Dateien |


<!-- 
## Anwendungsbeispiele 

ToDo
-->

