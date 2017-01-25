---
layout: page
title: DatabaseMaintenance
permalink: "addins/de/databasemaintenance/"
---

Das DatabaseMaintenance AddIn erneuert die Indexe einer Datenbank, um so die Performance zu verbessern. Dies ist besonders beim Einsatz von SQL Server Express wertvoll, da dieser keinen SQL Server Agent beinhaltet.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | |
| AddIn Type | Logic |
| Schnittstellen | Out: Datenbank |
| Transaktionen | 1 wenn erfolgreich |
| Ereignisse |  |
| | |
| __Parameter__ | |
| connectionString | Verbindungszeichenfolge der Datenbank, deren Indexe neu erstellt werden |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |

### Anwendungsbeispiele 

Das automatisches Erneuern der Inidizes ist beim SQL Server Express nicht möglich.<br />
Zusammen mit einem Timer AddIn erstellt das DatabaseMaintenance AddIn die Inidizes eine SQL Server Express Datenbank automatisch täglich neu.

