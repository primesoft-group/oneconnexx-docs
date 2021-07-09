---
layout: page
title: Überwachung
permalink: "webclient/de/ueberwachung/"
language: de
---
## Übersicht

Die Kategorie Überwachung besteht aus den drei Ansichten «Übersicht», «Schnittstellen» und «Regeln». Die Hauptaufgabe der Überwachung ist es die Add-Ins zu verwalten, Logisch zu sortieren und die von den Add-Ins geschriebenen Transaktionen übersichtlich darzustellen. Weiter können Regeln zu den Transaktionen definiert werden.
In der Übersicht werden die von den Add-Ins geschriebenen Transaktionen übersichtlich Dargestellt. Sie sind nach Schnittstelle gruppiert und alphabetisch sortiert und innerhalb der Gruppe nach Endpunkt Alphabetisch Sortiert.
Transaktionen werden geschrieben, wenn:  

  * Ein Add-In einen aufgerufenen Vorgang erfolgreich ausgeführt hat.  
  * Ein Add-In einen aufgerufenen Vorgang nicht erfolgreich ausführen konnte.  

Transaktionen ähneln den Logeinträgen, unterscheiden sich aber folgendermassen:  

  * Eine Transaktion wird nur dann Geschrieben, wenn die Hauptfunktion eines Add-In ausgeführt wird, und es wird nur das Endergebnis des Aufrufes geschrieben.  
Eine Transaktion beinhaltet somit nur das Endergebnis eines Aufrufes, während Logeinträge den Ablauf des Aufrufes Festhalten.

Bei Transaktionen welche fehlerhaft sind, wird der Status und der Nachrichtentext in roter Farbe Dargestellt.
Pro Schnittstelle werden maximal die Aktuellsten 20 Transaktionen angezeigt.
Schnittstellen welche Fehlerhafte Transaktionen enthalten werden von Anfang an aufgeklappt

### Aufbau einer Transaktion

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/transaction.png "Aufbau Transaktion")  

#### 1. Schnittstelle  
  Die Schnittstelle stellt die übergeordnete logische Gruppierung dar. Auf gleicher Ebene wird Angezeigt, wie viele Fehlerhafte Transaktionen vorhanden sind

#### 2. Endpunkt
  Der Endpunkt ist ein Optionaler Parameter welcher in der Add-In Konfiguration definiert werden kann. Er dient ebenfalls zur logischen Strukturierung der Add-Ins/Transaktionen und hat keinen Einfluss auf Funktionalitäten in der Software.
  
#### 3. Zeitstempel
  Der Zeitstempel gibt den Zeitpunkt an, zu welchem die Transaktion geschrieben wurde.
  
#### 4. Status
  Der Status gibt an, ob die Funktion erfolgreich oder fehlerhaft abgeschlossen wurde.
  
#### 5. Nachricht
  Die Nachricht gibt weiter Details über die Geschrieben Transaktion. Bei erfolgreicher Ausführung was ausgeführt wurde, bei nicht erfolgreicher Ausführung, was fehlgeschlagen ist.
  
### Steuerschaltflächen

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/monitoringOverview.PNG "Überwachung Übersicht")

#### 1. Textfilter
  Die Textsuche schränkt die Liste auf Einträge ein, welche einen bestimmten Ausdruck enthalten.
  Im Unterschied zu vielen Textsuchfeldern im OneConnexx besteht hier keine Möglichkeit reguläre Ausdrücke zu verwenden 

#### 2. Alle ausklappen/einklappen
  Mit dem Pfeil nach unten können alle Schnittstellen ausgeklappt werden.
  mit dem Pfeil nach oben können alle Schnittstellen eingeklappt werden.
  
#### 3. Nur Fehler anzeigen
  Zeigt nur die Fehlerhaften Transaktionen an. Schnittstellen welche keine Fehlerhafte Transaktionen enthalten werden automatisch ausgeblendet
  
#### 4. Transaktion löschen
  Mit dieser Schaltfläche kann eine Transaktion gelöscht werden. Es öffnet sich ein Dialog mit der Aufforderung zur Bestätigung des Löschens. Ein Klick auf die Schaltfläche «Löschen» führt den Befehl zum Löschen aus. Ein Klick auf die Schaltfläche Abbrechen führt wieder zurück auf die Übersichtseite
  
#### 5. Verlauf der Schnittstelle laden
  Mit dieser Schaltfläche kann der Verlauf aller Transaktionen einer Schnittstellen/Endpunkt Kombination geladen werden. Es werden jeweils die 25 nächsten Einträge geladen. Über eine Weitere erscheinende Schaltfläche können die nächsten 25 Geladen werden. Werden nicht mehr als 25 Datensätze in der Datenbank gefunden, dann wird auch die Schaltfläche zum mehr laden nicht mehr angezeigt.
  
## Schnittstellenkonfiguration
In der Ansicht «Schnittstellen» können die Schnittstellen konfiguriert werden. Eine Schnittstelle dient dazu, die konfigurierten Add-In Instanzen zu Ordnen und Gruppieren.

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/interfaceConfiguration.PNG "Schnittstellenkonfiguration")

