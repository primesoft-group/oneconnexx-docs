---
layout: page
title: SharepointToDB
permalink: "addins/en/sharepointtodb/"
language: en
---

The SharepointToDB add-in exports elements of a Sharepoint list or document library into an SQL database. In the case of a document library, the document can be stored in a binary database field.<br /><br />

{:.table .table-striped}
| --- | --- |
| features | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-in type | Logic |
| Interfaces | Sharepoint |
| Transactions | 1 if successful |
| Events | &lt;Instance&gt;.Done |
| | |
| __parameter__ | |
| spWebUrl | Sharepoint Web URL. |
| spListName | Name of the Sharepoint list or library. |
| spViewName | (Optional) Name of the Sharepoint view which contains the fields to be exported. If empty, the default view is used. |
| spUser | (Optional) Username for authentication on Sharepoint. |
| spPassword | (Optional) Password for authentication on Sharepoint. |
| entriesToExport | Specifies whether all entries or only those entries that have been changed since the last execution are exported. |
| connectionString | Connection string to the database. |
| useDbTransaction | If active, a database transaction is used and a rollback is carried out in the event of an error. |
| preCommand | Optionally an SQL command that is executed before the comparison. |
| postCommand | Optionally an SQL command that is executed after the synchronization. |
| tableName | Name of the database table. |
| primaryKeyColumn | (Optional) Name of the primary key column. Existing lines with a matching primary key are deleted and reinserted. |
| fileColumn | (Optional) Name of the binary database column in which the file is written if it is a Sharepoint library. |
| columnMapping | (Optional) Allocation of Sharepoint fields to database columns. Example: spField1: dbColumn1, spField2: dbColumn2 |
| endpoint | 	Name of the endpoint that is used in the transaction (optional, default = "") |


### Mapping of the SharePoint fields to database columns

By default, SharePoint fields are written in database columns with the same names. This behavior can be influenced using the columnMapping parameter. The following example maps a SharePoint field "Account Type" to the database column "AccountType":

```
Account_x0020_Type:AccountType
```

If you want to prevent a SharePoint field from being mapped to a database column, for example the "ID" field which is present in every SharePoint element, this can be mapped to an "empty" DB column:

```
ID:
```

In the *columnMapping* parameter multiple mappings can be separated by commas.

### Save files from document libraries

If the list specified in the spListName parameter is a document library , the element's document can be written to a binary database column. The database column must be of the *varbinary* or *image* type and its name must be specified in the *fileColumn* parameter .

### Incremental exports

If the *entriesToExport* parameter is set to *CHANGED*, only those elements are synchronized that have changed since the last execution. For this purpose, the *last modified* date of the SharePoint element is compared with the date of the last execution of the add-in instance. The date of the last execution is saved as an instance parameter in the directory *%programdata%\Sevitec\OneConnexx\AddInData*.
