---
layout: page
title: Konfiguration
permalink: "webclient/de/konfiguration/"
---

Die Konfigurationsseite bietet ein Übersicht über alle konfigurierten Addin Instanzen und deren Details 


![x]({{ site.baseurl }}/assets/content-images/webclient/de/addinoverview.png "Addin Overview")

### 1. OneConnexx Verwalten
  * Einstellungen neu laden  
  
  Wird diese Schaltfläche angewählt, dann werden alle Einstellungen neu aus dem Service oder der Datenbank geladen
  
  * Im Service speichern
  Die getätigten Änderungen werden automatisch der Warteschlange hinzugefügt. Um diese Änderung dann zu speichern muss man diese Schaltfläche anwählen. Wenn eine Datenbank hinterlegt ist, werden die Einstellungen mit der Datenbank Synchronisiert. 
  
  * Cache löschen  
  Wird diese Schaltfläche angewählt, werden alle im Cache gespeicherten Daten (ungespeicherte Einstellungen und Konfigurationen) gelöscht.
  
  * Instanz hinzufügen  
  Über diese Schaltfläche kann eine neue Instanz konfiguriert werden. __Dabei muss beachtet werden, dass keine Instanz erstellt werden kann, wenn keine Gruppe konfiguriert ist__. Befor eine Instanz erstellt werden kann, muss der Typ ausgewählt werden. Dazu öffnet sich der untenstehende Dialog;
  <br /><br />
  ![X]({{ site.baseurl}}/assets/content-images/webclient/de/addnewinstance.png "Add new Instance")<br />
  <br />
  Per Mausklick oder mit Shift und Enter kann der gewünschte Addintyp ausgewählt werden. Erst wenn dies getan ist, kann der Name gesetzt werden.
  <br /><br />
  ![X]({{ site.baseurl}}/assets/content-images/webclient/de/nameinstance.png "Name new Instance")
  <br /><br />
  Standardmässig enthält der Name der Instanz das Präfix __Instanztyp_.__ Dieses Präfix muss nicht zwingend im Namen gelassen werden, es ist jedoch empfehlenswert da sich so der AddIntyp direkt aus dem Namen der Instanz ablesen lässt. Mit einem Klick auf "Erstellen" wird die Instanz erstellt und das Konfigurationsfenster befüllt sich mit den Instanzdetails, den Parametern und den
  Abonnenten/Abonnierten Ereignissen (2, 4 und 5). Ein Instanzname muss __eindeutig__ sein.
  
  * Neue Guppe erstellen  
  Über diese Schaltfläche kann eine neue Gruppe erstellt werden. __Wenn keine Grupper vorhanden ist, kann auch keine Instanz konfiguriert werden__.
  
### 2. Instanz Details
  Die Detailansicht der verschiedenen Instanzen unterscheidet sich leicht. Die obige Ansicht erscheint wenn eine Instanz eines Event Addins ausgewählt wurde. Bei einem Logik Addin würde diese folgendermassen Aussehen:
  <br /><br />
  ![X]({{ site.baseurl }}/assets/content-images/webclient/de/detailviewlogicaddin.png "Instanz Detail Logik Addin")
  <br /><br />
  Neu hinzugekommen ist der Button "Logik starten mit Parametern".
  
  * Name  
  Über dieses Eingabefeld kann der Name ganz einfach bearbeitet werden.
  
  * Addin  
  Der Typ des AddIns.
  
  * Dateipfad  
  Der Pfad, in welchem Verzeichnis des Hosts die Addindaten liegen.
  
  * Aktiv  
  Checkbox ob die Instanz aktiv sein soll oder nicht. Ist sie nicht aktiv wird bei einem Aufruf des Addins nichts gemacht. Nur wenn es manuell ausgeführt wird, wird das Addin auch ausgeführt wenn es nicht aktiv ist.
  
  * Buttons  
    * Instanz kopieren  
	Kopiert die aktuelle ausgewählte Instanz.
	* Instanz löschen  
	Löscht die aktuell ausgewählte Instanz. __Logeinträge und Transaktionen werden nicht gelöscht.__
	* Logik starten/Event auslösen  
	Lösst den Event aus/startet die Logik.
	* Logik starten mit Parametern  
	Der Button "Logik starten mit Parametern" ist nur bei Logik Addins vorhanden. Mit diesem Button kann eine Logik (welche z.B. von einer anderen Instanz ausgelöst werden soll und von dieser auch Parameter übergeben bekommt) mit Parametern gestartet werden. Die Eingabe erfolgt dabei über zwei Eingabefelder pro Parameter; Name und Wert.
	<br /><br />
	![X]({{ site.baseurl }}/assets/content-images/webclient/de/startlogicwithparams.png "Logik Starten mit Parametern")
	
### 3. Instanzen Übersicht.
  Bei der Instanzansicht können zwei Ansichten ausgewählt werden;
  
  * Ordnung nach Gruppe  
  ![X]({{ site.baseurl}}/assets/content-images/webclient/de/instancegroupbygroup.png "Grupieren nach Gruppen")
  <br /><br />
  Sind die Instanzen nicht nach Gruppen geordnet, so kann auch keine neue Gruppe erstellt werden, die Schaltfläche dafür ist in dieser Ansicht ausgeblendet.
  * Ordnung nach AddIntyp  
  ![X]({{ site.baseurl}}/assets/content-images/webclient/de/groupbyaddintype.png "Gupieren nach AddIntype")
  
### 4. Instanzparameter
  Bei den Instanzparametern gibt es zwei verschieden: die optionalen und die zwingenden.
  Im obigen Beispiel ist z.B. der Parameter "interval" zwingend. Zu erkennen ist dies an der roten Umrandung. Ohne diese Parameter kann die Instanz nicht ausgeführt werden.
  Die Optionalen sind nicht zwingend für das Ausführen der Instanz.
  
  Die Parameter unterscheiden sich von Addin zu Addin

### 5. Addins miteinander verbinden
  
  AddIns können miteinander verbunden werden. Dazu gibt es folgende Grundsätze:
  
  * Ein LogikAddIn kann mit einem oder mehreren anderen LogikAddIn verbunden werden
  * Ein LogikAddIn kann mit einem oder mehreren EventAddIn verbunden werden 
  * Ein EventAddIn kann __nicht__ mit einem anderen EventAddIn verbunden werden
  
  Die Ansicht "Abonnierte Ereignisse" erscheint aufgrund des dritten Grundsatzes nur bei LogikAddins.

  ![X]({{ site.baseurl}}/assets/content-images/webclient/de/abonnieren.png "Ereignisse Abonnieren")
  
  Mit einem Klick auf das grüne Plus kann ein neues abonniertes Ereignis hinzugefügt werden. 
  Abonniert eine Instanz eine andere Instanz/Ereignis, dann wird sobald das abonnierte Ereignis ausgelöst wurde, die abonnierende Instanz ausgelöst.