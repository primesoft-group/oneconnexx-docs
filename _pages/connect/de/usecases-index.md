---
layout: page
title: Anwendungsfälle
permalink: "connect/de/usecases/"
---

Im folgenden werden mögliche Anwendungsfälle gelistet und als Beispiel die minimale XML Konfiguration aufgezeigt.

* [Dokument erstellen]({{ site.baseurl }}/connect/de/usecases/create-document/)
* [Dokument am Zielort speichern]({{ site.baseurl }}/connect/de/usecases/create-document-on-location/)
* [Verbinden von Dokumenten]({{ site.baseurl }}/connect/de/usecases/merge-documents/)
* [Vorlagen filtern]({{ site.baseurl }}/connect/de/usecases/templatepicker/)
* [Dokument aktualisieren]({{ site.baseurl }}/connect/de/usecases/update-existing-documents/)
* [Nachfolgeprozesse starten]({{ site.baseurl }}/connect/de/usecases/after-document-generation/)

Bei jedem Anwendungsfall können natürlich noch die [__verschiedenen Dokumentfunktionen__]({{ site.baseurl }}/connect/de/connect-functions) mit aufgerufen werden.  

## Beispiel Connect

In dem Beispiel soll ein Dokument erstellt werden auf Basis der __TemplateId__ "6bb49520-1ebd-4f68-bb5f-02f46a9e1ec8" und mit der __LanguageLcid__ "2055". Zusätzlich werden zwei Dokumentfunktionen, __DocumentParameter__ & __ProfileData__ mit Daten parametriert.

```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <OneOffixxConnectBatch xmlns="http://schema.oneoffixx.com/OneOffixxConnectBatch/1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    	<Entries>
    		<OneOffixxConnect>
    			<Arguments>
    				<TemplateId>6bb49520-1ebd-4f68-bb5f-02f46a9e1ec8</TemplateId>
    				<LanguageLcid>2055</LanguageLcid>
    			</Arguments>
    			<Function name="DocumentParameter" id="2de8db66-f3d7-456d-bba3-6bb0f12c1fb6">
    				<Settings>
    					<Value key="ShowDialog">false</Value>
    				</Settings>
    				<Arguments>
    					<Value key="DocParam.Subject">#BetreffAusLotusNotes#</Value>
    					<Value key="DocParam.RefNr">M1456-22</Value>
    					<Value key="DocParam.CopyTo">
    						<Line>#KopieAn1#</Line>
    						<Line>#KopieAn2#</Line>
    					</Value>
    					<Value key="DocParam.Attachments">
    						<Line>#Beilage1#</Line>
    						<Line>#Beilage2#</Line>
    					</Value>
    				</Arguments>
    			</Function>
				<Function name="ProfileData" id="5C8B5321-E02D-4A1C-80E3-627D40AEABAF">
    				<Arguments>
    					<Value key="Profile.User.FirstName">Max</Value>
    					<Value key="Profile.User.LastName">Musterman</Value>
    				</Arguments>
    		    </Function>
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
```	
