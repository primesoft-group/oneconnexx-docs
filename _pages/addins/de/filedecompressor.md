---
layout: page
title: FileDecompressor
permalink: "addins/de/filedecompressor/"
---

Das FileDecompressor AddIn entpackt Zip-, GZip-, oder Tar-Dateien<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | |
| AddIn Type | Logic |
| Schnittstellen | In/Out: Dateieverzeichnis |
| Transaktionen | 1 pro erstellte Datei |
| Ereignisse | Pro erstellte Datei: &lt;Instanz&gt;.Output (Parameter = file)<br /> &lt;Instanz&gt;.Done |
| | |
| __Parameter__ | |
| sourceDirectory | Quellverzeichnis mit den komprimierten Dateien |
| sourceFilePattern | Das Dateipattern dient zur Einschränkung der komprimierten Dateien<br /> * = alles; Bsp. «*.zip» => alle ZIP-Dateien<br />? = unsicher wie die Datei heisst. Bsp. «1?.zip» => alle ZIP-Dateien welche mindestens eine 1 beinhalten. <br />Mehrere Pattern werden mit Semikolon getrennt. Bsp. «*.zip; *.tar» => alle ZIP- und TAR-Dateien |
| destinationDirectory | Zielverzeichnis, wohin die Dateien entpackt werden |
| archivePassword | Zum automatischen Entpacken von passwortgeschützten Archiven (Optional) |
| deleteSourceAfterProcessing | true = Die komprimierte Datei wird nach dem Entpacken gelöscht (Default = false) | 
| decompressToSubFolder | true = Die Dateien werden in ein Unterverzeichnis mit demselben Namen wie das Archiv entpackt <br /> false = Die Dateien werden direkt in das Zielverzeichnis entpackt (Default = false)|
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |

<!-- 
### Anwendungsbeispiele 

ToDo
-->

