---
layout: page
title: Versionshinweise
permalink: "setup/de/releasenotes/"
---

#### vNext

* __Neu__ FileCopy Add-In: Parameter sourceTimeFilter auch für FILE und SFTP Protokoll.


#### 1.4.5

* __Neu__ Neues Add-In List2Csv um SharePoint Online Listen in CSV Dateien zu exportieren.
* __Neu__ Neues Add-In SharepointToDB um Items aus SharePoint Online Dokumentbibliotheken oder Listen in eine Datenbank zu exportieren.
* __Neu__ FileCopy Add-In: Dateien können aus SharePoint Online Dokumentenbibliotheken heruntergeladen werden.
* __Neu__ SharepointEraser Add-In: Neue Parameters "subFolder" und "recursive".
* __Neu__ Anzeige des Alarmverlaufs (Liste der zuletzt versendeten Alarmierungen).
* __BREAKING CHANGE__ FileCopy Add-In: Bei "destinationProtocol" = SHAREPOINT muss die URL zur Dokumentenbibliothek neu im Parameter "destinationSystem" angegeben werden.


#### 1.4.3

* __Neu__ Ldap2CSV Add-In: Neuer Datentyp "bitmask"
* __Neu__ Csv2Database Add-In: Neuer Parameter "fileNameColumn"
* __Neu__ Anzeige der Auslastung
* __Fehler__ Csv2Database Add-In: Überlange Texte werden auf die Länge des Datenbankfeldes gekürzt
* __Fehler__ WebConnect: Formatierung JSON Rückgabewert korrigiert, Logging verbessert
* __Fehler__ OneMessageAddIn: Fehler behoben wenn kein Trace verwendet wurde


#### 1.4.1

* __Fehler__ Instanzen von OneOffixxDocumentCreator nicht parallel ausführen
* __Fehler__ Csv2Database Add-In: Unterstützung von Tabulator als Trennzeichen, Unterstützung von Spaltennamen mit Sonderzeichen
* __Neu__ FileCopy Add-In: Neuer Parameter "skipExistingFiles"


#### 1.4.0

* __Neu__ FileCopy Add-In: Unterstützung für ein "Filter" Ereignis mit dem ein anderes Add-In die zu kopierende Datei manipulieren kann
* __Neu__ TextReplace Add-In
* __Neu__ MailSender Add-In: Unterstützung von TLS und Authentifizierung
* __Neu__ Konfigurator-Rolle kann pro Instanz definiert werden
* __Neu__ Anzeige der Versionsnummer und des Änderungsdatums eines Add-In
* __Neu__ Verbesserte Anzeige der Alarmierungen bei vielen E-Mail Adressen
* __Neu__ Verbesserte Anzeige der Regelausführungszeit in der Übersicht
* __Neu__ Statistiken können manuell aktualisiert werden
* __Neu__ Statistiken können auch als Tabellen angezeigt werden
* __Neu__ Kontextmenu in Logauswertung zum Filtern von Logeinträgen nach einer Instanz
* __Fehler__ Benutzer die nicht in der Konfigurator Rolle sind, können nicht mehr über das Kontextmenu Instanzen kopieren oder löschen
* __Fehler__ Parameterwerte die XML Tags enthielten konnten nicht korrekt gespeichert werden
* __Fehler__ Mehrzeilige Parameter wurden nicht korrekt behandelt (DatabaseToCsv, DatabaseMaintenance, Dispatcher, Csv2Database)
* __Fehler__ Kein Session-Timeout mehr in Web-Administration


#### 1.3.0

* __Neu__ DatabaseMaintenance Add-In: Möglichkeit einen beliebigen SQL Befehl auszuführen
* __Neu__ Die Reihenfolge der Statistiken kann mittels Drag-and-Drop geändert werden
* __Neu__ Neuer Parametertyp für mehrzeilige Texte (siehe DatabaseToCsv, DatabaseMaintenance, Dispatcher, Csv2Database)
* __Neu__ Anzeige der OneConnexx Version in der Web-Administration, Hinweis auf inkompatible Versionen


#### 1.2.1

