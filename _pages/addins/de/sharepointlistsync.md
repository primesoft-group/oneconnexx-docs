---
layout: page
title: SharepointListSync
permalink: "addins/de/sharepointlistsync/"
language: de
---

Das SharepointListSync Add-In fügt Elemente aus einer CSV-Datei in eine SharePoint-Liste ein oder aktualisiert diese.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Logic |
| Schnittstellen | In: CSV-Datei<br/>Out: Sharepoint |
| Transaktionen | 1 wenn mind. 1 Element eingefügt oder aktualisiert wurde |
| Ereignisse | - |
| | |
| __Parameter__ | |
| mapping | Zuordnung von Spalten aus der CSV-Datei zu Spalten der SharePoint-Liste. Beispiel: CsvCol1:SpCol1,CsvCol2:SpCol2 |
| ignoreMissingColumns | Wenn 'True' werden Spalten die im Parameter 'mapping' definiert sind, aber in der CSV-Datei fehlen ignoriert. Wenn 'False' wird die Verarbeitung in diesem Fall abgebrochen. |
| csvFile | Kompletter Pfad einer CSV-Datei. Wird durch einen 'file' Parameter übersteuert der von einem verknüpften Add-In übergeben wird. |
| archiveDirectory | (Optional) Ein Verzeichnis in das die CSV-Datei verschoben wird nachdem sie verarbeitet wurde. |
| delimiter | Trennzeichen der CSV-Datei |
| tenantId | Tenant-Id |
| clientId | Client-Id der App Registrierung. |
| clientSecret | Client-Secret der App Registrierung. |
| spKeyColumn | (Optional) Name einer Spalte der SharePoint-Liste die als eindeutiger Schlüssel dient. Diese Spalte muss in SharePoint als 'eindeutig' gekennzeichnet sein. Falls angegeben, wird ein bestehendes Item mit passendem Wert aktualisiert. Wenn leer werden alle Zeilen der CSV-Datei als neue Items in die Liste eingetragen. |
| spSiteUrl | URL der Sharepoint-Site, z.B. https://contoso.sharepoint.com/sites/mysite |
| spListName | Name der SharePoint-Liste. |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |

### Voraussetzungen 

Das SharepointListSync Add-In benötigt eine App-Registrierung in Entra ID und folgende Berechtigungen (Application Permissions):
- Sites.ReadWrite.All (Zugriff auf alle Listen in allen Sites)
- Sites.Selected (Zugriff auf alle Listen in ausgewählten Sites)
