---
layout: page
title: Ldap2CSV
permalink: "addins/en/ldap2csv/"
language: en
---

The Ldap2CSV add-in determines information from the AD (Active Directory) via LDAP and saves them in a CSV file.<br /><br />

{:.table .table-striped}
| --- | --- |
| __features__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-in type | Logic |
| Interfaces | In: LDAP<br />Out: File |
| Transactions | 	1 if successful |
| Events | &lt;Instance&gt;.Done (parameter  = file)|
| | |
| __parameter__ | |
| userName | User with the necessary authorizations for the LDAP. The user must be specified in LDAP format, e.g. cn = read-only-admin, dc = example, dc = com. If no user is specified and authenticationType = Secure, the identity of the OneConnexx service is used. |
| password | Associated password (optional) |
| domain | Name or IP address of the LDAP server,<br/>e.g. corp.sevitec.ch |
| root | The BaseDN defines where the search for certain objects should be started in the directory tree<br/>Bsp.: CN=Configuration,DC=corp,DC=sevitec,DC=ch |
| authenticationType | Secure = The user specified in the “userName” parameter is used to log on to the LDAP server, or the identity of the OneConnexx service if no user has been specified.<br/>Anonymous = The login to the LDAP server is anonymous. |
| sizeLimit | Maximum number of entries that can be exported (optional, default = 1000) |
| filter | For the restriction to certain objects, eg “(objectClass = person)” (optional)<br/>The placeholder {lastrun} is replaced by a time stamp of the last successful execution. |
| properties | The LDAP columns to be exported separated by commas.<br />Data type, format and CSV column name can be added separated by # (example: “pwdLastSet # date # yyyy-MM-dd # password set”)<br/>Domain attributes start with $ (example: “$ maxPwdAge # ticks”).<br/>The placeholders {now} and {lastMonth} can be used for the current date or the last month (example: “{now: yyyy-MM-dd} ### todayDate”).<br/>Data type: empty = text, “date” = date, “ticks” = ticks<br/>Format: Date format as .NET string format expression, only for data type “date” (eg “dd.MM.yyyy” or “yyyMMddHHmmss”) |
| fileNamePattern | Name of the file to be created. The following placeholders are available: <br />{now}: Current date<br />{lastMonth}: Date of the last month |
| fileSaveLocation | 	Directory in which the file is created |
| delimiter | Separator of the columns in the CSV file (optional, default = semicolon) |
| includeHeaderRow | true = including column headings in the first row<br/>false = without column headings |
| encoding | Coding of the CSV file (optional, default = “utf-8”) |
| additionalData | Comma-separated list of key-value pairs which overwrite the columns specified in the “properties” parameter. The key must correspond to the column name.<br/>Example: Column1 = Value1, Column2 = Value2  |
| endpoint | Name of the end point that is used in the transaction (optional, default = “”) |

### Application examples

##### Format the date

For example, to output the date on which a user last changed his password, the following expression can be used in the “properties” parameter:
```
pwdLastSet#date#yyyy-MM-dd#Passwort gesetzt
```

##### Insert a field with fixed text

If a column with fixed text is to be inserted in the created CSV file, the fixed text can be specified in the “additionalData” parameter:

```
identifier_manager=keepmymanager
```

If there is an attribute with the name “identifier_manager” under “properties”, this will be replaced by the fixed text “keepmymanager”.

##### Display the value of a bit from a bit mask

With the data type “bitmask”, an integer or long value can be ANDed with a bit mask. The bit mask is placed after the data type separated by an underscore. The following example checks the 2nd bit of the AD attribute “userAccountControl”:

```
userAccountControl#bitmask_2#!bool#active
```

If no format is specified, the result of the AND link is displayed directly, in this example 2. The format “bool” returns 1 if the value is not 0, or 0 if the value is 0. The “! Bool” format works in exactly the same way, but inverts the result.
