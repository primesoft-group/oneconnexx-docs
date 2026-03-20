---
layout: page
title: SharepointListSync
permalink: "addins/en/sharepointlistsync/"
language: en
---

The SharepointListSync add‑in inserts items from a CSV file into a SharePoint list or updates existing ones.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Logic |
| Interfaces | In: CSV-Datei<br/>Out: Sharepoint |
| Transactions | 1 if at least 1 element has been inserted or updated |
| Events | - |
| | |
| __Parameter__ | |
| mapping | Mapping of columns in the CSV file to columns in the SharePoint list. Example: CsvCol1:SpCol1,CsvCol2:SpCol2 |
| ignoreMissingColumns | If 'True', columns defined in the 'mapping' parameter but missing in the CSV file are ignored. If 'False', processing will be aborted in this case. |
| csvFile | Full path to a CSV file. Can be overwritten by a 'file' parameter that is passed from a connected add-in. |
| archiveDirectory | (Optional) A directory into which the CSV file is moved after it has been processed. |
| delimiter | Delimiter used in the CSV file. |
| tenantId | Tenant id |
| clientId | Client id of the app registration. |
| clientSecret | Client secret of the app registration. |
| spKeyColumn | (Optional) Name of a column in the SharePoint list that acts as unique key. This column must be defined as 'unique' in SharePoint. If a column is specified, an existing item with the matching value will be updated. If empty, all rows in the CSV file are inserted as new items into the list. |
| spSiteUrl | URL of the Sharepoint site, e.g. https://contoso.sharepoint.com/sites/mysite |
| spListName | Name of the SharePoint list. |
| endpoint | Name of the endpoint that is used in the transaction (optional, default = “”) |

### Voraussetzungen

The SharepointListSync add-in requires an app-registration in Entra ID and the following permissions (application permissions):
- Sites.ReadWrite.All (access to all lists in all sites)
- Sites.Selected (access to all lists in selected sites)
