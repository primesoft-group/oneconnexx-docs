---
layout: page
title: Architektur
permalink: "architecture/de/overview/"
language: de
---

## Übersicht

Eine OneConnexx Installation besteht typischerweise aus den folgenden Komponenten:

![x]({{ site.baseurl }}/assets/content-images/architecture/de/overview.png "Übersicht")

Die Datenbank, Alerting-Service und Mail-Server sind dabei optional, aber notwendig wenn die Features «Alarmierung» und «Überwachung» verwendet werden sollen.

In einem Szenario mit mehreren OneConnexx Instanzen, müssen Datenbank, IIS, Alerting-Service und Mail-Server nur einmal vorhanden sein.

## OneConnexx-Service

![x]({{ site.baseurl }}/assets/content-images/architecture/de/oneconnexxservice.png "OneConnexx-Service")

Das Herz des OneConnexx ist der OneConnexx-Service. Dieser wird als eigenständiger Windows-Dienst installiert.

Der OneConnexx-Service liest beim Aufstarten die Konfiguration aus einer Konfigurationsdatei und instanziiert die konfigurierten Add-In Instanzen.

Die Ausführung des Services und der Add-In Instanzen werden in einer Logdatei protokolliert. Als Logging Framework wird nLog eingesetzt.

Einzelne Add-Ins protokollieren das Resultat ihrer Ausführung mit einem Eintrag in der Datenbank. Dazu muss für den OneConnexx-Service ein Connection-String konfiguriert sein, und die entsprechende Add-In Instanz muss einer logischen «Schnittstelle» zugeordnet sein.

#### Konfiguration

Welche Add-Ins verwendet werden und wie diese konfiguriert sind, wird aus einer Konfigurationsdatei
(normalerweise Config\oneconnexx.config) gelesen.

Die Konfiguration erfolgt über einer Web-Applikation im Browser. Geänderte Einstellungen werden über
eine .NET Remoting Schnittstelle an den OneConnexx-Service übertragen und von diesem in die Konfigurationsdatei geschrieben.

#### Add-In Typen

OneConnexx unterscheidet zwischen folgenden 2 Typen von Add-Ins:

![x]({{ site.baseurl }}/assets/content-images/architecture/de/eventaddin.png "Ereignis Add-In")

Instanzen von **Ereignis Add-Ins** werden beim Start des OneConnexx-Services gestartet und sind so lange aktiv
wie der Service läuft. Sie können Ereignisse auslösen die dann wiederum andere Add-Ins starten. Ein typisches Beispiel
für ein Ereignis Add-In ist ein Web-Service, der beim Start einen Socket öffnet, auf die Verbindung eines Clients wartet,
und ein Ereignis auslöst sobald eine Client-Anfrage erhalten wurde.

![x]({{ site.baseurl }}/assets/content-images/architecture/de/logicaddin.png "Logik Add-In")

Instanzen von **Logik Add-Ins** werden durch ein Ereignis aktiviert, erledigen eine bestimmte Aufgabe und sind danach
wieder inaktiv. Ein Beispiel für ein Logik Add-In ist das FileCopy Add-In, welches eine Datei von A nach B kopiert.

#### Add-In Framework

Add-Ins werden mithilfe des Microsoft Managed Extensibility Framework instanziert. Alle verfügbaren Add-Ins
werden aus dem «AddIn» Verzeichnis gelesen und in das «Shadow» Verzeichnis kopiert. Das «Shadow» Verzeichnis
ist nur sichtbar wenn im Windows-Explorer die Option zur anzeige von versteckten Dateien aktiviert ist.

Der OneConnexx-Service lädt die konfigurierten Add-In DLLs aus dem «Shadow» Verzeichnis und überwacht das «AddIn» Verzeichnis auf Änderungen.
Durch diesen Mechanismus ist es möglich einzelne Add-Ins im laufenden Betrieb zu aktualisieren:

* Eine neue DLL wird in das «AddIn» Verzeichnis kopiert.
* Der OneConnexx-Service erkennt die geänderte Datei.
* Bei Ereignis Add-Ins werden alle laufenden Instanzen des entsprechenden Add-Ins  gestoppt.
* Bei Logik Add-Ins wird gewartet bis alle aktiven Instanzen ihre Ausführung abgeschlossen haben.
Die Abarbeitung von Ereignissen wird unterbrochen, so dass keine neuen Instanzen mehr gestartet werden.
* Die geänderten Dateien aus dem «AddIn» Verzeichnis werden ins «Shadow» Verzeichnis kopiert.
* Die zuvor beendeten Instanzen des aktualisierten Logik Add-Ins werden wieder gestartet.

#### Add-In Kommunikation

Add-Ins kommunizieren untereinander über Ereignisse. Jede Add-In Instanz kann ein Ereignis auslösen. Ein Ereignis ist
normalerweise durch den Namen der auslösenden Instanz und optional durch einen Ereignistyp definiert. Ein "FileCopy" Add-In
beispielsweise löst für jede kopierte Datei ein Ereignis vom Typ "Output" aus, das den Namen der kopierten Datei enthält.
Nachdem alle Dateien kopiert wurden, wird ausserdem ein Ereignis "Done" ausgelöst. Heisst die Instanz beispielsweise "FileCopy_Demo",
dann heissen die ausgelösten Ereignisse wie folgt:

