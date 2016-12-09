---
layout: page
title: Connect Arguments
permalink: "connect/de/connect-arguments/"
subtitle: "//OneOffixxConnectBatch/Entries/OneOffixxConnect/Arguments"
---

Über die Connect Argumente kann die Sprache, das Template bzw. das zu veränderte Dokument genau beschrieben werden.

## LanguageLcid - Sprache definieren {% include anchor.html name="languagelcid" %}

Über __LanguageLcid__ wird die Dokumentsprache für die Verarbeitung gesetzt. Es muss eine genaue LCID angegeben werden - eine Auflistung von allen möglichen LCIDs finden sie [__hier__](https://msdn.microsoft.com/de-ch/goglobal/bb964664.aspx).

Die Sprache hat z.B. Auswirkungen auf die gewählten Textbausteine oder die Funktionsweise von Dokumentfunktionen.

{% include alert.html type="info" text="Bei der Angabe einer TemplateId muss sichergestellt werden, dass dieses Template auch für diese Sprache freigegeben ist. Über TemplateTags gibts es einen indirekten Mechanismus, welcher das richtige Template für die angegebene Sprache sucht." %}

```xml
    <OneOffixxConnectBatch>
    	<Entries>
    		<OneOffixxConnect>
    			<Arguments>
    				...
    				<LanguageLcid>2055</LanguageLcid>
    			</Arguments>
    			...
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
```

## TemplateId - Vorlage definieren {% include anchor.html name="templateid" %}
	
Über die __TemplateId__ wird eine Vorlage für die Dokumenterstellung gewählt. Als Angabe hierfür muss die genaue GUID der Vorlage übergeben werden.

```xml
    <OneOffixxConnectBatch>
    	<Entries>
    		<OneOffixxConnect>
    			<Arguments>
    				...
    				<TemplateId>6bb49520-1ebd-4f68-bb5f-02f46a9e1ec8</TemplateId>
    			</Arguments>
    			...
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
``` 

## TemplateTags - Vorlage definieren {% include anchor.html name="templatetags" %}
	
Anstelle der ID der zu öffnenden Vorlage können über __TemplateFilter__ Filterkriterien angegeben werden. In dem TemplateFilter können Tags angegeben werden:

```xml
    <OneOffixxConnectBatch>
    	<Entries>
    		<OneOffixxConnect>
    			<Arguments>
    				<TemplateFilter>
    					<Tag>Tag1</Tag>
    					<Tag>Tag2;Tag3;Tag4</Tag>
    				</TemplateFilter>
    			</Arguments>
    			...
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
``` 

AND-Verknüpfungen werden innerhalb eines Tag-Elements durch Semikolons getrennt definiert, OR-Verknüpfungen durch mehrere Tag-Elemente. 
Das obige Beispiel zeigt alle Vorlagen, welche mit Tag1 oder Tag2, Tag3 und Tag4 markiert sind. 
Gibt es mehrere Vorlagen, welche den Filterkriterien entsprechen, öffnet sich ein Auswahldialog, auf dem der Benutzer die gewünschte Vorlage auswählen kann:

![x]({{ site.baseurl }}/assets/content-images/connect/de/templatepicker.png "TemplatePicker")

<span class="label label-info">NEU ab 2.3.40160</span>

Ab __Version 2.3.40160__ können die TemplateTags auch serverseitig genutzt werden. Falls es mehrere Vorlagen gibt, welche dem Filterkriterium entsprechen, wird stets der erste Eintrag genommen. Die Reihenfolge ist hierbei nicht garantiert!

## DocumentLocation - Bestehendes Dokument {% include anchor.html name="documentlocation" %}

Über die __DocumentLocation__ können [bestehende Dokumente aktualisiert]({{ site.baseurl }}/connect/de/usecases/update-existing-documents/) werden oder [zwei bestehende Dokumente verbunden]({{ site.baseurl }}/connect/de/usecases/merge-documents/) werden. 

{% include alert.html type="info" text="Für den vollen Funktionsumfang müssen die Dokumente von OneOffixx generiert wurden sein." %}

```xml
    <OneOffixxConnectBatch>
    	<Entries>
    		<OneOffixxConnect>
    			<Arguments>
    				<DocumentLocation>c:\Temp\Doc1.docx</DocumentLocation>
    			</Arguments>
    			...
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
``` 

## ProfileId - Profilwahl {% include anchor.html name="profileid" %}

Es kann einen explizites Profil über das __ProfileId__-Element angegeben werden. Hierfür wird entweder die __GUID des Profiles__ oder der __Profil Name__ benötigt. Ohne Angabe eines expliziten Profiles wird das aktuelle Profile vom OneOffixx Client genommen bzw. auf Serverseite das erste Profil des jeweiligen Users. 

```xml
    <OneOffixxConnectBatch>
    	<Entries>
    		<OneOffixxConnect>
    			<Arguments>
    				<ProfileId>25558547-a6fb-4fad-908b-63118dcee5c9</ProfileId>
    			</Arguments>
    			...
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
``` 

Oder über den Namen:

```xml
    <OneOffixxConnectBatch>
    	<Entries>
    		<OneOffixxConnect>
    			<Arguments>
    				<ProfileId>Profil Name</ProfileId>
    			</Arguments>
    			...
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
``` 

## Profile - OrganizationId - Profilwahl {% include anchor.html name="profile" %}

<span class="label label-info">NEU ab 2.3.40160</span>

Diese Option erlaubt es, eine beliebig (freigegebene) Organisation in der  [__ProfileData-Dokumentfunktion__]({{ site.baseurl }}/connect/de/functions/profiledata/) zu nutzen.
Wird die angegebene Organisation gefunden, werden diese Organisationsdaten im Profil für den Aufruf genutzt. 

Die Organisation kann hierbei über die interne ID gesucht werden:

```xml
    <OneOffixxConnectBatch>
    	<Entries>
    		<OneOffixxConnect>
    			<Arguments>
    				<Profile>
					<OrganizationId>25558547-a6fb-4fad-908b-63118dcee5c9</OrganizationId>
				</Profile>
    			</Arguments>
    			...
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
``` 

Oder über eine Abfrage: 

Abfragesyntax:

    { *Feldname* = *Wert* }

Im Feldnamen können alle konfigurierten Felder für Organisationseinheiten genutzt werden. Werden mehrere Organisationen gefunden wird die erste genommen, wobei keine Reihenfolge garantiert ist.

```xml
    <OneOffixxConnectBatch>
    	<Entries>
    		<OneOffixxConnect>
    			<Arguments>
    				<Profile>
					<OrganizationId>{Org.Name = IT}</OrganizationId>
				</Profile>
    			</Arguments>
    			...
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
``` 

