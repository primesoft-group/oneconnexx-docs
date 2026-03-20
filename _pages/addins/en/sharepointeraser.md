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
| tenantId | Tenant id |
| clientId | Client id of app registration. |
| clientSecret | Client secret of app registration. |
| siteUrl | URL of the Sharepoint site, e.g. https://contoso.sharepoint.com/sites/mysite |
| subFolder | (Optional) Name of a subfolder of the document library. |
| recursive | If 'true' files in subdirectories are also deleted. |
| deleteTimeout | Age of the items in hours, from when they should be deleted. |
| testRun | true = test run to check whether everything runs smoothly.<br />The items are not deleted, but log entries are written. (Optional, default = false) |
| endpoint | Name of the endpoint that is used in the transaction (optional, default = "") |

### Prerequisites

The SharepointEraser add-in requires an app-registration in Entra ID and the following permissions (application permissions):

    Files.ReadWrite.All (access to all document libraries in all sites)
    Sites.Selected (access to all document libraries in selected sites)
