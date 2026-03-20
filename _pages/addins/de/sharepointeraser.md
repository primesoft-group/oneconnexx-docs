---
layout: page
title: SharepointEraser
permalink: "addins/de/sharepointeraser/"
language: de
---

Das SharepointEraser Add-In löscht Items in einer Sharepoint Liste/Bibliothek die älter als xx Stunden sind.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Logic |
| Schnittstellen | Sharepoint |
| Transaktionen | 1 wenn mind. 1 Datei gelöscht |
| Ereignisse | &lt;Instanz&gt;.Done |
| | |
| __Parameter__ | |
| tenantId | Tenant-Id |
| clientId | Client-Id der App Registrierung. |
| clientSecret | Client-Secret der App Registrierung. |
| siteUrl | URL der Sharepoint-Site, z.B. https://contoso.sharepoint.com/sites/mysite |
| subFolder | (Optional) Name eines Unterverzeichnisses der Dokumentenbibliothek. |
| recursive | Wenn 'true' werden auch Dateien in Unterverzeichnissen gelöscht. |
| deleteTimeout | Alter der Items in Stunden, ab wann sie gelöscht werden sollen. |
| testRun | true = Testlauf um zu überprüfen ob alles reibungslos durchläuft.<br />Die Items werden dabei nicht gelöscht, Logeinträge werden aber geschrieben. (Optional, Default = false) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |

### Voraussetzungen 

Das Sharepointeraser Add-In benötigt eine App-registrierung in Entra ID und folgende Berechtigungen (Application Permissions):
- Files.ReadWrite.All (Zugriff auf alle Dokumentbibliotheken in allen Sites)
- Sites.Selected (Zugriff auf alle Dokumentbibliotheken in ausgewählten Sites)
