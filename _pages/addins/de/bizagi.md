---
layout: page
title: Standard AddIns
permalink: "addins/de/bizagi/"
---

## Bizagi

Das Bizagi AddIn dient zur Anbindung des Bizagi BPMN an den OneConnexx. Das Bizagi AddIn tauscht Daten mit Bizagi aus, erzeugt neue Prozesse und löst Events in Bizagi aus.

__Merkmale__

{:.table .table-striped}
| --- | --- |
| AddIn Type | Konnektor |
| Schnittstellen | In/Out: Bizagi WebServices EntityManager und WorkflowEngine |
| Transaktionen |  |
| Ereignisse |  |
| Ereignis-Parameter |  |

__Parameter__

{:.table .table-striped}
| Parameter | Beschreibung |                      
| --- | --- |
| configFilename | Anwendungsspezifische Bizagi Konfigurationsdatei |
| workflowUrl | URL des Bizagi WorkflowEngineSOA WebServices |
| entityUrl | URL des Bizagi EntityManagerSOA WebServices |
| enableTrace| true	: Datenaustausch wird zur Analyse gespeichert<br/> false : «»
| traceFolder | Ablageordner der Analyse-Dateien |
| messageTransformFolder | Ordner, welcher die MessageTransform Dateien (*.mt) beinhaltet |


<!-- __Anwendungsbeispiele__ -->
