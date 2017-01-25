---
layout: page
title: SharepointEraser
permalink: "addins/de/sharepointeraser/"
---

Das SharepointEraser AddIn löscht Items in einer Sharepoint Liste/Bibliothek die älter als xx Stunden sind.

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | |
| AddIn Type | Logic |
| Schnittstellen | Sharepoint |
| Transaktionen | 1 wenn mind. 1 Datei gelöscht |
| Ereignisse | &lt;Instanz&gt;.Done |
| | |
| __Parameter__ | |
| userName | Benutzer mit den für den SharePoint-Server erforderlichen Berechtigungen (Optional) |
| password | Zugehöriges Passwort (Optional) |
| siteUrl | URL des SharePoint-Servers |
| libraryName | Name der Library, in welcher Items gelöscht werden sollen. |
| deleteTimeout | Alter der Items in Stunden, ab wann sie gelöscht werden sollen. |
| testRun | true = Testlauf um zu überprüfen ob alles reibungslos durchläuft.<br />Die Items werden dabei nicht gelöscht, Logeinträge werden aber geschrieben. (Optional, Default = false) |
| requestTimeout | Automatische Verbindungstrennung, wenn der Request länger als die angegebene Zeit in Millisekunden dauert. (Optional, Default = 60000) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |

<!-- 
## Anwendungsbeispiele 

ToDo
-->

