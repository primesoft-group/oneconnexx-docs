---
layout: page
title: "Function: DocumentParameter"
subtitle: Daten im Dokument als Inhalte abbilden
permalink: "connect/de/functions/documentparameter/"
---

Daten sollen in ein Dokument projiziert werden können. Für diesen Anwendungsfall werden die Daten an eine Dokumentfunktion übergeben, die Daten in das Dokument einbaut. Je nach Dokumentfunktionstyp kann eine andere Mechanik verwendet werden. Zum Beispiel werden Daten über Dokumentparameter über CustomControls und CustomXML Parts gebindet.

{% include alert.html type="warning" text="Durch eine Begrenzung durch Microsoft Office ist die maximale Länge der Keys auf <b>64 Zeichen</b> limitiert." %}

## DocumentParameter

Folgendes Script erstellt ein Dokument und füllt es mit den endsprechenden Dokumentparametern ab.

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
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
```
