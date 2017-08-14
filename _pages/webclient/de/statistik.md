---
layout: page
title: Statistik
permalink: "webclient/de/statistik/"
---

Auf der Statistikseite werden konfigurierte Statistiken aus der Datenbank angezeigt. Es gibt vier verschiedene Diagrammtypen: Kreis-, vertikale Balken-, horizontale Balken- und Liniendiagramm. 

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/statisticPage.PNG "Statistik Seite")

### Statistik Übersicht
Die Funktionen: Erstellen, Editieren und Löschen stehen nur für Nutzer mit Admin-/Konfiguratorrechten zur Verfügung.

#### 1. Anzeige aller Statistiken
	In der Übersicht werden zum einen die Namen alle Statistiken, welche schlussendlich auf der Seite angezeigt werden, angezeigt.
	
#### 2. Erstellen/Editieren
	Das Erstellen und Editieren unterscheidet sich nur darin, dass der Dialog um die Angaben für die Statistik auszufüllen beim Editieren schon mit den Vorhandenen Informationen ausgefüllt wird und beim Erstellen ist dieser Dialog biss auf die Default Werte leer. Der Editieren Dialog wird über das Icon mit dem Stift und dem Papier und der Erstellen Dialog über das Plus Bild geöffnet. Wenn man den Dialog ausgefüllt und auf Ok gedrückt hat, wird die neu erstellte Statistik gleich geladen und angezeigt respektive die Editierte Statistik aktualisiert.
	
#### 3. Löschen
	Wenn man das Abfalleimer Icon drückt kommt ein Dilog mit der Info, dass diese Statistik gelöscht wird. Mit einem erneuten Klick auf Löschen wird die Aktion schlussendlich ausgeführt. Die Statistik wird aus der Datenbank gelöscht und auch gleich von der Seite entfernt.
	
#### 4. Statistik Anzeige
Die geladenen Diagramme werden hier angezeigt. 

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/statisticInputDial.PNG "Erstellen / Editieren Dialog")

### Statistik Eingabe Felder

* Name
	Der Statistik kann ein Name gegeben werden um dem Betrachter informationen über den Inhalt zu geben.
	
* Diagramm Typ
	Die Art des Diagramms kann hier ausgewählt werden.
	
* Höche/Breite
	Um das Diagramm besser lesbar zu gestalten, kann man selber definieren wie gross/klein es dargestellt werden soll.
	
* Legende
	Hier können per Komma getrennt die Legenden eingegeben werden.

* Sql
	Die Abfrage der Datenbank, welche dazu benötigt wird, die anzuzeigenden Daten zu liefern. Das Ergebnis muss im Format: Label, String | FirstValue, int | SecondValue, int zurückgegeben werden. Wobei das Feld SecondValue optional ist.
	
### StatistikBereich Eingabe Felder
* Name
	Dem StatistikBereich kann ein Name gegeben werden um dem Betrachter Informationen über den Inhalt zu geben.
