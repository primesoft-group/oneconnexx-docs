---
layout: page
title: Konfiguration
permalink: "webclient/de/konfiguration/"
---

## in Progress

	
	## Überblick {% include anchor.html name="overview" %}
	
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


