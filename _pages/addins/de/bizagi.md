---
layout: page
title: Addin - Bizagi
permalink: "addins/de/bizagi/"
---

Das Bizagi AddIn dient zur Anbindung des Bizagi BPMN an den OneConnexx. Das Bizagi AddIn tauscht Daten mit Bizagi aus, erzeugt neue Prozesse und löst Events in Bizagi aus.

{:.table}
| --- | --- |
| AddIn Type | Connector |
| Interfaces | In/Out: 2 x Bizagi WebServices (EntityManager und WorkflowEngine) |
| Transaktion |  |
| Events |  |
| Eventparams |  |


__Parameter__

{:.table}
| Parameter | Beschreibung |                      
| --- | --- |
| configFilename | Anwendungsspezifische Bizagi Konfigurationsdatei |
| workflowUrl | Bizagi WorkflowEngineSOA WebService |
| entityUrl | Bizagi EntityManagerSOA WebService |
| enableTrace| true	: Datenaustausch wird zur Analyse gespeichert<br/> false : «»
| traceFolder | Ablageordner der Analyse-Dateien |
| messageTransformFolder | Ordner, welche die MessageTransform Dateien (*.mt) beinhaltet |


