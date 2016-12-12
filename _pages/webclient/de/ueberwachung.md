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

### Aufbau einer Transaktion

  1. __Schnitstelle  
  
  2. __Endpunkt__
  
  3. __Zeitstempel__
  
  4. __Status__
  
  5. __Nachricht__
  
## __Schnitstellenkonfiguration__

## __Regeln__