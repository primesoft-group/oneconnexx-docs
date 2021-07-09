---
layout: page
title: Xls2Csv
permalink: "addins/en/xls2csv/"
language: en
---

The Xls2Csv add-in converts an Excel file (.xls or .xlsx) into a CSV file. If the Excel file contains several workbooks, only the first is converted.
The generated CSV file has the same name as the Excel file, only the file extension is changed to CSV.<br /><br />

{:.table .table-striped}
| --- | --- |
| __features__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-in type | Logic |
| Interfaces | In: Excel file<br /> Out: CSV file|
| Transactions | 1 per processed file |
| Events | Per created file: &lt;Instance&gt;.Output (parameter = file) <br />1x at the end: &lt;Instance&gt;.Done |
| | |
| __parameter__ | |
| sourceDirectory | Directory in which Excel files are searched for | 
| sourceFilePattern | Search pattern used to search for Excel files (default = * .xlsx) | 
| delimiter | Separator in the CSV file (optional, default = semicolon) | 
| dateTimePattern | Optional format with which the date / time values ​​are formatted in the CSV file (e.g. dd.MM.yyyy) | 
| destinationDirectory | Target directory in which CSV files are written. If empty, the files will be created in the source directory. | 
| overwrite | Specifies whether an existing CSV file should be overwritten. If 'false', a number is appended to the file name so that it is unique. | 
| deleteSourceFile | 	Specifies whether the input file should be deleted after successful conversion | 
| endpoint | Name of the endpoint that is used in the transaction (optional, default = "") |
 
 
### Application examples 

##### Source file via "file" parameter

If the Xls2Csv add-in is activated via an event that contains a "file" parameter, the file in this parameter is interpreted as an Excel file and converted into a CSV file. In this case the configured parameters "sourceDirectory" and "sourceFilePattern" are ignored.

Events with "file" parameters can be subscribed to by the following add-ins:
* FileDecompressor
* FileCopy
* FileSystemWatcher
