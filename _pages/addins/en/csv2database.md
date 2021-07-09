---
layout: page
title: Csv2Database
permalink: "addins/en/csv2database/"
language: en
---

The Csv2Database add-in loads data from a CSV file into an SQL database table. 
All lines in the CSV file are either added to the database as new records or updated if a primary key has been specified. 
The first line of the CSV file must contain the column names. Only those columns are inserted into the database whose names exactly match the column names in the database table.<br /><br />

{:.table .table-striped}
| --- | --- |
| __features__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Logic |
| Interfaces | In: CSV-file<br /> Out: Database|
| Transactions | 1 per processed file |
| Events | 1x at the end: &lt;Instance&gt;.Done |
| | |
| __parameter__ | |
| connectionString | Database connection string | 
| tableName | Name of the database table into which data is inserted | 
| sourceDirectory | Source directory in which CSV files are searched for | 
| sourceFilePattern | Pattern for searching for CSV files | 
| csvDelimiter | The separator used in the CSV file |
| archiveDirectory | Optionally a directory into which the imported files are moved |
| errorDirectory | Optionally a directory in which files are moved if an error has occurred |
| useDbTransaction | If 'true', all database operations are carried out within a transaction. If an INSERT / UPDATE fails, the entire transaction is rolled back. |
| preCommand | Optionally an SQL command that is executed before reading the CSV files |
| postCommand | Optionally an SQL command that is executed after reading the CSV files |
| primaryKey | Optionally the name of the primary key of the database table. If specified, a record with this primary key is first searched for and this is updated. If no such data record is found, a new data record is inserted. |
| fileNameColumn | Optionally the name of the column of the database table in which the file name of the CSV file is written (optional, default = "") |
| endpoint | Name of the endpoint that is used in the transaction (optional, default = "") |
 
 
### Application examples

##### Source file via "file" parameter

If the Csv2Database add-in is activated via an event that contains a "file" parameter, the file in this parameter is interpreted as a CSV file and converted into a CSV file. In this case the configured parameters "sourceDirectory" and "sourceFilePattern" are ignored.

Events with "file" parameters can be subscribed to by the following add-ins:
* DatabaseToCSV
* FileDecompressor
* FileCompressor
* FileCopy
* FileReconstructor
* FileSystemWatcher
* Ldap2CSV
* Xml2Csv
