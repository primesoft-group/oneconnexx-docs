---
layout: page
title: TextReplace
permalink: "addins/en/textreplace/"
language: en
---

The TextReplace Add-In can be used to replace certain strings in a text file. The file is read in line by line and the character strings to be replaced can be defined using regular expressions. The character set of a text file can also be converted.<br /><br />

{:.table .table-striped}
| --- | --- |
| __features__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-in type | Logic |
| Interfaces | In/Out: file ("file" parameter) |
| Transactions | 1 if successful |
| Events | n/a |
| | |
| __parameter__ | |
| expression | 	List of regular expressions (one per line) to be searched for in the input file |
| replacement | List of values ​​with which the found strings are replaced (one per line) |
| inputEncoding |Character encoding of the input file (e.g. 'UTF-8', 'ISO-8859-1') (optional, default = "UTF-8") |
| outputEncoding | 	Character coding of the output file (e.g. 'UTF-8', 'ISO-8859-1') (optional, default = "UTF-8") |
| writeBom | Indicates whether a 'byte order mark' (BOM) is written if 'outputEncoding' is set to 'UTF-8' (optional, default = true) |
| endpoint | 	Name of the end point that is used in the transaction (optional, default = "") |

### Application examples 

The parameters "expression" and "replacement" can contain multiline text. A regular expression must be specified per line in "expression" and a replacement text must be specified in "replacement". Both parameters must contain the same number of lines.

{:.table .table-striped}
| expression | replacement ||
| encoding="ISO-8859-1" | encoding="UTF-8" | Replaces the expression __encoding="ISO-8859-1"__ with __encoding="UTF-8"__. |
| ([^=])(") | $1&amp;quot; | Replacing all occurrences of " (group 2) are not for a = stand (group 1) through enters & quot; __&amp;quot;__ |

The TextReplace Add-In receives the name of the file to be edited in the subscribed event in the "file" parameter. This parameter is provided by the following add-ins:

* DatabaseToCsv (in the output event)
* FileCopy (in the output or filter event)
* FileSystemWatcher 
* Xls2Csv (in the output event)
* Xml2Csv (in the output event)
* FileDecompressor (in the output event)
* FileReconstructor (in the output event)
* Ldap2CSV (in the Done event)


### Character set

If the "inputEncoding" parameter was set to "UTF-8" and the file to be processed is in a different format, the system automatically tries to read the file in the system's standard character set (usually ISO-8859-1).
