---
layout: page
title: Statistik
permalink: "webclient/de/statistik/"
language: de
---

Auf der Statistikseite werden konfigurierte Statistiken aus der Datenbank angezeigt. Es gibt vier verschiedene Diagrammtypen: Kreis-, vertikale Balken-, horizontale Balken- und Liniendiagramm. 

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/statisticsPage.PNG "Statistik Seite")

### Statistik Übersicht
Die Funktionen erstellen, editieren und löschen stehen nur für Nutzer mit Admin-/Konfiguratorrechten zur Verfügung.
Links werden alle Statistikbereiche angezeigt und rechts die Statistiken des momentan aktiven Bereichs.
Falls kein Bereich in der Datenbank vorhanden ist, wird der Bereich "Allgemeine Statistiken" erstellt.
Ein Bereich kann nur gelöscht werden, wenn er keine Statistiken enthält.

#### 1. Statistikbereich
Hier wird der Name des Bereichs angezeigt, man kann neue Statistiken erstellen und den Bereich bearbeiten.
Wenn der Bereich Statistiken enthält, wird das Icon zum Löschen ausgegraut und erst wieder aktiviert, wenn alle Statistiken von diesem Bereich gelöscht wurden.
Beim Erstellen wird der aktuelle Bereich schon selektiert.
	
#### 2. Statistik editieren und löschen
Mit einem Klick auf das Icon mit dem Stift und dem Papier kann die Statistik bearbeitet werden. Mit dem Abfalleimer Icon erscheint ein Dialog mit einer Info, dass diese Aktion schlussendlich ausgeführt. Die Statistik wird aus der Datenbank gelöscht und auch gleich von der Seite entfernt.

Mittels drap-and-drop kann die Reihenfolge der Statistiken innerhalb eines Bereichs verschoben werden. Dadurch wird auch sofort die Reihenfolge der Diagramme angepasst.
	
#### 3. Statistikbereich hinzufügen
Hier kann ein neuer Statistikbereich hinzugefügt werden.

#### 4. Statistik Anzeige
Die Diagramme des momentan aktiven Bereichs werden hier angezeigt. Fährt man mit der Maus über ein Diagramm, werden oben rechts 3 Icons eingeblendet um die Statistik zu **aktualisieren**, **editieren** oder zu **löschen**.

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/statisticrefresh.png "Statistik aktualisieren/editieren/löschen")

Mittels drap-and-drop kann die Reihenfolge der Diagramme geändert werden. Dadurch wird auch sofort die Reihenfolge der Statistiken im Statistikbereich geändert.

### Statistik bearbeiten

Durch Klicken auf das Bearbeiten-Icon wird der Dialog mit den Eigenschaften der Statistik geöffnet:

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/statisticInputDial.PNG "Statistik erstellen/editieren Dialog")

* **Name:**	Der Statistik kann ein Name gegeben werden um dem Betrachter informationen über den Inhalt zu geben.
* **Diagramm Typ:**	Die Art des Diagramms kann hier ausgewählt werden.
* **Höche/Breite:**	Um das Diagramm besser lesbar zu gestalten, kann man selber definieren wie gross/klein es dargestellt werden soll.
* **Legende:** Hier können per Komma getrennt die Legenden eingegeben werden.
* **Sql:** Die Abfrage der Datenbank, welche dazu benötigt wird, die anzuzeigenden Daten zu liefern. Das Ergebnis muss im Format: Label, String \| FirstValue, int \| SecondValue, int zurückgegeben werden. Wobei das Feld SecondValue optional ist.
	

### Statistikbereich bearbeiten

Klickt man auf das Bearbeiten-Icon eines Statistikbereichs oder auf das Icon zum Erstellen eines neuen Bereichs, wird der Dialog mit den Eigenschaften des Statistikbereichs geöffnet:

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/addStatisticArea.PNG "Statistikbereich erstellen/editieren Dialog")

* **Name:**	Dem Statistikbereich kann ein Name gegeben werden um dem Betrachter Informationen über den Inhalt zu geben.
