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
  <br />
  ![X]({{ site.baseurl}}/assets/content-images/webclient/de/addnewinstance.png "Add new Instance")<br />
  <br />
  Per Mausklick oder mit shift und Enter kann der gewünschte Addintyp ausgewählt werden. Erst wenn dies getan ist, kann der Name gesetzt werden.
  <br /><br />
  ![X]({{ site.baseurl}}/assets/content-images/webclient/de/nameinstance.png "Name new Instance")
  <br /><br />
  Standardmässig enthält der Name der Instanz das Präfix Instanztyp_. Dieses Präfix muss nicht zwingend im Namen gelassen werden, es ist jedoch empfehlenswert da sich so der AddIntyp direkt aus dem Namen der Instanz ablesen lässt. Mit einem Klick auf "Erstellen" wird die Instanz erstellt und das Konfigurationsfenster befüllt sich mit den Instanzdetails, den Parametern und den
  Abonnenten/Abonnierten Ereignissen (2, 4 und 5). Ein Instanzname muss __eindeutig__ sein.
  
  * __Neue Guppe erstellen__  
  Über diese Schaltfläche kann eine neue Gruppe erstellt werden

## 2. Instanz Details
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
  Checkbox ob die Instanz aktiv sein soll oder nicht.
  
  * __Buttons__  
    *Instanz kopieren
	Kopiert die aktuelle ausgewählte Instanz.
	*Instanz löschen
	Löscht die aktuell ausgewählte Instanz.
	*Logik starten/Event auslösen
	Lösst den Event aus/startet die Logik.
	*Logik tarten mit Parametern

Ein __"OneOffixxConnectBatch"__ umfasst eins oder mehrere __"OneOffixxConnect"__ "Entries". 

Das __"OneOffixxConnectBatch"__ Element kann __"Settings"__ und __"Commands"__ enthalten, welche sich global auf alle "Entries" auswirken bzw. gesonderte Funktionalitäten (wie z.B. das Zusammenfassen von Dokumenten) ermöglichen.

Das __"OneOffixxConnect"__ beschreibt konkret einen Dokumentgenerierungs- bzw. Dokumentänderungsaufruf. Template-Auswahldaten, also welches Template oder welche Sprache, werden über die __"Arguments"__ gesetzt. 
Dokument-Daten können über die verschiedenen Dokumentfunktionen übergeben werden. Die Dokumentfunktionen werden hierbei über die "id" des __"Function"__ Elements identifiziert.

	<OneOffixxConnectBatch>
		<Settings />
		<Commands />
		<Entries>
			<OneOffixxConnect>
				<Arguments />
				<Function id="x" />
				<Function id="y" />
				...
			</OneOffixxConnect>
		</Entries>
	</OneOffixxConnectBatch>

## Namespace {% include anchor.html name="namespace" %}

Der Namespace für OneOffixx Connect lautet 

	http://schema.oneoffixx.com/OneOffixxConnectBatch/1

Wobei die hinterste Nummer der Major-Version entspricht. Die Minor Version steht in Global Settings (Key="Version" Value ="XXX")


## OneOffixx Connect Batch {% include anchor.html name="oneoffixx-connect-batch" %}

![x]({{ site.baseurl }}/assets/content-images/webclient/de/instanzkonfig-mainscreen.png "Schema")

Enthält eine Batch Liste mit OneOffixx Connect Strukturen. Ein OneOffixx Connect entspricht einem OneOffixx Dokument.

## Global Settings {% include anchor.html name="oneoffixx-connect-batch-settings" %}

	//OneOffixxConnectBatch/Settings

Diese Struktur enthält eine Key/Value Liste mit Globalen Settings. Diese Settings werden während der Verarbeitung in die OneOffixx Connect Struktur kopiert.

![x]({{ site.baseurl }}/assets/content-images/connect/de/schema-globalsettings.png "Global Settings")

OneOffixx kennt die folgenden Settings:

```xml
	<?xml version="1.0" encoding="UTF-8"?>
	<OneOffixxConnectBatch xmlns="http://schema.oneoffixx.com/OneOffixxConnectBatch/1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	  <Settings>
		<Add key="KeepConnector">true</Add>
		<Add key="CreateConnectorResult">false</Add>
		<Add key="CreateConnectorResultOnError">true</Add>
	  </Settings>
	  <Entries>
	  …
	  </Entries>
	</OneOffixxConnectBatch>
```

Diese Settings haben die gleiche Funktion wie die [entsprechenden Kommandozeilenparameter]({{ site.baseurl }}/connect/de/usage/#aufruf). Falls angegeben überschreiben sie die Kommandozeilenparameter.

__Hinweis:__ Nur bei der Angabe einer TemplateId wird ein Result-File __nach__ der Generierung erstellt. Wenn das Result_File auch bei Tag angaben gesichert erstellt werden soll, gäbe es die Möglichkeit über den "CreateConnectorResult"-Command zu gehen.


