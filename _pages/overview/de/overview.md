---
layout: page
title: Übersicht
permalink: "overview/de/overview/"
---

## OneConnexx - Enterprise Service Bus (ESB)

Der OneConnexx verbindet die unterschiedlichsten Applikationen und System sowohl innerhalb Ihrer IT Infrastruktur als auch mit den Systemen Ihrer Kunden bzw. Partner.
Der OneConnexx unterstützt Sie zudem mit diversen prozessunterstützenden Funktionen bei der Abwicklung Ihrer Geschäftsprozesse.

![x]({{ site.baseurl }}/assets/content-images/overview/de/overview.png "Übersicht")

## Konnektoren

Im Gegensatz zu anderen ESBs, bei denen die Umsysteme angepasst werden müssen, damit diese mit dem ESB kommunizieren können, stellt der OneConnexx Konnektoren zur Verfügung. Im obigen Diagramm sind die Konnektoren durch die grünen Pfeile dargestellt. Konnektoren sind in OneConnexx durch AddIns realisiert.
Für die gebräuchlichsten Kommunikationsprotokolle und einige Fremdsysteme sind in OneConnexx bereits Konnektoren enthalten (Liste nicht abschliessend):

* Datenbank (MS SQL Server)
* Dateisystem
* FTP, SFTP, FTPS, WebDAV, Amazon S3
* SOAP Web-Services
* E-Mail (SMTP)
* LDAP / Active Directory
* Microsoft SharePoint
* Bizagi
* OneOffixx

## Prozessunterstützende Funktionen

Bei der Datenverarbeitung und Prozessabwicklung werden oft auch prozessunterstützende Funktionen benötigt. Dazu gehört z.B. das Starten eines Prozesses zu vordefinierten Zeitpunkten oder sobald eine Datei in einem überwachten Verzeichnis abgelegt wird. Aber auch Datentransformationen oder das Versenden von E-Mails gehören in diese Kategorie von Funktionen. 
OneConnexx bietet bereits viele prozessunterstützende Funktionen als AddIns an (Liste nicht abschliessend):

* Timer (Interval, täglich, wöchentlich, monatlich, jährlich)
* Verzeichnisse überwachen
* E-Mails versenden
* Dateien komprimieren / dekomprimieren
* XSL Transformationen
* Löschen von alten Dateien
* Überwachen der Servererreichbarkeit (Ping)

## Kundenspezifische AddIns

Gründe für kundenspezifische Entwicklungen sind vielseitig. Kundenspezifische AddIns enthalten oftmals kundenspezifische Geschäftslogik wie Validierung von Daten oder spezielle Transformationen. Solche sind mit Standard AddIns und dynamischer Konfiguration kaum oder nur mit erheblichem Aufwand zu bewerkstelligen. Auch die Anbindung an spezielle Umsysteme kann eine kundenspezifische Entwicklung erfordern.
Nebst den bereits vorhandenen Konnektoren und prozessunterstützenden Funktionen können wir ohne grossen Aufwand neue AddIns implementieren. Der Entwicklungsaufwand ist gering, da bei der Implementation auf eine Vielzahl von Basisfunktionen zurückgegrifen werden kann.
Durch unser Framework profitieren neu entwickelte AddIns automatisch von folgenden Basisfunktionen:

* Logging
* Überwachung der Ausführung
* Verknüpfen von AddIns über Ereignisse
* Konfiguration der AddIns über eine Webseite
 
## Abbilden von Prozessen durch Verknüpfen von AddIns 

Durch Verknüpfen von Konnektoren und prozessunterstützenden Funktionen können komplexe Prozesse abgebildet werden. Ein möglicher Prozess wäre beispielsweise:

![x]({{ site.baseurl }}/assets/content-images/overview/de/process.png "Prozess")

Timer (z.B. am 1. jedes Monats) -> Exportieren von Benutzern aus dem Active Directory in eine CSV Datei -> Kopieren dieser CSV Datei auf einen FTP Server -> Informieren einer Person via E-Mail

## Administration und Management

Die Administration und Konfiguration des OneConnexx erfolgt über eine moderne Web-Applikation die mit jedem modernen Browser bedient werden kann. Die OneConnexx Web-Administration unterstützt sowohl bei der Konfiguration als auch im Betrieb bei der Auswertung der Log- und der Monitoringdaten.

#### AddIns konfigurieren

AddIns werden in der OneConnexx Web-Administration hinzugefügt, konfiguriert oder gelöscht. AddIns können ausserdem miteinander verknüpft werden. Die Web-Administration unterstützt den Benutzer dabei mit einer kurzen Beschreibung der AddIn Parameter und sorgt für eine fehlerfreie Konfiguration.

#### Log

Bei der Analyse von Problemen oder beim Umsetzen neuer Prozesse sind umfangreiche Protokolldateien unverzichtbar. Die Web-Administration bietet einerseits eine Echtzeitansicht und andererseits eine Auswertung der Vergangenheit mit detaillierten Filtermöglichkeiten.

#### Überwachung und Alarmierung

Die fehlerfreie Ausführung der konfigurierten Prozesse kann durch vielfältige Regeln überwacht werden. Es können E-Mails definiert werden, die bei Verletzung einer Regel an vordefinierte Empfänger versendet werden.
