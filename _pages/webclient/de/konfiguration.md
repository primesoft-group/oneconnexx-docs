---
layout: page
title: Konfiguration
permalink: "webclient/de/konfiguration/"
---

Die Konfigurationsseite bietet ein Übersicht über alle konfigurierten Addin Instanzen und deren Details 


![x]({{ site.baseurl }}/assets/content-images/webclient/de/addinoverview.png "Addin Overview")

### 1. OneConnexx Verwalten

  * __Einstellungen neu laden__  
  Wird diese Schaltfläche angewählt, dann werden alle Einstellungen neu aus dem Service oder der Datenbank geladen
	
  * __Im Service Speichern__  
  Die getätigten änderungen werden automatisch der Warteschlange hinzugefügt. Um diese Änderung dann zu speichern muss man diese Schaltfläche anwählen. Wenn eine Datenbank hinterlegt ist, werden die Einstellungen mit der Datenbank Synchronisiert. 
  
  * __Cache Löschen__  
  Wird diese Schaltfläche angewählt, werden alle im Cache gespeicherten Daten (Ungespeicherte Einstellungen und Konfigurationen) gelöscht.
  
  * __Instanz Hinzufügen__  
  Über diese Schaltfläche kann eine neue Instanz konfiguriert werden. Dabei muss beachtet werden, dass keine Instanz erstellt werden kann, wenn keine Gruppe konfiguriert ist. Befor eine Instanz erstellt werden kann, muss der Typ ausgewählt werden. Dazu öffnet sich der untenstehende Dialog;
  <br /><br />
  ![X]({{ site.baseurl}}/assets/content-images/webclient/de/addnewinstance.png "Add new Instance")<br />
  <br />
  Per Mausklick oder mit Shift und Enter kann der gewünschte Addintyp ausgewählt werden. Erst wenn dies getan ist, kann der Name gesetzt werden.
  <br /><br />
  ![X]({{ site.baseurl}}/assets/content-images/webclient/de/nameinstance.png "Name new Instance")
  <br /><br />
  Standardmässig enthält der Name der Instanz das Präfix Instanztyp_. Dieses Präfix muss nicht zwingend im Namen gelassen werden, es ist jedoch empfehlenswert da sich so der AddIntyp direkt aus dem Namen der Instanz ablesen lässt. Mit einem Klick auf "Erstellen" wird die Instanz erstellt und das Konfigurationsfenster befüllt sich mit den Instanzdetails, den Parametern und den
  Abonnenten/Abonnierten Ereignissen (2, 4 und 5). Ein Instanzname muss __eindeutig__ sein.
  
  * __Neue Guppe erstellen__  
  Über diese Schaltfläche kann eine neue Gruppe erstellt werden
  
### 2. Instanz Details
  Die Detailansicht der Instanzen unterscheidet sich leicht. Die obige Ansicht erscheint wenn eine Instanz eines Event Addins ausgewählt wurde. Bei einem Logik Addin würde diese folgendermassen Aussehen:
  <br /><br />
  ![X]({{ site.baseurl }}/assets/content-images/webclient/de/detailviewlogicaddin.png "Instanz Detail Logik Addin")
  <br /><br />
  Neu hinzugekommen ist der Button "Logik Starten mit Parametern".
  
  * __Name__  
  Über dieses Eingabefeld kann der Name ganz einfach bearbeitet werden.
  
  * __Addin__  
  Der Typ des AddIns.
  
  * __Dateipfad__  
  Der Pfad, in welchem Verzeichnis des Hosts die Addindaten liegen.
  
  * __Aktiv__  
  Checkbox ob die Instanz aktiv sein soll oder nicht. Ist sie nicht aktiv wird bei einem Aufruf des Addins nichts gemacht. Nur wenn es manuell ausgeführt wird, wird das Addin auch ausgeführt wenn es nicht aktiv ist.
  
  * __Buttons__  
    * __Instanz kopieren__  
	Kopiert die aktuelle ausgewählte Instanz.
	* __Instanz löschen__  
	Löscht die aktuell ausgewählte Instanz. __Log Einträge und Transaktionen werden nicht gelöscht.__
	* __Logik starten/Event auslösen__  
	Lösst den Event aus/startet die Logik.
	* __Logik starten mit Parametern__  
	Der Button "Logik starten mit Parametern" ist nur bei Logik Addins vorhanden. Mit diesem Button kann eine Logik (welche z.B. von einer anderen Instanz ausgelöst werden soll und von diesem auch Parameter übergeben bekommt) mit Parametern gestartet werden. Die Eingabe erfolgt dabei über zwei Eingabefelder pro Parameter; Name und Wert.
	<br /><br />
	![X]({{ site.baseurl }}/assets/content-images/webclient/de/startlogicwithparams.png "Logik Starten mit Parametern")
	
### 3. Instanzen Übersicht.
  Bei der Instanzansicht können zwei Ansichten ausgewählt werden;
  
  * __Ordnung nach Gruppe__  
  ![X]({{ site.baseurl}}/assets/content-images/webclient/de/instancegroupbygroup.png "Grupieren nach Gruppen")
  <br /><br />
  Sind die Instanzen nicht nach Gruppen geordnet, so kann auch keine neue Gruppe erstellt werden.
  * __Ordnung nach AddIntyp__  
  ![X]({{ site.baseurl}}/assets/content-images/webclient/de/groupbyaddintype.png "Gupieren nach AddIntype")
  
### 4. Instanzparameter
  Bei den Instanzparametern gibt es zwei verschieden: die optionalen und die zwingenden.
  Im obigen Beispiel ist z.B. der Parameter "interval" zwingend. Zu erkennen ist dies an der roten Umrandung. Ohne diese Parameter kann die Instanz nicht ausgeführt werden.
  Die Optionalen sind nicht zwingend für das Ausführen der Instanz.

  ### 5. Addins miteinander verbinden
  
  AddIns können miteinander verbunden werden. Dazu gibt es folgende Grundsätze:
  
  * Ein LogikAddIn kann mit einem oder mehreren anderen LogikAddIn verbunden werden
  * Ein LogikAddIn kann mit einem oder mehreren EventAddIn verbunden werden 
  * Ein EventAddIn kann nicht mit einem anderen EventAddIn verbunden werden

  ![X]({{ site.baseurl}}/assets/content-images/webclient/de/abonnieren.png)