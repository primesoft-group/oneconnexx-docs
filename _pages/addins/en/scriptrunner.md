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
| Schnittstellen | In: Event ("file" Parameter)<br /> Out: started process |
| Transaktionen | 1 per execution |
| Ereignisse | &lt;Instanz&gt;.Done |
| | |
| __parameter__ | |
| command | Program that is started. | 
| arguments | Optional arguments for program. Placeholders: {file}, {fileWithoutExt} | 
| timeOut | Timeout in milliseconds after which the program will be terminated. (Default = 60000) | 
| useShellExecute | Whether to use the operating system shell to execute the command. | 
| useExitCode | Whether to require a specific ExitCode for a successful tranaction. | 
| exitCode | ExitCode that indicates a successful execution of the program. | 
| endpoint | Optional name of endpoint used in transaction. (Optional, Default = "") |
 
 
### Anwendungsbeispiele

##### Ausführen eines Powershell Skripts

Powershell-Skripte (.ps1 Dateien) können nicht direkt ausgeführt werden. Stattdessen wird Powershell.exe aufgerufen und das auszuführende Skript als Parameter übergeben.

command: powershell\
arguments: -File mein_skript.ps1

##### Datei über "file" Parameter mit Powershell weiterverarbeiten

Wird das ScriptRunner Add-In über ein Ereignis aktiviert das einen Parameter "file" enthält, kann dieser Parameter als Platzhalter in den Programmargumenten verwendet werden.

command: powershell\
arguments: -File mein_skript.ps1 -InputFile {file}

Ereignisse mit "file" Parameter können von folgenden Add-Ins abonniert werden:
* FileDecompressor
* FileCopy
* FileSystemWatcher
