---
layout: page
title: Alarmierung
permalink: "webclient/de/alarmierung/"
---
## Übersicht
Die Alarmierung wird im Normalfall so gesetzt, dass von der Regelüberwachung geschrieben Regelverletzungen (in Form einer Transaktion) direkt die Alarmierungsmail auslösen. 

__Beispiel__ 

Ausgangslage:

Endpunkt a der Schnitstelle x soll innerhalb von 24 Stunden maximal 3 Transaktionen schreiben (Regel).
Wenn endpunkt a der Schnittstelle x eine fehlerhafte Transaktion schreibt, soll eine Hinweismail gesendet werden (Alarmierung).

Annahme:

Für den Endpunkt a der Schnittstelle x werden 4 Transaktionen innerhalb von 24 Stunden geschrieben

Resultat:

Die Regelüberwachung schreibt eine Regelverletzungstransaktion (= eine fehlerhafte Transaktion).
Die Alarmierung registriert die fehlerhaft Transaktion und löst dementsprechend die infomail aus.

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/alerting.png "Übersicht Regeln")  

### 1. Textsuche  
Die Textsuche schränkt die Liste auf Einträge ein, welche einen bestimmten Ausdruck enthalten.
Im Unterschied zu vielen Textsuchfeldern im OneConnexx besteht hier keine Möglichkeit Regulären Ausdrücke zu verwenden 


### 2. Sortierung  
Über diese Schaltfläche kann die Sortierung geändert werden. Entweder A-Z oder Z-A. Diese Schaltfläche ist bei jeder Spalte vorhanden.

### 3. Alarmierung hinzufügen  
Beim Klick auf diese Schaltfläche öffnet sich folgender Dialog:  

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/addNewAlerting.png "Neue Regel hinzufügen")  

### 4. Alarmierung löschen/bearbeiten  
Mit einem Klick auf die linke Schaltfläche kann eine Alarmierung bearbeitet werden.
Mit einem Klick auf die rechte Schaltfläche kann eine Alarmierung gelöscht werden


Die Alarmierung hängt eng mit den Regeln aus dem Bereich "Überwachung" zusammen.
Die Hauptaufgabe der Alarmierung ist es, eine angegebene Kombination aus Schnittstelle/Endpunkt zu überwachen und sobald eine fehlerhafte Transaktion geschrieben wird dementsprechend eine Informations Mail zu senden.


			

