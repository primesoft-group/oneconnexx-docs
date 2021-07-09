---
layout: page
title: Dispatcher
permalink: "addins/en/dispatcher/"
language: en
---

The dispatcher add-in triggers events based on an SQL query. For each data record in the result of the SQL query, an event is triggered with the returned columns as parameters.<br /><br />

{:.table .table-striped}
| --- | --- |
| __features__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-in type | Event / Logic |
| Interfaces |  |
| Transactions | 1 if at least 1 record was returned |
| Events | Per data record: &lt;Instance&gt; (parameter = all columns of the result of the SQL query)<br />1x at the end: &lt;Instance&gt;.Done |
| | |
| __parameter__ | |
| connectionString | 	Database connection string |
| query | SQL query<br />An event is triggered for each row returned. |
| dueTimeColumn | Name of the column that contains a time of day at which the data record is to be processed (optional, default = "") |
| lastProcessedColumn | Name of the column that contains a time stamp of when the data record was last processed (optional, default = "") |
| updateQuery | SQL command to update the time stamp (in 'lastProcessedColumn') after a data record has been processed (Optional, Default = "")<br />Placeholders in curly brackets are replaced by the corresponding fields from the result of the SQL query "query". |
| configUrl | Link to the extended configuration (Optional, Default = "")<br />The placeholder @instance is replaced by the name of the add-in instance. |
| endpoint | Name of the endpoint that is used in the transaction (optional, default = "") |

### Application examples

The dispatcher add-in is called every hour by a timer add-in. It queries the content of a specific table with a specific status or other specific information. In this way, new entries are recognized and can be processed further. In the response, the dispatcher add-in receives further information that is required for further processing. 
The dispatcher add-in triggers an event for each entry, which can be subscribed to by other add-ins.

##### Run at certain times of the day

*Requirement:* A database table "Dispatcher" with at least the columns "DispatcherId" of type "int", "DueTime" of type "nvarchar" and "LastProcessed" of type "datetime".

*Parameter:*
* dueTimeColumn = "DueTime"
* lastProcessedColumn = "LastProcessed"
* updateQuery = "UPDATE Dispatcher SET LastProcessed = GETDATE() WHERE DispatcherId = {DispatcherId}"

*How it works:* For each line in the result of the SQL query, an event is only triggered if the current time of day is greater than the time in "DueTime" and the last execution (in "LastProcessed") is not within the current day. If an event was triggered, the current time is written in the "LastProcessed" column.
