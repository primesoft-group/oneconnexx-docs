---
layout: page
title: Addin Übersicht
permalink: "addins/de/overview/"
---

__AddIn Typen__

Der OneConnexx kennt folgende AddIn-Typen:


{:.table .table-striped}
| Type | Beschreibung |                      
| --- | --- |
| Connector | Schnittstelle zu einer Anwendung / System |
| Logic | AddIn enhält Geschäftlogik wie z.B. das Kopieren von Dateien |
| Event | AddIn führt ein Initiales Ereignis aus wie z.B. das Erkennen einer neuen Datei |
    
__Standard AddIns__

Folgende Standard AddIns sind aktuell im Lieferumfang des OneConnexx enthalten.<br /> 
Hinweis: Nicht enthalten in dieser Liste sind alle kundenspezifische AddIns.<br />
Hinweis: Sowohl die Liste wie auch der Funktionsumfang der einzelnen AddIns werden ständig erweitert.


{:.table .table-striped}
| AddIn | Beschreibung |                      
| --- | --- |
| Bizagi | Das Bizagi AddIn dient zur Anbindung des Bizagi BPMN an den OneConnexx. Das Bizagi AddIn tauscht Daten mit Bizagi aus, erzeugt neue Prozesse und löst Events in Bizagi aus. |
| DatabaseMaintenance | Erstellt alle Indexe einer Datenbank neu, um so die Performance zu verbessern
| DatabaseToCSV | Erzeugt aus einer SQL Abfrage eine oder mehrere CSV-Dateien |
| Dispatcher | Löst Events aufgrund einer SQL Abfrage aus |
| EventLogger | Schreibt alle mit dem Event übergebenen Parameter ins Logfile |
| FileCompressor | Komprimiert Dateien |
| FileCopy | Kopiert Dateien (auch FTP und SFTP) |
| FileDecompressor | Entpackt Dateien |
| FileEraser | Löscht bestimmte Dateien |
| FileReconstructor |  |
| FileSystemWatcher | Der FileSystemWatcher dient zur Überwachung von Dateiordern und Dateien. Die Überwachung kann mit Filepattern auf bestimmte Dateien eingeschränkt werden. Überwacht wird das Erstellen, Ändern, Umbenennen und/oder Löschen von Dateien. |
| Ldap2CSV | |
| LicenseCheck |LisenceCheck wird als WebService betrieben. Externe Applikationen übermitteln periodisch ihre aktuelle Lizenz. Das LicenseCheck AddIn schreibt die Lizenzdaten in Bizagi, steuert in Bizagi offene Prozesse und sendet letztendlich eine Antwort (ev. ein neues Lizenzfile) an die externe Applikation. |
| MailSender | Versendet ein E-Mail |
| MemoryConsumer | Systemtest, Stresstest |
| OneOffixxDocumentCreator | Erstellt über die OneOffixx Schnittstelle «OneOffixxDocumentCreationServer» (OODCS) Dokumente im CI/CD des Kunden. |
| ParameterTransformer | Transformiert Parametern zwischen zwei AddIn-Instanzen |
| ServerCheck | |
| SharepointEraser | Löscht Items in einer Sharepoint Liste/Bibliothek die älter als xx Stunden sind |
| Timer | Das Timer AddIn ist das meistverwendete AddIn. Das Timer AddIn löst Events zu fast jeder beliebigen Zeit und Datum aus. |
| WebConnect | Das WebConnect AddIn funktioniert als WebService, welcher von externen Applikation aufgerufen wird. Das WebConnect AddIn löst einen Event aus mit dem Instanznamen aus. Als Parameter wird eine OneMessage mitgegeben. |
| WebRemote | Sendet eine Nachricht mit Namen des Events und den dazugehörigen Inhalt an einen angegebenen WebService. |
| XSLTransform | Transformiert XML Dateien |
| Xml2Csv | |


## Bizagi {% include anchor.html name="Bizagi" %}

