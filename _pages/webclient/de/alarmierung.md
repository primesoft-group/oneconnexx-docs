---
layout: page
title: Alarmierung
permalink: "webclient/de/alarmierung/"
---
Die Alarmierung hängt eng mit den Regeln aus dem Bereich "Überwachung" zusammen.
Die Hauptaufgabe der Alarmierung ist es, eine angegebene Kombination aus Schnittstelle/Endpunkt zu überwachen und sobald eine fehlerhafte Transaktion geschrieben wird dementsprechend eine Informations Mail zu senden.

Die Alarmierung wird im Normalfall so gesetzt, dass von der Regelüberwachung geschrieben Regelverletzungen (in Form einer Transaktion) direkt die Alarmierungsmail auslösen. 

__Beispiel__ 

Ausgangslage:

Endpunkt a der Schnitstelle x soll innerhalb von 24 Stunden maximal 3 Transaktionen schreiben (Regel).
Wenn endpunkt a der Schnittstelle x eine fehlerhafte Transaktion schreibt, soll eine Hinweismail gesendet werden (Alarmierung).

Annahme: 	Für den Endpunkt a der Schnittstelle x werden 4 Transaktionen innerhalb von 24 Stunden geschrieben

Resultat: 	Die Regelüberwachung schreibt eine Regelverletzungstransaktion (= eine fehlerhafte Transaktion).
			Die Alarmierung registriert die fehlerhaft Transaktion und löst dementsprechend die infomail aus.
			

