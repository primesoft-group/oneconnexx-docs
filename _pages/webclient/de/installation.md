---
layout: page
title: Installation
permalink: "webclient/de/installation/"
---

### Übersicht über die Installationen

Auf dieser Seite werden alle OneConnexx Installationen auf dem lokalen System angezeigt, sobald diese einmal gestartet wurden.

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/installation.png "Übersicht Installtionen")  


* __Name:__ Der Name der Installation kann nach belieben gewählt werden.
* __Port:__ Der Port über welchen der Service ansprechbar ist, dieser wird automatisch ermittelt und kann nur in der OneConnexx Konfigurationsdatei der entsprechenden Installation geändert werden.
* __Status:__ Zeigt an, ob die Installation momentan gestartet und verbunden ist.
* __SQL-Datenbank:__ Zeigt an, ob eine Datenbank konfiguriert wurde und ob diese erreichbar ist.
* __Windows Service:__ Zeigt an, ob der Windows-Service gestartet ist, und ermöglicht es den Service manuell zu starten oder zu stoppen.

Ein Klick auf Name oder Port lädt die Installation.
	

#### 1. Installation bearbeiten

Mit einem Klick auf das "Bearbeiten" Symbol öffnet sich folgender Dialog:

 ![X]({{ site.baseUrl }}/assets/content-images/webclient/de/addInstallation.png "Installtion Bearbeiten") 
 
Es können nur die folgenden Parameter angepasst werden:

 * Name
 * Verbindungszeichenfolge
 
Mit der Schaltfläche "Verbindung prüfen" kann die Verbindung zur SQL-Datenbank direkt getestet werden.
 
#### 2. Installation löschen
 
Mit einem Klick auf das "Löschen" Symbol kann eine Installation aus der Liste entfernt werden. Das entfernen einer Installation ist nur möglich wenn der entsprechende OneConnexx nicht gestartet ist.
