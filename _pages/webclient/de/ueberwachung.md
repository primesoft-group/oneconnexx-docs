---
layout: page
title: Überwachung
permalink: "webclient/de/ueberwachung/"
---
## Übersicht

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

### Aufbau einer Transaktion

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
  
### Steuerschaltflächen

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/monitoringoverview.png "Überwachung Übersicht")

### 1. Textfilter
  Die Textsuche schränkt die Liste auf Einträge ein, welche einen bestimmten Ausdruck enthalten.
  Im Unterschied zu vielen Textsuchfeldern im OneConnexx besteht hier keine Möglichkeit reguläre Ausdrücke zu verwenden 

### 2. Alle ausklappen/einklappen
  Mit dem Pfeil nach unten können alle Schnittstellen ausgeklappt werden.
  mit dem Pfeil nach oben können alle Schnittstellen eingeklappt werden.
  
### 3. Nur Fehler anzeigen
  Zeigt nur die Fehlerhaften Transaktionen an. Schnittstellen welche keine Fehlerhafte Transaktionen enthalten werden automatisch ausgeblendet
  
### 4. Transaktion löschen
  Mit dieser Schaltfläche kann eine Transaktion gelöscht werden. Es öffnet sich ein Dialog mit der Aufforderung zur Bestätigung des Löschens. Ein Klick auf die Schaltfläche «Löschen» führt den Befehl zum Löschen aus. Ein Klick auf die Schaltfläche Abbrechen führt wieder zurück auf die Übersichtseite
  
### 5. Verlauf der Schnittstelle laden
  Mit dieser Schaltfläche kann der Verlauf aller Transaktionen einer Schnittstellen/Endpunkt Kombination geladen werden. Es werden jeweils die 25 nächsten Einträge geladen. Über eine Weitere erscheinende Schaltfläche können die nächsten 25 Geladen werden. Werden nicht mehr als 25 Datensätze in der Datenbank gefunden, dann wird auch die Schaltfläche zum mehr laden nicht mehr angezeigt.
  
## Schnittstellenkonfiguration
In der Ansicht «Schnittstellen» können die Schnittstellen konfiguriert werden. Eine Schnittstelle dient dazu, die konfigurierten AddIn Instanzen zu Ordnen und Gruppieren.

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/interfaceconfiguration.png "Schnittstellenkonfiguration")

In der Linken Ansicht befinden sich die Schnittstellen und die zugeordneten AddIns, in der rechten die konfigurierten AddIns welche keiner Schnittstelle zugeordnet sind

### 1. Textsuche
Die Textsuche schränkt die Liste auf Einträge ein, welche einen bestimmten Ausdruck enthalten.
Im Unterschied zu vielen Textsuchfeldern im OneConnexx besteht hier keine Möglichkeit Regulären Ausdrücke zu verwenden 

### 2. Steuerschaltflächen
Mit den Konfigurationsschaltflächen können die Schnittstellen verwaltet und konfiguriert werden

* Mit dem Symbol links kann eine Schnittstelle gelöscht werden. Eine Schnittstelle kann nur gelöscht werden, wenn keine Transaktionen oder Regeln dazu vorhanden sind. Die Untergeordneten AddIns werden automatisch wieder in die rechte Ansicht verschoben.  
* Mit dem Symbol in der Mitte kann der Name einer Schnittstelle bearbeitet werden.  
* Mit dem Symbol rechts kann eine neue Schnittstelle hinzugefügt werden.

Die AddIns können ganz einfach per Drag and Drop von der Rechten Ansicht in die linke gezogen und so den Schnittstellen zugeordnet und beliebig verschoben werden.  

* Einer Schnittstelle können beliebig viele AddIns hinzugefügt werden  
* Einer Schnittstelle kann keine weitere Schnittstelle untergeordnet sein.  
* AddIns können nur Schnittstellen untergeordnet sein, ein AddIn als Unterelement eines AddIn ist nicht möglich.  

## Regeln
In der Ansicht «Regeln» können Regeln für die Transaktionen einer Schnittstelle konfiguriert werden. Diese Regeln dienen nicht dazu, fehlerhafte Transaktionen zu überwachen, sondern zu überprüfen ob eine Schnittstellen/Endpunkt Kombination eine gewisse Anzahl __erfolgreicher Transaktionen__ in einem definierten Zeitraum schreibt.
Wird dieser Regel nicht erfüllt, so wird eine fehlerhafte Transaktion auf den Endpunkt geschrieben, welchem die Regel zugeordnet ist.
Diese Transaktion kann entweder einfach so belassen werden, wird aber im Normalfall mit der Alarmierung verbunden. In der Alarmierung kann eine Überwachung auf eine Schnittstellen/Endpunkt Kombination gesetzt werden, welche bei einer fehlerhaften Transaktion eine Hinweismail auslöst. Mehr dazu unter "Alarmierung"

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/ruleOverView.png "Regeln")

### 1. Textsuche  
Die Textsuche schränkt die Liste auf Einträge ein, welche einen bestimmten Ausdruck enthalten.
Im Unterschied zu vielen Textsuchfeldern im OneConnexx besteht hier keine Möglichkeit Regulären Ausdrücke zu verwenden 


### 2. Sortierung  
Über diese Schaltfläche kann die Sortierung geändert werden. Entweder A-Z oder Z-A. Diese Schaltfläche ist bei jeder Spalte vorhanden.

### 3. Regel hinzufügen  
Beim Klick auf diese Schaltfläche öffnet sich folgender Dialog:  

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/addNewRule.png "Neue Regel hinzufügen")  

### Aufbau der Regel:  
Eine Regel setzt sich wie folgt zusammen: 
Eine Regel hat einen Namen, eine Schnittstelle und einen Endpunkt für welchen die Regel angewendet wird.
Weiter enthält sie die Felder Limit-Modus (1) (maximale oder minimale Obergrenze), Anzahl Transaktionen (2) und betrachteter Zeitraum (3). Diese Felder ergeben zusammen die Regel (zum Beispiel: Maximal 4 Transaktionen in den letzten 6 Stunden), welche auf die angegebene Schnittstelle und den Endpunkt angewendet wird.
Eine Regel wird täglich einmal zur Ausführzeit (4) evaluiert, welche auf die Minute genau angegeben werden kann. Das Wiederholen nach (5) Feld gibt an, nach wie vielen Stunden die Regel erneut evaluiert wird.

### 4. Regel löschen/bearbeiten  
Mit einem Klick auf die linke Schaltfläche kann eine Regel bearbeitet werden.
Mit einem Klick auf die rechte Schaltfläche kann eine Regel gelöscht werden


