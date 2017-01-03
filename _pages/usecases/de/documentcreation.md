---
layout: page
title: Use Cases - Document Creation
permalink: "usecases/de/documentcreation/"
---

## OneConnexx - Dokumentendienst 

Im Bereich Dokumentendienst bietet der OneConnexx einige interessante Funktionen.

![x]({{ site.baseurl }}/assets/content-images/usecases/de/documentationservice.png "Dokumentendienst")

Eine beliebige Applikation bzw. System übermittelt dem OneConnexx das Ereignis Dokument erstellen mit Angaben wie z.B. Vorlagennummer und Sprache.
Ein AddIn im OneConnexx ist auf dieses Ereignis abonniert und erstellt über die OneOffixx Schnittstelle ein entsprechendes Dokument. 
Hinweis - Die Dokumentvorlagen werden unter OneOffixx verwaltet. Der Inhalt der Dokumente kann statisch oder dynamisch sein. Die dynamischen Daten werden beim Aufruf von der aufrufenden Applikation bzw. System mitgegeben.
Mögliche Ergänzungen
Auf Wunsch kann die Adresse über den WebService der Post mit einem WebStamp oder PP ergänzt werden. 
Auf Wunsch kann eine eindeutige Kennung angedruckt werden um einerseits eine Verpackungsmaschine zu steuern und andererseits die Retouren, welche im Scanner erfasst werden 5 zu erkennen und einzuordnen.
Das erstellte Dokument kann
als Word oder PDF gespeichert werden
auf Papier ausgedruckt oder als Anhang in einem E-Mail versendet werden
Antworten werden eingescannt und anhand der eindeutigen Matrix erkannt und im System eingeordnet

