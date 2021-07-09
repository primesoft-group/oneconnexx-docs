---
layout: page
title: SharepointEraser
permalink: "addins/en/sharepointeraser/"
language: en
---

The SharepointEraser Add-In deletes items in a Sharepoint list / library that are older than xx hours.<br /><br />

{:.table .table-striped}
| --- | --- |
| __features__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-in type | Logic |
| Interfaces | Sharepoint |
| Transactions | 	1 if at least 1 file has been deleted |
| Events | &lt;Instance&gt;.Done |
| | |
| __parameter__ | |
| userName | Users with the necessary permissions for the SharePoint server (Optional) |
| password | Associated password (optional) |
| libraryUrl | URL of the Sharepoint library including its name |
| subFolder | (Optional) Server-relative URL to a subdirectory of the document library. |
| recursive | If 'true' files in subdirectories are also deleted ("subfolder" is ignored in this case). |
| deleteTimeout | Age of the items in hours, from when they should be deleted. |
| testRun | true = test run to check whether everything runs smoothly.<br />The items are not deleted, but log entries are written. (Optional, default = false) |
| requestTimeout | Automatic disconnection if the request takes longer than the specified time in milliseconds. (Optional, default = 60000) |
| endpoint | Name of the end point that is used in the transaction (optional, default = "") |

<!-- 
### Anwendungsbeispiele 

ToDo
-->

