---
layout: page
title: Anwendungsfälle
subtitle: Nachfolgeprozesse starten (Drucken, PDF Erzeugung, …)
permalink: "connect/de/usecases/after-document-generation/"
---

Durch das Kommando DefaultProcess und/oder Print  kann in OneOffixx ein Nachfolge-Prozesss gestartet werden soll. Dieser Mechanismus kann als Event für beliebige Prozesse genutzt werden. Bsp: Trigger für CMS etc.

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
    				<Command Name="DefaultProcess">
    					<Parameters>
    						<Add key="Start">false</Add>
    					</Parameters>
    				</Command>
    				<Command Name="Print" />
    			</Commands>
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>    
```

Es wird immer der Standard-Drucker verwendet.

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
    				<Command Name="DefaultProcess">
    					<Parameters>
    						<Add key="Start">false</Add>
    					</Parameters>
    				</Command>
    				<Command Name="Print" />
    			</Commands>
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
```

Mit der Angabe des “Type” PDF innerhalb des SaveAs Commands, wird direkt ein PDF erzeugt.

```xml
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
    					      <Add key="Type">PDF</Add>
    					      <Add key="Filename">c:\OneOffixxConnectTest\OneOffixxConnect.pdf</Add>
    					      <Add key="Overwrite">true</Add>
    					      <Add key="CreateFolder">true</Add>
    					</Parameters>
    				</Command>
    				<Command Name="DefaultProcess">
    					<Parameters>
    						<Add key="Start">false</Add>
    					</Parameters>
    				</Command>
    			</Commands>
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
```

Vorlagen haben üblicherweise den Status “NewDocument”. Soll der Status auf SavedDocument geändert werden muss der Parameter AllowUpdateDocumentPart aktiviert werden. 

```xml
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
    					      <Add key="AllowUpdateDocumentPart">true</Add>
    					</Parameters>
    				</Command>
    				<Command Name="DefaultProcess">
    					<Parameters>
    						<Add key="Start">false</Add>
    					</Parameters>
    				</Command>
    			</Commands>
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
```