```
FileCopy_Demo.Output
FileCopy_Demo.Done
```

Instanzen von Logik Add-Ins können dieses Ereignis abonnieren und werden aktiviert, sobald das Ereignis ausgelöst wird.
Treten mehrere Ereignisse auf die eine Add-In Instanz aboniert hat, werden diese der Reihe nach abgearbeitet. Jede Add-In Instanz
hat eine eigene Queue für Ereignisse. Eine parallele Verarbeitung gibt es nur zwischen unterschiedlichen Instanzen.

![x]({{ site.baseurl }}/assets/content-images/architecture/de/eventqueue.png "Ereignis-Queue")

## Web-Administration

![x]({{ site.baseurl }}/assets/content-images/architecture/de/webapplication.png "Web-Applikation")

Die Administration und Konfiguration des OneConnexx-Services erfolgt über eine .NET MVC Web-Applikation.
Die Web-Applikation wird in Microsoft IIS gehostet und verwendet «Windows Authentication» für die Berechtigungsprüfung.
Mehreren Instanzen des OneConnexx-Services können durch eine Instanz der Web-Applikation administriert werden.
Die Kommunikation mit den Service-Instanzen erfolgt dabei über .NET Remoting.

Änderungen an der Add-In Konfiguration werden in der Web-Applikation gesammelt und müssen explizit gespeichert werden.
Dadurch werden alle Änderungen an den OneConnexx-Service übermittelt und dieser speichert aktualisiert die Konfigurationsdatei.

Die Konfiguration der Überwachungs- und Alarmierung-Regeln sind in der Datenbank gespeichert. Die Web-Applikation greift
dazu direkt auf die Datenbank zu.

Für die Echtzeitansicht und Auswertung der Logdateien greift die Web-Applikation direkt auf die Logdateien der
entsprechenden OneConnexx-Instanz zu. Das funktioniert nur, wenn die Web-Applikation auf demselben Server installiert
ist wie der OneConnexx-Service.

## Datenbank

![x]({{ site.baseurl }}/assets/content-images/architecture/de/db.png "Datenbank")

Als Datenbank kommt Microsoft SQL Server (beliebige Ausgabe) zum Einsatz. Eine Datenbank Instanz kann, muss aber nicht,
von mehreren OneConnexx Instanzen verwendet werden. Eine Datenbank wird nur für die Features «Überwachung» und «Alarmierung»
benötigt und kann auch wegfallen wenn diese Features nicht verwendet werden.

Alle Datenzugriffe erfolgen mittels EntityFramework und über gespeicherter Prozeduren.

#### Schema

![x]({{ site.baseurl }}/assets/content-images/architecture/de/dbschema.png "Datenbankschema")

Tabelle **Alert**: Enthält die in der Web-Administration unter «Alarmierung» konfigurierten E-Mails. 

Tabelle **Rule**: Enthält die in der Web-Administration unter «Überwachung/Regeln» konfigurierten Regeln.

Tabelle **MailQueue**: Muss ein Alarmierung-E-Mail versendet werden, wird ein Eintrag in dieser Tabelle erstellt. Sobald das E-Mail versandt wurde wird der Eintrag gelöscht.

Tabelle **Interface**: Enthält die in der Web-Administration unter «Überwachung/Schnittstellen» konfigurierten Schnittstellen.

Tabelle **Instance**: Enthält einen Eintrag für jede konfigurierte Add-In Instanz.

Tabelle **Transaction**: Jedes Add-In schreibt bei seiner Ausführung einen Eintrag in diese Tabelle, vorausgesetzt es ist einer Schnittstelle zugeordnet.

Tabelle **TransactionCache**: Enthält die letzte Transaktion pro Schnittstelle und Endpunkt. Diese Tabelle entspricht der Ansicht Überwachung/Übersicht in der Web-Administration.


## Alerting-Service

![x]({{ site.baseurl }}/assets/content-images/architecture/de/alertingservice.png "Alerting-Service")

Der Alerting-Service ist optional und wird nur für die Features «Überwachung» und «Alarmierung» benötigt.
Der Alerting-Service kann mehrere Instanzen des OneConnexx-Services überwachen und ist für die folgenden 2 Aufgaben zuständig:

* Prüfen aller in der Datenbank hinterlegten Regeln. Dazu werden die ebenfalls in der Datenbank abgespeicherten Transaktionen ausgewertet. Wird eine Regelverletzung erkannt, wird ein Eintrag in der Mail-Queue erstellt.
* Versenden der E-Mails in der Mail-Queue.

Hinweis: Einträge in der Mail-Queue können auch direkt von Add-Ins erstellt werden, wenn bei deren Ausführung ein Fehler auftritt.

## Mail-Server

![x]({{ site.baseurl }}/assets/content-images/architecture/de/mailserver.png "Mail-Server")

Für das Versenden von Alarmierungen muss ein Mail-Server bereitgestellt werden.
Der Mail-Server ist nicht Teil der OneConnexx Installation sondern muss in Ihrer Organisation bereits vorhanden sein.
Die Kommunikation mit dem Mail-Server erfolgt über das SMTP Protokoll.
