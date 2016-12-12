---
layout: page
title: Überwachung
permalink: "webclient/de/ueberwachung/"
---
## __Übersicht__

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

### __Aufbau einer Transaktion__

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/transaction.png "Aufbau Transaktion")  

### 1. Schnittstelle  
  Die Schnittstelle stellt die übergeordnete logische Gruppierung dar. Auf gleicher Ebene wird Angezeigt, wie viele Fehlerhafte Transaktionen vorhanden sind

### 2. Endpunkt
  Der Endpunkt ist ein Optionaler Parameter welcher in der AddIn-Konfiguration definiert werden kann. Er dient ebenfalls zur logischen Strukturierung der AddIns/Transaktionen und hat keinen Einfluss auf Funktionalitäten in der Software.
  
### 3. Zeitstempel
  Der Zeitstempel gibt den Zeitpunkt an, zu welchem die Transaktion geschrieben wurde.
  
### 4. Status
  Der Status gibt an, ob die Funktion erfolgreich oder fehlerhaft abgeschlossen wurde.
  
### 5. Nachricht
  Die Nachricht gibt weiter Details über die Geschrieben Transaktion. Bei erfolgreicher Ausführung was ausgeführt wurde, bei nicht erfolgreicher Ausführung, was fehlgeschlagen ist.
  
### __Steuerschaltflächen__

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/monitoringoverview.png "Überwachung Übersicht")

### 1. Textfilter
  Die Textsuche schränkt die Liste auf Einträge ein, welche einen bestimmten Ausdruck enthalten.
  Im Unterschied zu vielen Textsuchfeldern im OneConnexx besteht hier keine Möglichkeit reguläre Ausdrücke zu verwenden 

### 2. Alle ausklappen/einklappen
  Mit dem Plus können alle Schnittstellen ausgeklappt werden.
  mit dem Minus können alle Schnittstellen eingeklappt werden.
  
### 3. Nur Fehler anzeigen
  Zeigt nur die Fehlerhaften Transaktionen an. Schnittstellen welche keine Fehlerhafte Transaktionen enthalten werden automatisch ausgeblendet
  
### 4. Transaktion löschen
  Mit dieser Schaltfläche kann eine Transaktion gelöscht werden. Es öffnet sich ein Dialog mit der Aufforderung zur Bestätigung des Löschens. Ein Klick auf die Schaltfläche «Löschen» führt den Befehl zum Löschen aus. Ein Klick auf die Schaltfläche Abbrechen führt wieder zurück auf die Übersichtseite
  
## __Schnittstellenkonfiguration__
In der Ansicht «Schnittstellen» können die Schnittstellen konfiguriert werden. Eine Schnittstelle dient dazu, die konfigurierten AddIn Instanzen zu Ordnen und Gruppieren.

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/interfaceconfiguration.png "Schnittstellenkonfiguration")

In der Linken Ansicht befinden sich die Schnittstellen und die zugeordneten AddIns, in der rechten die konfigurierten AddIns welche keiner Schnittstelle zugeordnet sind

### 1. Textsuche
Die Textsuche schränkt die Liste auf Einträge ein, welche einen bestimmten Ausdruck enthalten.
Im Unterschied zu vielen Textsuchfeldern im OneConnexx besteht hier keine Möglichkeit Regulären Ausdrücke zu verwenden 

### 2. Steuerschaltflächen
Mit den Konfigurationsschaltflächen können die Schnittstellen verwaltet und konfiguriert werden

Mit dem Symbol links kann eine Schnittstelle gelöscht werden. Eine Schnittstelle kann nur gelöscht werden, wenn keine Transaktionen oder Regeln dazu vorhanden sind. Die Untergeordneten AddIns werden automatisch wieder in die rechte Ansicht verschoben.

Mit dem Symbol in der Mitte kann der Name einer Schnittstelle bearbeitet werden.

Mit dem Symbol rechts kann eine neue Schnittstelle hinzugefügt werden.

Die AddIns können ganz einfach per Drag and Drop von der Rechten Ansicht in die linke gezogen und so den Schnittstellen zugeordnet und beliebig verschoben werden.
* Einer Schnittstelle können beliebig viele AddIns hinzugefügt werden  
* Einer Schnittstelle kann keine weitere Schnittstelle untergeordnet sein.  
* AddIns können nur Schnittstellen untergeordnet sein, ein AddIn als Unterelement eines AddIn ist nicht möglich.  


## __Regeln__