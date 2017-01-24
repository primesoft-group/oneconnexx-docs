---
layout: page
title: DatabaseMaintenance
permalink: "addins/de/databasemaintenance/"
---

Das DatabaseMaintenance AddIn erneuert die Indexe einer Datenbank, um so die Performance zu verbessern.<br />
Dies ist besonders beim Einsatz von SQL Server Express wertvoll, da dieser keinen SQL Server Agent beinhaltet. 

## Merkmale

{:.table .table-striped}
| --- | --- |
| AddIn Type | Logic &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Schnittstellen | Out: Datenbank |
| Transaktionen | 1 wenn erfolgreich |
| Ereignisse |  |


## Parameter

{:.table .table-striped}
| --- | --- |
| connectionString | Verbindungszeichenfolge der Datenbank, deren Indexe neu erstellt werden |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |

## Anwendungsbeispiele 

Das automatisches Erneuern der Inidizes ist beim SQL Server Express nicht möglich.<br />
Zusammen mit einem Timer AddIn erstellt das DatabaseMaintenance AddIn die Inidizes eine SQL Server Express Datenbank automatisch täglich neu.

