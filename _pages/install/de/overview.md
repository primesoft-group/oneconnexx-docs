---
layout: page
title: Systemübersicht
permalink: "install/de/overview/"
---

Das Produkt OneOffixx besteht aus mehreren Komponenten, wobei man diese in zwei Kategorien einteilen kann:

Einerseits die __serverseitige Applikationen__ und auf der anderen Seite der __Windows Client__, samt den __Office Addins__.

![x]({{ site.baseurl }}/assets/content-images/install/de/install-overview.png "Installationskomponenten - Übersicht")

## <i class="fa fa-server" aria-hidden="true"></i> Serverseitige Applikationen

Auf der Server-Seite speichert OneOffixx all seine Daten in eine __SQL Datenbank__. Diese Daten werden durch einen __API Service__ zum Windows Client für die Synchronisierung bereitgestellt.

Neben diesem Service gibt es noch eine Reihe weiterer Komponenten. 

* IIS-Web-Applikationen:
  * __Service:__ Beinhaltet den SOAP Service für die Client-Synchronisierung.
  * __Admin:__ Diese Applikation dient zur Unterstützung während des Betriebs und verfügt über verschiedene Werkzeuge um Daten einzusehen oder zu bearbeiten. Im Admin werden zudem Statistik Daten über die Verwendung der Vorlagen angezeigt.
  * __Web:__ User können über diese Webapplikation auch im Browser Dokumente erzeugen oder sich ein Überblick über die vorhandenen Vorlagen verschaffen.
  * __Hub:__ Stellt einen Kommunikationskanal zwischen Service, Hub und Admin her.
* Dienste oder Utilities:  
  * __User Sync Worker:__ Über diese Applikation können Profil- und Nutzerdaten mit dem Active Directory oder anderen LDAP System synchron gehalten werden.

Weitere Informationen zur Installation finden Sie unter __[Server Installation]({{ site.baseurl }}/install/de/server)__. 

## <i class="fa fa-desktop" aria-hidden="true"></i> Windows Client & Office Addins

Der Windows Client bietet verschiedene Funktionen für den normalen Nutzer, Vorlagen-Ersteller oder für Administratoren. 

Weitere Informationen zur Installation finden Sie unter __[Client Installation]({{ site.baseurl }}/install/de/client)__. 

{% include alert.html type="info" text="Um mehr über die Bedienung von OneOffixx zu erfahren, nutzen Sie die <b><a href='http://help.oneoffixx.com/suite/de/'>Online Hilfe</a></b>." %}

Der Client ruft die Daten über den __API Service__ vom OneOffixx Service ab und speichert diese __lokal in einem Cache__.
Wenn die Office Addins installiert sind, __verbinden diese sich mit dem installierten Client__.
