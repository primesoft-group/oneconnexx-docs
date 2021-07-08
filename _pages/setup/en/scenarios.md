---
layout: page
title: Installationsszenarien
permalink: "setup/de/scenarios/"
---

### Minimalinstallation ohne Datenbank
Eine minimale Installation besteht aus dem OneConnexx Windows-Dienst und dem Internet Information Server mit der Web-Applikation für die Administration.

![x]({{ site.baseurl }}/assets/content-images/setup/de/scenario1.png "Szenario 1")


### Standardinstallation mit vorhandenem Datenbankserver
Die Standardinstallation ist eine Erweiterung der Minimalinstallation um eine Datenbank, welche auf einem bereits vorhandenen Datenbankserver installiert wird. 
Die Standardinstallation mit der Verteilung auf zwei Server garantiert die beste Performance.

![x]({{ site.baseurl }}/assets/content-images/setup/de/scenario2.png "Szenario 2")

### Alles neu auf einem Server Installation
Ist kein Datenbankserver verfügbar und Statistikdaten trotzdem erwünscht, kann auf dem OneConnexx Server zusätzlich eine
Microsoft SQL Server Datenbank installiert werden. Diese Variante kann aber bei leistungsintensiven Transaktionen und
komplexen Auswertungen zu Performanceeinbussen führen.

![x]({{ site.baseurl }}/assets/content-images/setup/de/scenario3.png "Szenario 3")
