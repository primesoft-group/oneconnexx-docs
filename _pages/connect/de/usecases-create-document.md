---
layout: page
title: Anwendungsfälle
subtitle: Dokument erstellen
permalink: "connect/de/usecases/create-document/"
---

Basierende auf einer Vorlage soll ein neues Dokument in einer definierten Dokumentensprache erstellt werden und in Abhängigkeit des Vorlagentyps soll der entsprechende Editor automatisch gestartet werden. 
 
```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <OneOffixxConnectBatch xmlns="http://schema.oneoffixx.com/OneOffixxConnectBatch/1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    	<Entries>
    		<OneOffixxConnect>
    			<Arguments>
    				<TemplateId>6bb49520-1ebd-4f68-bb5f-02f46a9e1ec8</TemplateId>
    				<LanguageLcid>2055</LanguageLcid>
    			</Arguments>
    			<Commands>
    				<Command Name="DefaultProcess">
    					<Parameters>
    						<Add key="Start">true</Add>
    						<Add key="Verb">new</Add>
    					</Parameters>
    				</Command>
    			</Commands>
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
```
 
Der Command DefaultProcess weisst OneOffixx an, den Editor nach der Dokumentgenerierung zu starten. Wird der Parameter Start auf false gesetzt, wird der Editor (zum Beispiel Word) nach der Vorlagenerstellung nicht gestartet. Das Command „DefaultProcess Start=true“ entspricht dem Standardverhalten von OneOffixx und kann somit auch weggelassen werden.

```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <OneOffixxConnectBatch xmlns="http://schema.oneoffixx.com/OneOffixxConnectBatch/1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    	<Entries>
    		<OneOffixxConnect>
    			<Arguments>
    				<TemplateId>6bb49520-1ebd-4f68-bb5f-02f46a9e1ec8</TemplateId>
    				<LanguageLcid>2055</LanguageLcid>
    			</Arguments>
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
```

Der Documentenpipline wird das Command „InitialData“ gesendet (intern).

