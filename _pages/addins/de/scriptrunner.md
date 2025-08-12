---
layout: page
title: ScriptRunner
permalink: "addins/de/scriptrunner/"
language: de
---

Das ScriptRunner Add-In führt ein beliebiges Program oder Skript aus.

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Logic |
| Schnittstellen | In: Ereignis ("file" Parameter)<br /> Out: Gestarteter Prozess|
| Transaktionen | 1 pro Aufruf |
| Ereignisse | &lt;Instanz&gt;.Done |
| | |
| __Parameter__ | |
| command | Programm das gestartet wird | 
| arguments | Optionale Argumente die an das Programm übergeben werden. Platzhalter: {file}, {fileWithoutExt} | 
| timeOut | Timeout in Millisekunden nach dem das Programm gestoppt wird, Default = 60000n) | 
| useShellExecute | Gibt an, ob die Shell des Betriebssystems verwendet werden soll um den Befehl auszuführen. | 
| useExitCode | Gibt an, ob ein bestimmter ExitCode verlangt wird für eine erfolgreiche Transaktion. | 
| exitCode | ExitCode der eine erfolgreiche Ausführung des Programms anzeigt. | 
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |
 
 
### Anwendungsbeispiele

##### Ausführen eines Powershell Skripts

Powershell-Skripte (.ps1 Dateien) können nicht direkt ausgeführt werden. Stattdessen wir Powershell.exe aufgerufen und das auszuführende Skript übergeben.
command: powershell
arguments: -File mein_skript.ps1

##### Datei über "file" Parameter mit Powershell weiterverarbeiten

Wird das ScriptRunner Add-In über ein Ereignis aktiviert das einen Parameter "file" enthält, kann dieser Parameter als Platzhalter in den Programmargumenten verwendet werden.

command: powershell
arguments: -File mein_skript.ps1 -InputFile {file}

Ereignisse mit "file" Parameter können von folgenden Add-Ins abonniert werden:
* FileDecompressor
* FileCopy
* FileSystemWatcher
