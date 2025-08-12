---
layout: page
title: ScriptRunner
permalink: "addins/en/scriptrunner/"
language: en
---

The ScriptRunner Add-In runs any program or script.

{:.table .table-striped}
| --- | --- |
| __features__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Logic |
| Interfaces | In: Event ("file" Parameter)<br /> Out: started process |
| Transactions | 1 per execution |
| Events | &lt;Instanz&gt;.Done |
| | |
| __parameter__ | |
| command | Program that is started. | 
| arguments | Optional arguments for program. Placeholders: {file}, {fileWithoutExt} | 
| timeOut | Timeout in milliseconds after which the program will be terminated. (Default = 60000) | 
| useShellExecute | Whether to use the operating system shell to execute the command. | 
| useExitCode | Whether to require a specific ExitCode for a successful tranaction. | 
| exitCode | ExitCode that indicates a successful execution of the program. | 
| endpoint | Optional name of endpoint used in transaction. (Optional, Default = "") |
 
 
### Example

##### Execution of a Powershell script

Powershell scripts (.ps1 files) cannot be run directly. Instead Powershell.exe is started and the script to execute is passed as an argument.

command: powershell\
arguments: -File my_script.ps1

##### Pass a file via "file" pParameter mit Powershell weiterverarbeiten

If the ScriptRunner add-in is activated via an event that contains a "file" parameter, this parameter can be used as a placeholder in the program arguments.

command: powershell\
arguments: -File mein_skript.ps1 -InputFile {file}

Events with a "file" parameter can be subscribed from the following add-ins:
* DatabaseToCsv
* FileDecompressor
* FileCopy
* FileSystemWatcher
