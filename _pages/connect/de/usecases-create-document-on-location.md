---
layout: page
title: Anwendungsfälle
subtitle: Vorlage oder Dokument an einen definierten Ort speichern
permalink: "connect/de/usecases/create-document-on-location/"
---

Das erzeugte Dokument wird an einen definierten Ort gespeichert. Das Kommando „SaveAs“ speichert das Dokument unverändert. 

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
    				<Command Name="SaveAs">
    					<Parameters>
    						<Add key="Filename">\\e205\share\organization\...\documentxyz.dotx</Add>
    						<Add key="Overwrite">true</Add>
    						<Add key="CreateFolder">true</Add>
    					</Parameters>
    				</Command>
    				<Command Name="DefaultProcess">
    					<Parameters>
    						<Add key="Start">False</Add>
    					</Parameters>
    				</Command>
    			</Commands>
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
```

Im obigen Fall wird eine Vorlage erzeugt und an einem definierten Ort abgespeichert. Soll daraus ein Dokument erstellt werden, muss vorgängig das Kommando „ConvertToDocument“ aufgerufen werden.

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
    				<Command Name="ConvertToDocument" />
    				<Command Name="SaveAs">
    					<Parameters>
    						<Add key="Filename">\\e205\share\organization\...\documentxyz.docx</Add>
    						<Add key="Overwrite">true</Add>
    						<Add key="CreateFolder">true</Add>
    					</Parameters>
    				</Command>
    				<Command Name="DefaultProcess">
    					<Parameters>
    						<Add key="Start">False</Add>
    					</Parameters>
    				</Command>
    			</Commands>
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
```