In der Linken Ansicht befinden sich die Schnittstellen und die zugeordneten Add-Ins, in der rechten die konfigurierten Add-Ins welche keiner Schnittstelle zugeordnet sind

#### 1. Textsuche
Die Textsuche schränkt die Liste auf Einträge ein, welche einen bestimmten Ausdruck enthalten.
Im Unterschied zu vielen Textsuchfeldern im OneConnexx besteht hier keine Möglichkeit Regulären Ausdrücke zu verwenden 

#### 2. Steuerschaltflächen
Mit den Konfigurationsschaltflächen können die Schnittstellen verwaltet und konfiguriert werden

* Mit dem Symbol links kann eine Schnittstelle gelöscht werden. Eine Schnittstelle kann nur gelöscht werden, wenn keine Transaktionen oder Regeln dazu vorhanden sind. Die Untergeordneten Add-Ins werden automatisch wieder in die rechte Ansicht verschoben.  
* Mit dem Symbol in der Mitte kann der Name einer Schnittstelle bearbeitet werden.  
* Mit dem Symbol rechts kann eine neue Schnittstelle hinzugefügt werden.

Die Add-Ins können ganz einfach per Drag and Drop von der Rechten Ansicht in die linke gezogen und so den Schnittstellen zugeordnet und beliebig verschoben werden.  

* Einer Schnittstelle können beliebig viele Add-Ins hinzugefügt werden  
* Einer Schnittstelle kann keine weitere Schnittstelle untergeordnet sein.  
* Add-Ins können nur Schnittstellen untergeordnet sein, ein Add-In als Unterelement eines Add-In ist nicht möglich.  

## Regeln
In der Ansicht «Regeln» können Regeln für die Transaktionen einer Schnittstelle konfiguriert werden. Diese Regeln dienen nicht dazu, fehlerhafte Transaktionen zu überwachen, sondern zu überprüfen ob eine Schnittstellen/Endpunkt Kombination eine gewisse Anzahl __erfolgreicher Transaktionen__ in einem definierten Zeitraum schreibt.
Wird dieser Regel nicht erfüllt, so wird eine fehlerhafte Transaktion auf den Endpunkt geschrieben, welchem die Regel zugeordnet ist.
Diese Transaktion kann entweder einfach so belassen werden, wird aber im Normalfall mit der Alarmierung verbunden. In der Alarmierung kann eine Überwachung auf eine Schnittstellen/Endpunkt Kombination gesetzt werden, welche bei einer fehlerhaften Transaktion eine Hinweismail auslöst. Mehr dazu unter "Alarmierung"

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/rulesOverview.png "Regeln")

#### 1. Textsuche  
Die Textsuche schränkt die Liste auf Einträge ein, welche einen bestimmten Ausdruck enthalten.
Im Unterschied zu vielen Textsuchfeldern im OneConnexx besteht hier keine Möglichkeit Regulären Ausdrücke zu verwenden 

#### 2. Filtern
Hat die Checkbox Inaktiv kein Häkchen, werden nur die aktiven Regeln angezeigt.
Das Gegenteil passiert, wenn die Checkbox Aktiv kein Häkchen hat.

#### 3. Sortierung  
Über diese Schaltfläche kann die Sortierung geändert werden. Entweder A-Z oder Z-A. Diese Schaltfläche ist bei jeder Spalte vorhanden.

#### 4. Export
Alle Regeln werden exportiert beim Klick auf diese Schaltfläche.

#### 5. Regel hinzufügen  
Beim Klick auf diese Schaltfläche öffnet sich folgender Dialog:  

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/addNewMonitoringRule.png "Neue Regel hinzufügen")  

### Aufbau der Regel:  
Eine Regel setzt sich wie folgt zusammen: 

__1:__ Eine Regel hat einen Namen, eine Schnittstelle und einen Endpunkt für welchen die Regel angewendet wird.

__2:__ Sie enthält einen Limit-Modus (maximale oder minimale Obergrenze).

__3:__ Die Anzahl Transaktionen in einem gewissen Zeitraum kann ebenfalls mitgegeben werden.

Diese Felder ergeben zusammen die Regel (zum Beispiel: Maximal 1 Transaktion in den letzten 24 Stunden), welche auf die angegebene Schnittstelle und den Endpunkt angewendet wird.

__4:__ Eine Regel wird täglich einmal zur Ausführzeit evaluiert, welche auf die Minute genau angegeben werden kann. 

__5:__ Das Wiederholen nach Feld gibt an, nach wie vielen Stunden die Regel erneut evaluiert wird.

__6:__ An welchen Wochentagen die Regel evaluiert wird, kann auch mitgegeben werden.

__7:__ Im Feld Tage des Monats kann angebenen werden, an welchen Tagen im Monat die Regel evaluiert wird.

Zum Beispiel: Die Regel wird am ersten, dritten und fünften bis zehnten Tag des Monats evaluiert.

#### 6. Regel löschen/bearbeiten  
Mit einem Klick auf die linke Schaltfläche kann eine Regel bearbeitet werden.
Mit einem Klick auf die rechte Schaltfläche kann eine Regel gelöscht werden
