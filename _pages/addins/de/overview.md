---
layout: page
title: Addins - Übersicht
permalink: "addins/de/overview/"
---

__AddIn Typen__

Der OneConnexx kennt folgende AddIn-Typen:<br />
<br />


{:.table .table-striped}
| Type | Beschreibung |                      
| --- | --- |
| Connector | Schnittstelle zu einer Anwendung / System |
| Logic | AddIn enhält Geschäftlogik wie z.B. das Kopieren von Dateien |
| Event | AddIn führt ein Initiales Ereignis aus wie z.B. das Erkennen einer neuen Datei |
    
__Standard AddIns__

Folgende Standard AddIns sind aktuell im Lieferumfang des OneConnexx enthalten.<br /> 
Hinweis: Nicht enthalten in dieser Liste sind alle kundenspezifische AddIns.<br />
Hinweis: Sowohl die Liste wie auch der Funktionsumfang der einzelnen AddIns werden ständig erweitert.<br />
<br />


{:.table .table-striped}
| AddIn | Beschreibung |                      
| --- | --- |
| [Bizagi]({{ site.baseurl }}/addins/de/bizagi/) | Das Bizagi AddIn dient zur Anbindung des Bizagi BPMN an den OneConnexx. Das Bizagi AddIn tauscht Daten mit Bizagi aus, erzeugt neue Prozesse und löst Events in Bizagi aus. |
| [DatabaseMaintenance]({{ site.baseurl }}/addins/de/databasemaintenance/) | Erstellt alle Indexe einer Datenbank neu, um so die Performance zu verbessern
| [DatabaseToCSV]({{ site.baseurl }}/addins/de/databasetocsv/) | Erzeugt aus einer SQL Abfrage eine oder mehrere CSV-Dateien |
| [Dispatcher]({{ site.baseurl }}/addins/de/dispatcher/) | Löst Events aufgrund einer SQL Abfrage aus |
| [EventLogger]({{ site.baseurl }}/addins/de/eventlogger/) | Schreibt alle mit dem Event übergebenen Parameter ins Logfile |
| [FileCompressor]({{ site.baseurl }}/addins/de/FileCompressor/) | Komprimiert Dateien |
| [FileCopy]({{ site.baseurl }}/addins/de/bizagi/) | Kopiert Dateien (auch FTP und SFTP) |
| [FileDecompressor]({{ site.baseurl }}/addins/de/FileDecompressor/) | Entpackt Dateien |
| [FileEraser]({{ site.baseurl }}/addins/de/bizagi/) | Löscht bestimmte Dateien |
| [FileReconstructor]({{ site.baseurl }}/addins/de/filereconstructor/) |  |
| [FileSystemWatcher]({{ site.baseurl }}/addins/de/filesystemwatcher/) | Der FileSystemWatcher dient zur Überwachung von Dateiordern und Dateien. Die Überwachung kann mit Filepattern auf bestimmte Dateien eingeschränkt werden. Überwacht wird das Erstellen, Ändern, Umbenennen und/oder Löschen von Dateien. |
| [Ldap2CSV]({{ site.baseurl }}/addins/de/ldap2csv/) | |
| [LicenseCheck]({{ site.baseurl }}/addins/de/licensecheck/) |LisenceCheck wird als WebService betrieben. Externe Applikationen übermitteln periodisch ihre aktuelle Lizenz. Das LicenseCheck AddIn schreibt die Lizenzdaten in Bizagi, steuert in Bizagi offene Prozesse und sendet letztendlich eine Antwort (ev. ein neues Lizenzfile) an die externe Applikation. |
| [MailSender]({{ site.baseurl }}/addins/de/mailsender/) | Versendet ein E-Mail |
| [MemoryConsumer]({{ site.baseurl }}/addins/de/memoryconsumer/) | Systemtest, Stresstest |
| [OneOffixxDocumentCreator]({{ site.baseurl }}/addins/de/oneoffixxdocumentcreator/) | Erstellt über die OneOffixx Schnittstelle «OneOffixxDocumentCreationServer» (OODCS) Dokumente im CI/CD des Kunden. |
| [ParameterTransformer]({{ site.baseurl }}/addins/de/parametertransformer/) | Transformiert Parametern zwischen zwei AddIn-Instanzen |
| [ServerCheck]({{ site.baseurl }}/addins/de/servercheck/) | |
| [SharepointEraser]({{ site.baseurl }}/addins/de/sharepointeraser/) | Löscht Items in einer Sharepoint Liste/Bibliothek die älter als xx Stunden sind |
| [Timer]({{ site.baseurl }}/addins/de/timer/) | Das Timer AddIn ist das meistverwendete AddIn. Das Timer AddIn löst Events zu fast jeder beliebigen Zeit und Datum aus. |
| [WebConnect]({{ site.baseurl }}/addins/de/webconnect/) | Das WebConnect AddIn funktioniert als WebService, welcher von externen Applikation aufgerufen wird. Das WebConnect AddIn löst einen Event aus mit dem Instanznamen aus. Als Parameter wird eine OneMessage mitgegeben. |
| [WebRemote]({{ site.baseurl }}/addins/de/webremote/) | Sendet eine Nachricht mit Namen des Events und den dazugehörigen Inhalt an einen angegebenen WebService. |
| [Xml2Csv]({{ site.baseurl }}/addins/de/xml2csv/) | |
| [XSLTransform]({{ site.baseurl }}/addins/de/xsltransform/) | Transformiert XML Dateien |



