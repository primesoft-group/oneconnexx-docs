---
layout: page
title: DatabaseToCSV
permalink: "addins/en/databasetocsv/"
language: en
---

The DatabaseToCSV Add-In generates one or more CSV files from an SQL query.<br /><br />

{:.table .table-striped}
| --- | --- |
| __features__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-in type | Logic |
| Interfaces | In: Datenbank<br /> Out: CSV-Datei|
| Transactions | 1 pro erstellte Datei |
| Events | Pro Per created file: &lt;Instanz&gt;.Output (Parameter = file) <br />1x at the end: &lt;Instanz&gt;.Done |
| | |
| __parameter__ | |
| connectionString | 	Database connection string | 
| delimiter | 	Separator in the CSV file (optional, default = semicolon) | 
| encoding | Coding of the CSV file (optional, default = "UTF-8") | 
| fileNamePattern | File name of the CSV file<br/>is ignored if the file name is returned by the SQL query. The placeholder {0} is replaced by a current time stamp. Example: File_ {0: yyyyMMdd_hhmmss} .csv = File_20160523_115620.csv<br/>Existing files will be overwritten.
| fileSaveLocation | Target directory of the CSV file | 
| includeColumnName | true: column names are written in the 1st line (optional, default = false) | 
| query | A SQL query that returns the data to be exported.<br />Only SELECT or EXEC are allowed. A CSV file is created for each result set | 
| timeOut | Timeout in seconds until the SQL command is canceled. (Optional, default = 30) | 
| endpoint | Name of the end point that is used in the transaction (optional, default = “”) |
 
 
### Application examples

IT often receives the order to periodically export data records from a database so that the departments can check or process the information.

For this purpose, an SQL query is defined which returns the data. A timer, which periodically calls the DatabaseToCSV add-in, and a mail sender, which informs the department about the newly created CSV files, complete the package.

##### Define file name in SQL query

If a 2nd result set is returned by the SQL query, the 1st column of the 1st line of the 2nd result set is interpreted as the file name. The “fileNamePattern” parameter is ignored in this case. Example of an SQL query:
```
SELECT * FROM DataTable;
SELECT 'DataTable_export.csv'; 
```

##### Create multiple CSV files

If the SQL query returns a multiple of 2 result sets, several CSV files are created. In this case, the file name cannot be specified using the “fileNamePattern” parameter. Example of an SQL query that creates two CSV files:
```
SELECT * FROM DataTable;
SELECT 'DataTable_export.csv'; 
SELECT * FROM StatisticData;
SELECT 'Statistic_export.csv'; 
```
