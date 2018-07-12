---
layout: page
title: WebConnect
permalink: "addins/de/webconnect/"
---
 
Das WebConnect Add-In funktioniert als WebAPI-Server, welcher von externen Applikation aufgerufen werden kann um Aktionen in OneConnexx zu starten. Das WebConnect Add-In löst einen Event aus mit dem Instanznamen und dem Event-Namen aus der URL. Als Parameter kann eine OneMessage an andere Add-Ins mitgegeben werden.<br /><br />
Folgende WebAPI Methoden stehen zur Verfügung:<br />
/api/services/<eventname><br />
/api/connect/<eventname><br />
<br /><br />
 
{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Konnektor / Event |
| Schnittstellen | In: Externe Applikationen |
| Transaktionen |  |
| Ereignisse | &lt;Instanz&gt;.&lt;service&gt; (Parameter = OneMessage)|
| | |
| __Parameter__ | |
| baseAddress | Basis-URL des WebServices |
| enableTrace | true = Nachrichten werden in Analyse-Dateien gespeichert (Optional, Default = false) |
| traceFolder | Verzeichnis der Analyse-Dateien (Optional, Default = "Trace") |



### Anwendungsbeispiele

Beispiel Basis-URL: http://localhost/connect

Auslösen eines Ereignisses "eventname" mit leerer OneMessage mittels GET Request:
```
http://localhost/connect/api/services/eventname
```
Als Resultat wird die Anzahl ausgelöster Ereignisse als JSON zurückgegeben. Beispiel: `{"oneconnexx": { "invoked": 1}}`

Auslösen eines Ereignisses "eventname" mit JSON Parameter mittels POST Request:
```
http://localhost/connect/api/services/eventname
```
Der POST Body muss mit Content-Type "application/json" übermittelt werden und ein JSON Objekt enthalten:
```
{"oneconnexx": { "data": { }}}
```
"data" ist wiederum ein JSON Objekt das in eine OneMessage umgewandelt wird. Als Resultat wird die Anzahl ausgelöster Ereignisse als JSON zurückgegeben. Beispiel: `{"oneconnexx": { "invoked": 1}}`

Auslösen eines Ereignisses "eventname" mit OneMessage Parameter mittels POST Request:
```
http://localhost/connect/api/connect/eventname
```
Der POST Body muss mit Content-Tyle "text/xml" übermittelt werden und ein XML Dokument mit mindestens den Nodes `<oneconnexx><data>` enthalten:
```
<oneconnexx><data><add name="Key" value="Value" /></data></oneconnexx>
```
Als Resultat wird die Anzahl ausgelöster Ereignisse als XML OneMessage zurückgegeben.


### Berechtigungen zum Abhören eines Ports

Falls der WebAPI-Server nicht berechtigt ist die angegebene URL/Port abzuhören, kann diese Berechtigung in der als Administrator gestarteten Eingabeaufforderung erteilt werden:

```
netsh http add urlacl url=http://+:8355/webconnect/ user=domain\user
```

Dieser Befehl erteilt dem Benutzer domain\user die Berechtigung auf Port 8355 die URL /webconnect abzuhören. Wichtig: Die URL im Parameter baseAddress muss exakt mit der angegebenen URL übereinstimmen, inklusive dem + Zeichen anstelle des Hostnamens! 

