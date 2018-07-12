---
layout: page
title: WebConnect
permalink: "addins/de/webconnect/"
---
 
Das WebConnect Add-In funktioniert als WebAPI Server, welcher von externen Applikation aufgerufen werden kann um Aktionen in OneConnexx zu starten. Das WebConnect Add-In löst einen Event aus mit dem Instanznamen und dem Event-Namen aus der URL. Als Parameter kann eine OneMessage an andere Add-Ins mitgegeben werden.<br /><br />
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
Ein JSON Objekt wird dem POST Request als Parameter "data" mitgegeben. Die Objekte unter oneconnexx/data werden als OneMessage weitergegeben. Als Resultat wird die Anzahl ausgelöster Ereignisse als JSON zurückgegeben. Beispiel: `{"oneconnexx": { "invoked": 1}}`

Auslösen eines Ereignisses "eventname" mit OneMessage Parameter mittels POST Request:
```
http://localhost/connect/api/connect/eventname
```
Der POST Request erwartet die Parameter "Data" und "Entities", aus denen die OneMessage zusammengesetzt wird. Als Resultat wird die Anzahl ausgelöster Ereignisse als XML OneMessage zurückgegeben.





