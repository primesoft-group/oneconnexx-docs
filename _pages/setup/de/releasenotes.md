---
layout: page
title: Versionshinweise
permalink: "setup/de/releasenotes/"
---

#### vNext

* __Neu__ Liste der Installationen ist alphabetisch nach Name sortiert
* __Neu__ FileEraser Add-In untersützt mehere Suchmuster
* __Neu__ Seite "Alarmierung" ist jetzt eine Unterseite von "Überwachung"
* __Neu__ Neue Seite "Statistik"
* __Neu__ Verbesserte Darstellung bei kleiner Bildschirmbreite (z.B. Mobilgeräte)
* __Neu__ Möglichkeit Regeln nur an bestimmten Wochentagen oder Tagen im Monat zu prüfen
* __Neu__ Für neue Alarmierungen können Standardtexte in Web.config definiert werden
* __Neu__ Möglichkeit in Log Analyse die neusten Einträge zuoberst anzuzeigen
* __Fehler__ Wenn die Liste der Installationen alte Einträge mit derselben Port-Nummer enthielt, wurde unter Umständen der falsche Connection-String verwendet
* __Fehler__ FileCopy Add-In: Löschen und Archivieren auf SFTP Server hatte nicht funktioniert
* __Fehler__ FileCopy Add-In: Bei einem Fehler wurde der falsche Endpunkt in die Transaktion geschrieben wenn dieser von einem Dispatcher Add-In kommt
* __Fehler__ Direkt nach dem Umbenennen einer Instanz wurden Parameteränderungen nicht gespeichert
* __Fehler__ Verhalten beim Verschieben von Instanzen zu Schnittstellen verbessert
* __Fehler__ In der HTML Ansicht wurden Änderungen am E-Mail Text von Alarmierungen nicht gespeichert


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
