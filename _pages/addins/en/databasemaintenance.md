---
layout: page
title: DatabaseMaintenance
permalink: "addins/en/databasemaintenance/"
language: en
---
The DatabaseMaintenance Add-In updates the indexes of a database in order to improve performance. This is particularly valuable when using SQL Server Express, as it does not contain a SQL Server Agent.<br /><br />

{:.table .table-striped}
| --- | --- |
| __features__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-in type | Logic |
| Interfaces | Out: database |
| Transactions | 1 if successful |
| Events |  |
| | |
| __parameter__ | |
| connectionString | 	Connection string of the database whose indexes are being rebuilt |
| rebuildIndices | 	If 'true', all indexes in the database are rebuilt |
| sqlCommand | Optionally an SQL command to be executed |
| commandTimeout | Timeout for SQL command in seconds (0 = unlimited) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |

### Application examples

The automatic renewal of the indexes is not possible with the SQL Server Express. Together with a timer add-in, the DatabaseMaintenance add-in automatically rebuilds the indexes of a SQL Server Express database on a daily basis.

##### Used SQL

The following SQL script is executed internally:
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
