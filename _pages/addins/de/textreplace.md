---
layout: page
title: TextReplace
permalink: "addins/de/textreplace/"
---

Das TextReplace Add-In ersetzt mit Hilfe Regulärer Ausdrücke Teile einer Textdatei. Ausserdem kann der Zeichensatz einer Textdatei konvertiert werden.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Logic |
| Schnittstellen | In/Out: Dateiverzeichnis |
| Transaktionen | 1 wenn erfolgreich |
| Ereignisse | n/a |
| | |
| __Parameter__ | |
| expression | Liste mit Regulären Ausdrücken (einer pro Zeile) die in der Eingabedatei gesucht werden |
| replacement | Liste von Werten mit denen die gefundenen Zeichenketten ersetzt werden (einer pro Zeile) |
| inputEncoding | Zeichencodierung der Eingabedatei (z.B. 'UTF-8', 'ISO-8859-1') (Optional, Default = "UTF-8") |
| outputEncoding | Zeichencodierung der Ausgabedatei (z.B. 'UTF-8', 'ISO-8859-1') (Optional, Default = "UTF-8") |
| writeBom | Gibt an ob eine 'byte order mark' (BOM) geschrieben wird wenn 'outputEncoding' auf 'UTF-8' gesetzt ist (Optional, Default = true) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |

### Anwendungsbeispiele 

Das TextReplace Add-In erhält den Namen der zu bearbeitenden Datei im abonnierten Ereignis im "file" Parameter. Dieser Parameter wird von folgenden Add-Ins bereitgestellt:

* DatabaseToCsv (im Output Ereignis)
* FileCopy (im Output oder Filter Ereignis)
* FileSystemWatcher 
* Xls2Csv (im Output Ereignis)
* Xml2Csv (im Output Ereignis)
* FileDecompressor (im Output Ereignis)
* FileReconstructor (im Output Ereignis)
* Ldap2CSV (im Done Ereignis)


### Zeichensatz

Wenn der Parameter "inputEncoding" auf "UTF-8" festgelegt wurde, und die zu verarbeitende Datei in einem anderen Fromat vorliegt, dann wird automatisch versucht die Datei im Standard-Zeichensatz des Systems (normalerweise ISO-8859-1) einzulesen.



