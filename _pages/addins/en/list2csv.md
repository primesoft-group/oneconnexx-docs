---
layout: page
title: ListToCSV
permalink: "addins/en/list2csv/"
language: en
---

With the ListToCSV add-in, Sharepoint online lists or views can be exported to a CSV file.

{:.table .table-striped}
| --- | --- |
| __features__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-in type | Logic |
| Interfaces | In: Sharepoint list <br /> Out: CSV file |
| Transactions |1 if successful |
| Events | &lt;Instance&gt;.Done (parameter = file) |
| | |
| __parameter__ | |
| spSiteUrl | The URL to the Sharepoint page |
| spListName | 	The name of the Sharepoint list on the Sharepoint page |
| spViewName | (Optional) The name of the Sharepoint view for the list given above. If this field is left empty, a standard view is used. |
| spUser | 	The user name for authentication on Sharepoint |
| spPassword |  The password for authentication on Sharepoint |
| fileSaveLocation | 	The complete storage path of the CSV file. |
| customHeader | (Optional) Header for the first line in the CSV. If empty, the internal SharePoint column names are used. |
| delimiter | delimiter |
| entriesToExport | Specifies whether all entries or only those that have changed since the last execution are exported. |
| endpoint | Optional name of the endpoint used in the transaction. |