* __Neu__ Liste der Installationen ist alphabetisch nach Name sortiert
* __Neu__ FileEraser Add-In unterstützt mehrere Suchmuster
* __Neu__ Seite "Alarmierung" ist jetzt eine Unterseite von "Überwachung"
* __Neu__ Neue Seite "Statistik"
* __Neu__ Verbesserte Darstellung bei kleiner Bildschirmbreite (z.B. Mobilgeräte)
* __Neu__ Möglichkeit Regeln nur an bestimmten Wochentagen oder Tagen im Monat zu prüfen
* __Neu__ Für neue Alarmierungen können Standardtexte in Web.config definiert werden
* __Neu__ Möglichkeit in Log Analyse die neusten Einträge zuoberst anzuzeigen
* __Neu__ Regeln und Alarmierungen können als Excel Datei exportiert werden
* __Neu__ Regeln und Alarmierungen können nach aktiv/inaktiv gefiltert werden
* __Neu__ Möglichkeit Alarmierungen nur bei Regelverletzungen auszuführen und nicht bei jeder fehlerhaften Transaktion
* __Neu__ FileCopy Add-In: Möglichkeit Dateien >2MB auf SharePoint Online hochzuladen
* __Neu__ Xls2Csv Add-In
* __Neu__ Csv2Database Add-In
* __Fehler__ Wenn die Liste der Installationen alte Einträge mit derselben Port-Nummer enthielt, wurde unter Umständen der falsche Connection-String verwendet
* __Fehler__ FileCopy Add-In: Löschen und Archivieren auf SFTP Server hatte nicht funktioniert
* __Fehler__ FileCopy Add-In: Wenn Parameter vo einem Dispatcher Add-In gesetzt wurden und gleichzeitig die Konfiguration ändert, wurden die Parameter wieder zurückgesetzt
* __Fehler__ FileCopy Add-In: Dateiname wird in Transaktion geschrieben
* __Fehler__ FileCopy Add-In: Beim SFTP Protokoll funktionieren jetzt auch absolute Pfade
* __Fehler__ FileCopy Add-In: FTPS unterstützt neuere Protokolle
* __Fehler__ Ldap2CSV: Datumsformat funktioniert jetzt auch für Datumsfelder
* __Fehler__ Direkt nach dem Umbenennen einer Instanz wurden Parameteränderungen nicht gespeichert
* __Fehler__ Verhalten beim Verschieben von Instanzen zu Schnittstellen verbessert
* __Fehler__ In der HTML Ansicht wurden Änderungen am E-Mail Text von Alarmierungen nicht gespeichert
* __Fehler__ Encoding Fehler beim Nachladen von Transaktionen auf der Seite "Überwachung"
* __Fehler__ Logauswertung hat nicht funktioniert wenn sich im "Logs" Verzeichnis noch andere Dateien befinden
* __Fehler__ Echtzeit-Log wird bei jedem Neuladen der Seite zurückgesetzt, da sonst bei grossen Datenmengen der Browser einfriert
* __Fehler__ Ldap2CSV, Xml2Csv: Anführungszeichen wenn nötig verdoppeln


#### 1.1.4

* __Fehler__ Bizagi/OneMessage Transformation korrigiert


#### 1.1.3

* __Neu__ Zustand der Checkbox und Schnittstellen auf der Seite Überwachung/Übersicht wird in einem Cookie gespeichert
* __Fehler__ Falsches Englisches Datumsformat auf der Seite Überwachung/Übersicht korrigiert
* __Fehler__ Ein-/Ausklappen auf der Seite Überwachung/Übersicht korrigiert


#### 1.1.2

* __Neu__ Standard Add-In "OneMessageAdapter"
* __Neu__ Kontextmenu im Baum für Instanzen, Add-Ins und Gruppen
* __Fehler__ Fehlermeldung in Web-Administration wenn 'Installations' Verzeichnis fehlt
* __Fehler__ Gruppierung nach Add-In oder Gruppe wird dauerhaft gespeichert
* __Fehler__ Reihenfolge der Instanzen innerhalb einer Gruppe wurde nicht immer korrekt gespeichert
* __Fehler__ 'Letzte 5 min' Schaltfläche auf der Log-Analyse Seite hat Startzeit nicht aktuelisiert
* __Fehler__ Logdateien werden neu standardmässing in UTF-8 geschrieben


#### 1.1.0

* __Neu__ OneConnexx Installationen werden unter %ProgramData%\Sevitec\OneConnexx\Installations gespeichert und können in der Web-Administration nicht mehr manuell hinzugefügt werden
