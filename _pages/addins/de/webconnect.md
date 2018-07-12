---
layout: page
title: WebConnect
permalink: "addins/de/webconnect/"
---
 
Das WebConnect Add-In funktioniert als WebAPI Server, welcher von externen Applikation aufgerufen wird. Das WebConnect Add-In löst einen Event aus mit dem Instanznamen und dem Event-Namen aus der URL. Als Parameter wird eine OneMessage mitgegeben.<br /><br />
Folgende WebAPI Methoden stehen zur Verfügung:
/api/services/<eventname>
/api/connect/<eventname>
<br /><br />
 
{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Konnektor / Event |
| Schnittstellen | In: Externe Applikationen |
| Transaktionen |  |
| Ereignisse | &lt;Instanz&gt;.<service> (Parameter = OneMessage)|
| | |
| __Parameter__ | |
| baseAddress | Basis-URL des WebServices |
| enableTrace | true = Nachrichten werden in Analyse-Dateien gespeichert (Optional, Default = false) |
| traceFolder | Verzeichnis der Analyse-Dateien (Optional, Default = "Trace") |



### Anwendungsbeispiele 

Beispiel Basis-URL: http://localhost/connect

Auslösen eines Ereignisses "eventname" mittels GET Request:
```
http://localhost/connect/api/services/eventname
```
