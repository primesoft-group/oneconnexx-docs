---
layout: page
title: "Function: MetaData"
subtitle: Daten im Dokument unter Dokumenteigenschaften setzen
permalink: "connect/de/functions/metadata/"
---

Die Fachapplikation übergibt via Schnittstelle Metadaten die von OneOffixx in den Dokumenteigenschaften gespeichert werden sollen.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<OneOffixxConnectBatch xmlns="http://schema.oneoffixx.com/OneOffixxConnectBatch/1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <Entries>
    <OneOffixxConnect>
      <Arguments>
        <TemplateId>6bb49520-1ebd-4f68-bb5f-02f46a9e1ec8</TemplateId>
        <LanguageLcid>2055</LanguageLcid>
      </Arguments>
      <Function name="MetaData" id="c364b495-7176-4ce2-9f7c-e71f302b8096">
        <!-- Die Übergabe der eigentlichen Werte finden innerhalb des Tags Arguments statt -->
        <Arguments>
          <!-- 	
          key => Bezeichnung des Metatags im Dokument (frei definierbarer Text - [zwingendes Attribut]) 
	  typ => Datentyp welcher des Metatags (erlaubte Werte:"string"|"bool"|"int"|"datetime" - [optionales Attribut, falls nicht geliefert wird der Wert als String interpretiert]) 
          Value-Inhalt => Dateninhalt des jeweiligen Metatags
		  -->
          <Value key="ConnectTestInt" type="int">1</Value>
          <Value key="ConnectTestString" type="string">Ein einfacher Text</Value>
          <Value key="OFF.asdfasdfkjasdf" type="string">Ein einfacher Text</Value>
          <Value key="ConnectTestBoolean" type="bool">true</Value>
        </Arguments>
      </Function>
    </OneOffixxConnect>
  </Entries>
</OneOffixxConnectBatch>
```
{% include alert.html type="warning" text="Diese Funktion steht erst ab der Version 2.3.40160 auch serverseitig zur Verfügung." %}
