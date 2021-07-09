---
layout: page
title: WebConnect
permalink: "addins/en/webconnect/"
language: en
---
 
The WebConnect Add-In works as a WebAPI server, which can be called by external applications to start actions in OneConnexx. The WebConnect Add-In triggers an event with the instance name and the event name from the URL. A OneMessage can be sent to other add-ins as a parameter.<br /><br />
The following WebAPI methods are available:<br />
/api/services/<eventname><br />
/api/connect/<eventname><br />
<br /><br />
 
{:.table .table-striped}
| --- | --- |
| __features__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-in type | Connector / Event |
| Interfaces | 	In: External Applications |
| Transactions |  |
| Events | &lt;Instance&gt;.&lt;service&gt; (parameter = OneMessage)|
| | |
| __parameter__ | |
| baseAddress | Base URL of the web service |
| enableTrace | true = messages are saved in analysis files (optional, default = false) |
| traceFolder | Directory of the analysis files (optional, default = "Trace") |



### Application examples

Example base URL: http://localhost/connect

Triggering an event "eventname" with an empty OneMessage using a GET request:
```
http://localhost/connect/api/services/eventname
```
As a result, the number of triggered events is returned as JSON. Example: `{"oneconnexx": { "invoked": 1}}`

Triggering an event "eventname" with JSON parameters using a POST request:
```
http://localhost/connect/api/services/eventname
```
The POST body must be transmitted with the content type "application / json" and contain a JSON object:
```
{"oneconnexx": { "data": { }}}
```
"Data" is in turn a JSON object that is converted into a OneMessage. As a result, the number of triggered events is returned as JSON. Example: `{"oneconnexx": { "invoked": 1}}`

Triggering an event "eventname" with OneMessage parameters using a POST request:
```
http://localhost/connect/api/connect/eventname
```
The POST body must be transmitted with the content style "text / xml" and <oneconnexx><data>contain an XML document with at least the nodes . The content of the <data>node is converted into a OneMessage.
```
<oneconnexx><data><add name="Key" value="Value" /></data></oneconnexx>
```
As a result, the number of triggered events is returned as an XML OneMessage.


### Permissions to listen on a port

If the WebAPI server is not authorized to listen to the specified URL / port, this authorization can be granted in the command prompt started as administrator:

```
netsh http add urlacl url=http://+:8355/webconnect/ user=domain\user
```

This command grants the user domain\user the authorization to listen to the URL /webconnect on port 8355. Important: The URL in the baseAddress parameter must exactly match the specified URL, including the + sign instead of the host name! 

