---
layout: page
title: Use Cases - Document Creation
permalink: "usecases/de/documentcreation/"
---

## OneConnexx - Dokumentendienst 

Im Bereich Dokumentendienst bietet der OneConnexx einige interessante Funktionen.

![x]({{ site.baseurl }}/assets/content-images/usecases/de/documentationservice.png "Übersicht")

1.	Eine beliebige Applikation / System übermittelt dem OneConnexx das Ereignis «Dokument erstellen» mit Angaben wie z.B. Vorlagennummer und Sprache.
2.	Ein AddIn im OneConnexx ist auf dieses Ereignis abonniert und erstellt über die OneOffixx Schnittstelle ein entsprechendes Dokument. 
Hinweis: Die Dokumentvorlagen werden unter OneOffixx verwaltet. Der Inhalt der Dokumente kann statisch und/oder dynamisch sein. Die dynamischen Daten werden beim Aufruf von der aufrufenden Applikation / System mitgegeben.
3.	Mögliche Ergänzungen:
a.	Auf Wunsch kann die Adresse über den WebService der Post mit einem WebStamp oder PP ergänzt werden. 
b.	Auf Wunsch kann eine eindeutige Kennung angedruckt werden um einerseits eine Verpackungsmaschine zu steuern und andererseits die Retouren, welche im Scanner erfasst werden (5.) zu erkennen und einzuordnen.
4.	Das erstellte Dokument kann
a.	als Word oder PDF gespeichert werden
b.	auf Papier ausgedruckt oder als Anhang in einem E-Mail versendet werden
5.	Antworten werden eingescannt und anhand der eindeutigen Matrix erkannt und im System eingeordnet
