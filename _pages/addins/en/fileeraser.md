---
layout: page
title: FileEraser
permalink: "addins/en/fileeraser/"
language: en
---

The FileErase Add-In deletes or moves files in a specific directory.<br /><br />

{:.table .table-striped}
| --- | --- |
| __features__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-in type | Logic |
| Interfaces | In/Out: file directory |
| Transactions | 	1 if at least 1 file was successfully deleted / moved |
| Events | &lt;instance&gt;.Done |
| | |
| __parameter__ | |
| timeoutDays | Number of days after which files are deleted / moved |
| directory | The directory to be monitored |
| pattern | The search pattern for the files to be deleted / moved<br />The placeholders * and? can be used as usual with Windows. Several search patterns can be specified separated by semicolons. Example: "\*.txt;\*.xml" => all text and XML files. |
| useCreateInsteadModifyDate | true = The creation date instead of the modification date is checked (optional, default = false) |
| destinationDirectory | Target directory to which the files will be moved instead of being deleted (optional) |
| userName | User with which the directories "directory" and "destinationDirectory" are accessed (optional) |
| password | Associated password (optional) |
| endpoint | 	Name of the endpoint that is used in the transaction (optional, default = "") |

### Application examples

A FileCopy Add-In can also archive all copied files in a directory. In order to prevent the hard disk from being filled up, all archived files can be automatically deleted after 30 days, for example, with the help of a FileEraser add-in.
