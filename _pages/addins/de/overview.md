---
layout: page
title: Addin Übersicht
permalink: "addins/de/overview/"
---

__AddIn Typen__

Der OneConnexx kennt folgende AddIn-Typen:

1. Connector
   * Schnittstelle zu einer Anwendung / System
2. Logic
   * AddIn enhält Geschäftlogik wie z.B. das Kopieren von Dateien
3. Event
   * AddIn führt ein Initiales Ereignis aus wie z.B. das Erkennen einer neuen Datei


| Type | Beschreibung |                      
| --- | --- |
| Connector | Schnittstelle zu einer Anwendung / System |
| Logic | AddIn enhält Geschäftlogik wie z.B. das Kopieren von Dateien |
| Event | AddIn führt ein Initiales Ereignis aus wie z.B. das Erkennen einer neuen Datei |
    
__Standard AddIns__

Folgende Standard AddIns sind aktuell im Lieferumfang des OneConnexx enthalten.<br /> 
Hinweis: Nicht enthalten in dieser Liste sind alle kundenspezifische AddIns.<br />
Hinweis: Sowohl die Liste wie auch der Funktionsumfang der einzelnen AddIns werden ständig erweitert.


1. Bizagi<br/>
   Das Bizagi AddIn dient zur Anbindung des Bizagi BPMN an den OneConnexx. Das Bizagi AddIn tauscht Daten mit Bizagi aus, erzeugt neue Prozesse und löst Events in Bizagi aus.
2. DatabaseMaintenance<br/>
   Erstellt alle Indexe einer Datenbank neu, um so die Performance zu verbessern
3. DatabaseToCSV<br/>
   Erzeugt aus einer SQL Abfrage eine oder mehrere CSV-Dateien
4. Dispatcher<br/>
   Löst Events aufgrund einer SQL Abfrage aus
5. EventLogger<br/>
   Schreibt alle mit dem Event übergebenen Parameter ins Logfile
6. FileCompressor<br/>
   Komprimiert Dateien
7. FileCopy<br/>
   Kopiert Dateien (auch FTP und SFTP)
8. FileDecompressor<br/>
   Entpackt Dateien 
9. FileEraser<br/>
   Löscht bestimmte Dateien
10. FileReconstructor<br/>
   toBe described
11. FileSystemWatcher<br/>
   Der FileSystemWatcher dient zur Überwachung von Dateiordern und Dateien. Die Überwachung kann mit Filepattern auf bestimmte Dateien eingeschränkt werden. Überwacht wird das Erstellen, Ändern, Umbenennen und/oder Löschen von Dateien.
12. Ldap2CSV<br/>
   toBe described
13. LicenseCheck<br/>
   LisenceCheck wird als WebService betrieben. Externe Applikationen übermitteln periodisch ihre aktuelle Lizenz. Das LicenseCheck AddIn schreibt die Lizenzdaten in Bizagi, steuert in Bizagi offene Prozesse und sendet letztendlich eine Antwort (ev. ein neues Lizenzfile) an die externe Applikation.
14. MailSender<br/>
   Versendet ein E-Mail
15. MemoryConsumer<br/>
   Systemtest, Stresstest
16. OneOffixxDocumentCreator<br/>
   Erstellt über die OneOffixx Schnittstelle «OneOffixxDocumentCreationServer» (OODCS) Dokumente im CI/CD des Kunden. 
17. ParameterTransformer<br/>
   Transformiert Parametern zwischen zwei AddIn-Instanzen
18. ServerCheck<br/>
   toBe described
19. SharepointEraser<br/>
   Löscht Items in einer Sharepoint Liste/Bibliothek die älter als xx Stunden sind
20. Timer<br/>
   Das Timer AddIn ist das meistverwendete AddIn. Das Timer AddIn löst Events zu fast jeder beliebigen Zeit und Datum aus. 
21. WebConnect<br/>
   Das WebConnect AddIn funktioniert als WebService, welcher von externen Applikation aufgerufen wird. Das WebConnect AddIn löst einen Event aus mit dem Instanznamen aus. Als Parameter wird eine OneMessage mitgegeben.
22. WebRemote<br/>
   Sendet eine Nachricht mit Namen des Events und den dazugehörigen Inhalt an einen angegebenen WebService.
23. XSLTransform<br/>
   Transformiert XML Dateien
24. Xml2Csv<br/>
   toBe described


## Bizagi {% include anchor.html name="Bizagi" %}

