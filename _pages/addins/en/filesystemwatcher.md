---
layout: page
title: FileSystemWatcher
permalink: "addins/en/filesystemwatcher/"
language: en
---

The FileSystemWatcher Add-In is used to monitor directories and files. The monitoring can be restricted to certain files with the help of a search pattern. The creation, modification, renaming and / or deletion of files can be monitored.<br /><br />

{:.table .table-striped}
| --- | --- |
| __features__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-in type | Event / Logic |
| Interfaces | In: file directory |
| Transactions | 1 transaction per event |
| Events | 	One event per recognized change and file: <Instance> (parameter = file, eventType) |
| | |
| __parameter__ | |
| directory | Directory to be monitored as an absolute path |
| usePolling | Type of monitoring<br />true = folder is checked periodically (see "pollingIntervall")<br />false = folder is constantly monitored |
| pollingInterval | if "usePolling" was set to "true", the interval in seconds can be specified here |
| initialPull | true = Generates a "create" event when the OneConnexx pro is started in the file to be monitored |
| includeSubdirectories | true = subdirectories are also monitored |
| filter | The search pattern for restricting the files to be monitored. <br />The placeholders * and? can be used as usual with Windows. |
| bufferSize | Internal buffer size in bytes (default = 8192)<br/>WIf a very large number of files is to be monitored, it may be necessary to increase this value in steps of 4096 up to a maximum of 65536. |
| ensureFileWrittenTimeOut | Maximum time in milliseconds that is waited before the event is triggered until the file has been written. A value of 0 means that there is always a wait until the file can be opened for read operations. |
| createEvent | true = Triggers an event when creating a file |
| changeEvent | true = Triggers an event when changing an existing file |
| deleteEvent | true = Triggers an event when a file is deleted |
| renameEvent | true = Triggers an event when renaming a file |
| endpoint | Name of the end point that is used in the transaction (optional, default = "") |

### Application examples 

Files from an external system are stored in a so-called "drop folder". As soon as a new file has been copied into this directory, OneConnexx should move it to a SharePoint document library.

For this purpose, an instance of the FileSystemWatcher Add-In is created, which monitors the "Dropfolder". Only the "created" event is monitored. If a new file is recognized, the FileSystemWatcher Add-In triggers an event and the path and file name of the new file are passed on to subsequent add-ins in the "file" parameter.

A FileCopy Add-In subscribes to the FileSystemWatcher Add-In event. Since this event contains a parameter "file", this is interpreted as the source file and the file is copied to the configured target system (in this case SharePoint).

##### When to choose "polling"

If "usePolling" is set to "false", mechanisms internal to the operating system are used to monitor the directory. However, it has been shown that this does not always work reliably with network drives if the network connection is unstable. It is generally recommended to leave "usePolling" on "false" and only to switch to "true" if network drives are to be monitored and this does not work properly.

