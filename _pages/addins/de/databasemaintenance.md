---
layout: page
title: DatabaseMaintenance
permalink: "addins/de/databasemaintenance/"
---

Das DatabaseMaintenance Add-In erneuert die Inidizes einer Datenbank, um so die Performance zu verbessern. Dies ist besonders beim Einsatz von SQL Server Express wertvoll, da dieser keinen SQL Server Agent beinhaltet.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Logic |
| Schnittstellen | Out: Datenbank |
| Transaktionen | 1 wenn erfolgreich |
| Ereignisse |  |
| | |
| __Parameter__ | |
| connectionString | Verbindungszeichenfolge der Datenbank, deren Inidizes neu erstellt werden |
| rebuildIndices | Wenn 'true', werden alle Indices der Datenbank neu erstellt |
| sqlCommand | Optional ein SQL Befehl der ausgeführt wird |
| commandTimeout | Timeout für SQL Befehl in Sekunden (0 = unbegrenzt) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |

### Anwendungsbeispiele 

Das automatische Erneuern der Inidizes ist beim SQL Server Express nicht möglich. Zusammen mit einem Timer Add-In erstellt das DatabaseMaintenance Add-In die Inidizes eine SQL Server Express Datenbank automatisch täglich neu.

##### Verwendetes SQL

Intern wird folgendes SQL Skript ausgeführt:
```sql
DECLARE @TableName VARCHAR(255)

DECLARE TableCursor CURSOR FOR
	SELECT table_name
	FROM information_schema.tables
	WHERE table_type = 'base table'
	
OPEN TableCursor
FETCH NEXT FROM TableCursor INTO @TableName
WHILE @@FETCH_STATUS = 0
BEGIN
	DBCC DBREINDEX(@TableName, ' ', 100)
	FETCH NEXT FROM TableCursor INTO @TableName
END
CLOSE TableCursor

DEALLOCATE TableCursor
```
