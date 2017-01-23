---
layout: page
title: DatabaseMaintenance
permalink: "addins/de/databasemaintenance/"
---

Das DatabaseMaintenance AddIn erneuert die Indexe einer Datenbank, um so die Performance zu verbessern.
Dies ist besonders beim Einsatz von SQL Server Express wertvoll, da dieser keinen SQL Server Agent beinhaltet. 

## Merkmale

{:.table .table-striped}
| --- | --- |
| AddIn Type | Logic |
| Schnittstellen | Out: Datenbank |
| Transaktionen | 1 wenn erfolgreich |
| Ereignisse |  |
| Ereignis-Parameter |  |


## Parameter

{:.table .table-striped}
| --- | --- |
| connectionString | Angaben zur Verbindung der Datenbank, deren Indexe neu erstellt werden |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional) |


## Anwendungsbeispiele 

Automatisches erneuern der Inidizes ist beim SQL Server Express nicht möglich.
Mit dem DatabaseMaintenance AddIn bietet sich eine elegante Lösung des Problems an.
