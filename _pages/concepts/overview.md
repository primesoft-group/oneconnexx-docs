---
layout: page
title: Übersicht
permalink: "concepts/de/overview/"
---

## Systemübersicht {% include anchor.html name="system" %}

Folgende Systemübersicht zeigt schematisch welche Kommunikationspfade OneOffixx unterstützt. 

![x]({{ site.baseurl }}/assets/content-images/concepts/de/system-overview.png "Architektur")

Für die Schnittstellenbeschreibung stehen zwei Schnittstellen im Fokus:

* Die Fachapplikaton kann OneOffixx mit unterschiedlichen Methoden aufrufen: __[Connect Verarbeitung auf dem Client]({{ site.baseurl }}/connect/de/usage#client)__

* Die Fachapplikaton ruft den OneOffixx Document Creation Server auf: __[Connect Verarbeitung auf dem Server]({{ site.baseurl }}/connect/de/usage#server)__

## Document Engine - Übersicht {% include anchor.html name="docengine-overview" %}

Die Document Engine ist das Herzstück der OneOffixx Applikation. 

Sie kommt sowohl im Server als auch im Client zum Einsatz und erstellt aus dem angeforderten "Template" und zusätzliche "Connect"-Daten das entsprechende Dokument.

![x]({{ site.baseurl }}/assets/content-images/concepts/de/docengine-overview.png "Document-Engine - Übersicht")

Im ersten Schritt werden die Daten und die Konfiguration geladen. Danach werden konfigurierte Dokumentfunktionen im __"Processing"-Schritt__ entsprechend aufgerufen. 
Auf der __["Connect - Functions"]({{ site.baseurl }}/connect/de/connect-functions/)__-Seite sind alle Dokumentfunktionen aufgelisted, welche über die Connect Schnittstelle parametrierbar sind.

Nach diesen Schritt ist das eigentliche Dokument generiert. 

Falls __["Connect - Commands"]({{ site.baseurl }}/connect/de/connect-commands/)__ definiert wurden, werden diese nun durchlaufen. Hierdurch kann das generierte Dokument z.B. in ein PDF konvertiert werden oder auf ein Netzwerklaufwerk abgespeichert werden. Die einzelnen "Commands" werden der Reihe nach aufgerufen.

Am Ende geht das fertige Dokument wieder an den Aufrufer.

## Document Engine - Vererbungssystem {% include anchor.html name="docengine-inheritance" %}

Jede Vorlage bzw. Vorlagentyp bringt einen Teil der spezifischen Merkmale des Enddokumentes mit. Zum Beispiel liefert das "Style" Dokument alle Style Merkmale des Hauptdokumentes mit. Die verschiedenen Vorlagentypen können so beliebig kombiniert und jederzeit ausgetauscht oder aktualisiert werden. Dadurch können Redundanzen im Vorlagenbau vermieden werden. Die Dokumente werden immer zur Laufzeit neu generiert.

Diese Grafik zeigt die __maximale__ Vererbungsstufe - jede Ebene ist optional.

![x]({{ site.baseurl }}/assets/content-images/concepts/de/docengine-inheritance.png "Document-Engine - Vererbungssystem")

Die Dokumentenpipeline enthält ein vorlagenspezifisches Liste von Funktionen, die als PlugIns realisiert sind und beim Starten von OneOffixx geladen werden. 

Welche Dokumentfunktionen in welcher Reihenfolge in einer Vorlage verwendet werden, wird in OneOffixx im Vorlagenbearbeitungsmodus vom Vorlagenbauer festgelegt. 

Dokumentfunktionen enthalten für sich geschlossene Prozeduren, die auf das Dokument, Schnittstellen etc. angewendet werden.
