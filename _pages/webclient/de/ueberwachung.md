---
layout: page
title: Überwachung
permalink: "webclient/de/ueberwachung/"
---

Die Kategorie Überwachung besteht aus den drei Ansichten «Übersicht», «Schnittstellen» und «Regeln». Die Hauptaufgabe der Überwachung ist es die AddIns zu verwalten, Logisch zu sortieren und die von den AddIns geschriebenen Transaktionen übersichtlich darzustellen. Weiter können Regeln zu den Transaktionen definiert werden.
In der Übersicht werden die von den AddIns geschriebenen Transaktionen übersichtlich Dargestellt. Sie sind nach Schnittstelle gruppiert und alphabetisch sortiert und innerhalb der Gruppe nach Endpunkt Alphabetisch Sortiert.
Transaktionen werden geschrieben, wenn:  

  * Ein AddIn einen aufgerufenen Vorgang erfolgreich ausgeführt hat.  
  * Ein AddIn einen aufgerufenen Vorgang nicht erfolgreich ausführen konnte.  

Transaktionen ähneln den Logeinträgen, unterscheiden sich aber folgendermassen:  

  * Eine Transaktion wird nur dann Geschrieben, wenn die Hauptfunktion eines AddIn ausgeführt wird, und es wird nur das Endergebnis des Aufrufes geschrieben.  
Eine Transaktion beinhaltet somit nur das Endergebnis eines Aufrufes, während Logeinträge den Ablauf des Aufrufes Festhalten

Bei Transaktionen welche fehlerhaft sind, wird der Status und der Nachrichtentext in roter Farbe Dargestellt.
Pro Schnittstelle werden maximal die Aktuellsten 20 Transaktionen angezeigt.
Schnittstellen welche Fehlerhafte Transaktionen enthalten werden von Anfang an Aufgeklappt

## __Übersicht__

__Aufbau einer Transaktion__

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/transaction.png "Aufbau Transaktion")  

### 1. Schnitstelle  
  Die Schnittstelle stellt die übergeordnete logische Gruppierung dar. Auf gleicher Ebene wird Angezeigt, wie viele Fehlerhafte Transaktionen vorhanden sind

### 2. Endpunkt
  Der Endpunkt ist ein Optionaler Parameter welcher in der AddIn-Konfiguration definiert werden kann. Er dient ebenfalls zur logischen Strukturierung der AddIns/Transaktionen und hat keinen Einfluss auf Funktionalitäten in der Software.
  
### 3. Zeitstempel
  Der Zeitstempel gibt den Zeitpunkt an, zu welchem die Transaktion geschrieben wurde.
  
### 4. Status
  Der Status gibt an, ob die Funktion erfolgreich oder fehlerhaft abgeschlossen wurde.
  
### 5. Nachricht
  Die Nachricht gibt weiter Details über die Geschrieben Transaktion. Bei erfolgreicher Ausführung was ausgeführt wurde, bei nicht erfolgreicher Ausführung, was fehlgeschlagen ist.
  
  
![X]({{ site.baseUrl }}/assets/content-images/webclient/de/monitoringoverview.png "Überwachung Übersicht")  
## __Schnitstellenkonfiguration__

## __Regeln__