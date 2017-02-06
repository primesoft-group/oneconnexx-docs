---
layout: page
title: Installation
permalink: "webclient/de/installation/"
---

### Übersicht über die Installationen

In der Übersicht über die Installationen werden alle Installationen angezeigt. Eine Installation besteht aus folgenden Komponenten:

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/installation.png "Übersicht Installtionen")  


* Name:  
Der Name der Installtion, kann nach belieben gewählt werden  
	
* Server:  
Der Name des IIS Webservers auf welchem der Service installiert ist.  
	
* Port:  
Der Port über welchen der Service Ansprechbar ist.  
	
* Status:  
Zeigt an ob die gelistete Installation momentan aktiv und verbunden ist.  
	
* SQL-Datenbank:  
Zeigt an, ob die hinterlegte Datenbank erreichbar ist.  
	
* Windows Service:  
Zeigt an, ob der Service bereits gestartet ist.
	
Ein klick auf Name, Server oder Port lädt die Installation	
	
 Steuerschaltlächen

### 1. Installation Hinzufügen  

Ein Klick auf das Plus öffenet den folgenden Dialog:

 ![X]({{ site.baseUrl }}/assets/content-images/webclient/de/addInstallation.png "Installtion hinzufügen") 
 
 Beim Hinzufügen einer Insatallation müssen nebst Namen, Server und Port auch noch zwei weitere Parameter angegeben werden:
 
 * Service  
 der Name des Service über welchen er in den Diensten gefunden werden kann.
 
 * Verbindungszeichenfolge  
 Die Verbindungszeichenfolge (Connectionstring) für die SQL-Datenbank (falls vorhanden). Mit dem Button unter dem Eingabefeld kann die Verbindung direkt getestet werden.

### 2. Installation Bearbeiten/Löschen    

 Mit diesen beiden Schaltflächen kann eine Installtion bearbeitet/gelöscht werden.
 

