---
layout: page
title: Xml2Csv
permalink: "addins/en/xml2csv/"
language: en
---

The Xml2Csv add-in writes certain XML nodes to a CSV file. The parameters are used to configure which nodes are adopted and where the new file is saved.
<br /><br />

{:.table .table-striped}
| --- | --- |
| __
features__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-in type | Logic |
| Interfaces | Dateiverzeichnis |
| Transactions | 1 per created file |
| Events | Per created file: &lt;Instance&gt;.Output (parameter = file)<br />1x at the end: &lt;Instance&gt;.Done |
| | |
| __parameter__ | |
| sourceDirectory | The directory of the source files (XML files) |
| sourceFilePattern | The search pattern to restrict the source files (optional, default = \*.xml) |
| rowXPath | 	XPath to select the lines in the CSV file |
| additionalColumnXPath | XPath to include columns outside the row defined with rowXPath. Multiple columns can be specified separated by semicolons. (Optional) |
| stripNamespace | 	true = namespace prefixes from the XML file are removed from the column names in the created CSV file (optional, default = true) |
| delimiter | Separator of the columns in the CSV file (optional, default = semicolon) |
| destinationDirectory | Directory in which the CSV file is created (optional, default = sourceDirectory) |
| endpoint | Name of the end point that is used in the transaction (optional, default = "") |

### Application examples 

##### Source file via "file" parameter

If the Xml2Csv add-in is activated via an event that contains a "file" parameter, the file in this parameter is interpreted as an XML file and converted into a CSV file. In this case the configured parameters "sourceDirectory" and "sourceFilePattern" are ignored.

Events with "file" parameters are triggered by the following add-ins:
* DatabaseToCSV
* FileDecompressor
* FileCompressor
* FileCopy
* FileReconstructor
* FileSystemWatcher
* Ldap2CSV
* Xml2Csv
