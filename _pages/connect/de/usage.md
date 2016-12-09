---
layout: page
title: Aufruf
permalink: "connect/de/usage/"
---

OneOffixx Connect kann sowohl von der Client-Applikation als auch über auf dem Server verarbeitet werden. 

Das Format ist hierbei gleich, wobei einige Operation nur auf auf dem Client selbst ausführbar sind, z.B. das Starten von Microsoft Word nach Erstellung eines Dokuments. 

{% include alert.html type="info" text="Zum Testen der Schnittstelle steht Ihnen auch der <b><a href='https://github.com/Sevitec/oneoffixx-connectclient/releases/latest'>OneOffixx Connect Client (Windows)</a></b> zur Verfügung." %}

### Connect Verarbeitung auf dem Client {% include anchor.html name="client" %}

Die Fachapplikation ruft OneOffixx über einer der folgenden Methoden auf:

* Via Prozess: "c:\\program…\OneOffixx.exe /connector "XYZDatei.xml"
* Via Protokollhandler: oneoffixx:connector="XYZDatei.xml"
* Via Shell: File Association *.ooconnect, *oocx, *oock

__ACHTUNG__: OneOffixx löscht nach der Verarbeitung automatisch das Connect File. Wird das zusätzliche Argument __/keepConnector_ übergeben kann dieses Verhalten unterdrückt werden. Wird via Shell aufgerufen, dann muss in diesem Fall die Endung oock verwendet werden.

### Connect Verarbeitung auf dem Server {% include anchor.html name="server" %}

Im Falle der serverseitigen Verarbeitung wird ein extra API Benutzer benötigt, welcher in der Server Konfiguration hinterlegt werden muss.
Zur Kommunikation zwischen Aufrufer und der serverseitigen REST-Schnittstelle wird das HTTP Protokoll verwenden. Die Authentifizierung des Clients erfolgt durch HTTP Basic Authentifizierung, daher wird empfohlen die Kommunikation zwischen Client und Server durch SSL abzusichern.
Um OneOffixx Connect auf dem Server zu verarbeiten muss vorher ein „client“ auf der OneOffixx Server Seite konfiguriert werden. Über diese „client“-Konfiguration wird auch der Name und das Passwort für die Authentifizierung festgelegt.
Das Connect-XML muss als HTTP POST samt dem „Authorization“-Header gesendet werden. Bei einer erfolgreichen Verarbeitung wird das erzeugte Dokument zurück gegeben.
Beispiel: 

    HTTP POST "https://{server}/api/V1/connect"

    Headers: 
    Authorization Basic dXNlcm5hbWU6cGFzc3dvcmQ=

Im Body das OneOffixxConnect XML hinterlegen.

* Der Basic Authentication-Header ist im Beispiel "username:password" als Base64 encodiert.

Optionale Parameter:

TenantId & DatasourceId - siehe OneOffixx.config 

    HTTP POST "https://{server}/api/V1/connect?tenantId={{GUID}}&datasourceId={{GUID}}"

Beispiel:

    HTTP POST "https://{server}/api/V1/connect?tenantId=f4edff9a-18ab-4a24-9532-8497113e094c&datasourceId=331ece2a-cfba-47f6-8434-8c2d13c50678

## Ergebnis

Das Ergebnis eines OneOffixx Connect Aufrufs wird auch als XML-File an der gleichen Stelle wie das Input-XML abgelegt. Der Filename hat die folgende Form:

result\_*NameInputfile*\_*Zeitstempel*.xml

Standardmässig wird das File nur bei einem Fehler erstellt. 

Mit dem Argument /CreateConnectorResult, wird das File immer erzeugt, mit dem Argument /CreateConnectorResultOnError false wird die Funktionalität ganz deaktiviert.

Alternativ können die Parameter im Dokument geändert werden.

Das Fehlerfile hat das folgende Format:

    <?xml version="1.0" encoding="utf-16"?>
    <OneOffixxConnectResult xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <Result><!-- Success oder Error --></Result>
      <Message><!-- Exception bei einem Fehler --></Message>
      <Details>
        <InputFile><!-- Pfad zum Input-File --></InputFile>
        <Input><!-- Input-File --></Input>
        <Connect><!-- Connect-File --></Connect>
        <InterfaceType><!-- Interface-Typ für Tranformation (z. Bsp. Klib) --></InterfaceType>
        <InterfaceVersion><!-- Interface-Version --></InterfaceVersion>
        <InterfaceConfiguration><!-- Interface-Konfiguration (Transformation) --></InterfaceConfiguration>
      </Details>
    </OneOffixxConnectResult>
