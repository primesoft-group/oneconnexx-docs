---
layout: page
title: Bizagi
permalink: "addins/de/bizagi/"
---

Das Bizagi AddIn dient zur Anbindung des Bizagi BPMN an den OneConnexx.<br />Das Bizagi AddIn tauscht Daten mit Bizagi aus, erzeugt neue Prozesse und löst Events in Bizagi aus.


--------------------------------------------------------------------
Column 1                                                Column 2
------------------------------------------------------  ------------
I want the contents of this cell to fit into one line   Word1 Word2

------------------------------------------------------  ------------

: **Column 2 is narrow.** For column 1: 54 dashes in Markdown source 
for separator line; for column 2: 12 dashes in separator line (22% of column 1).


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Column 1                                                Column 2
------------------------------------------------------  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
I want the contents of this cell to fit into one line   Word1 Word2

------------------------------------------------------  ------------------------------------------------------------------------------------------------------------------------------------------------------------------

: **Column 1 is narrow.** For column 1: 54 dashes in Markdown source for
separator line; for column 2: 162 dashes in separator line (300% of column 1).


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Column 1                                                                                                                                                                                                            Column 2
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  ---------------
I want the contents of this cell to fit into one line                                                                                                                                                               Word1 Word2

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  ---------------

: **Column 2 is even narrower than in Table 1.** For column 1: 210 dashes 
in Markdown source for separator line; for column 2: 15 dashes in separator 
line (7% of column 1).



## Merkmale

{:.table .table-striped}
| --- | --- |
| AddIn Type | Konnektor |
| Schnittstellen | In/Out: Bizagi WebServices EntityManager und WorkflowEngine |
| Transaktionen |  |
| Ereignisse |  |

## Parameter

{:.table .table-striped}
| --- | --- |
| configFilename | Anwendungsspezifische Bizagi Konfigurationsdatei |
| workflowUrl | URL des Bizagi WorkflowEngineSOA WebServices |
| entityUrl | URL des Bizagi EntityManagerSOA WebServices |
| enableTrace | true = Nachrichten werden in Analyse-Dateien gespeichert (Optional, Default = false) |
| traceFolder | Verzeichnis der Analyse-Dateien (Optional, Default = "Trace") |
| msgt | Verzeichnis mit den MessageTransform Dateien (*.mt) (Optional, Default = "Config\\MessageTransform") |


<!-- 
## Anwendungsbeispiele 

ToDo
-->
