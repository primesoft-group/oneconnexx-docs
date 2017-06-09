---
layout: page
title: Statistik
permalink: "webclient/de/statistik/"
---

Auf der Statistikseite werden konfigurierte Statistiken aus der Datenbank angezeigt. Es gibt vier verschiedene Diagrammtypen: Kreis-, vertikale Balken-, horizontale Balken- und Liniendiagramm. 

{Bild der Seite}

#### 1. Statistik Übersicht
Die Funktionen: Erstellen, Editieren und Löschen stehen nur für Nutzer mit Admin-/Konfiguratorrechten zur Verfügung.

	* Anzeige aller Statistiken
	In der Übersicht werden zum einen die Namen alle Statistiken, welche schlussendlich auf der Seite angezeigt werden, angezeigt.
	
	* Erstellen/Editieren
	Das Erstellen und Editieren unterscheidet sich nur darin, dass der Dialog um die Angaben für die Statistik auszufüllen beim Editieren schon mit den Vorhandenen Informationen ausgefüllt wird und beim Erstellen ist dieser Dialog biss auf die Default Werte leer. Der Editieren Dialog wird über das Icon mit dem Stift und dem Papier und der Erstellen Dialog über das Plus Bild geöffnet. Wenn man den Dialog ausgefüllt und auf Ok gedrückt hat, wird die neu erstellte Statistik gleich geladen und angezeigt respektive die Editierte Statistik aktualisiert.
	
	* Löschen
	Wenn man das Abfalleimer Icon drückt kommt ein Dilog mit der Info, dass diese Statistik gelöscht wird. Mit einem erneuten Klick auf Löschen wird die Aktion schlussendlich ausgeführt. Die Statistik wird aus der Datenbank gelöscht und auch gleich von der Seite entfernt.
	
#### 2. Statistik Anzeige
Die geladenen Diagramme werden hier angezeigt. 

{Bild des Eingabedialoges}

### 3. Dialog Eingabe Felder

	* Name
	Der Statistik kann ein Name gegeben werden um dem Betrachter informationen über den Inhalt zu geben.
	
	* Diagramm Typ
	Welches Diagramm das dargestellt werden soll.
	
	* Höche/Breite
	Um das Diagramm besser lesbar zu gestallten kann man selber definieren wie gross/klein es dargestellt werden soll.
	
	* Sql
	Die Abfrage der Datenbank, welche dazu benützt wird die anzuzeigenden Daten zu liefern. Das Ergebnis muss im Format: Label, String | Value, int zurückgegeben werden.
