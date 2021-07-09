---
layout: page
title: OneOffixxDocumentCreator
permalink: "addins/en/oneoffixxdocumentcreator/"
language: en
---

The add-in OneOffixxDocumentCreator creates documents in the customer's CI / CD via the OneOffixx interface "OneOffixxDocumentCreationServer" (OODCS).<br /><br />

{:.table .table-striped}
| --- | --- |
| __features__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-in Type | Connector  / Logic |
| Interfaces | In/Out: OneOffixx |
| Transactions |  |
| Events |  |
| | |
| __parameter__ | |
| configFilename | 	File with mapping configuration (e.g. $ (config) \ oodcs.xml) |
| oodcsUrl | 	URL of the OODCS web service |
| oodcsUsername | 	Username of the OODCS WebService |
| oodcsPassword | Password of the OODCS web service |
| enableTrace | true = messages are saved in analysis files (optional, default = false) |
| traceFolder | Directory of the analysis files (optional, default = "Trace") |
| messageTransformFolder | Folder containing the MessageTransform files (* .mt) |
| retryCount | If a request fails, it will be repeated. The retryCount parameter defines how often a request should be repeated. (Optional, default = 1) |
| maxRequests | Number of parallel requests (optional, default = 8) |

### Application examples

In the case of the [use case "Document creation"]({{ site.baseurl }}/usecases/en/documentcreation/), the documents are created using the OneOffixxDocumentCreator Add-In.
