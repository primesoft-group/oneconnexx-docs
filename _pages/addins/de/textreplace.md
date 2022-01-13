---
layout: page
title: TextReplace
permalink: "addins/de/textreplace/"
language: de
---

Das TextReplace Add-In kann verwendet werden um in einer Textdatei bestimmte Zeichenfolgen zu ersetzen. Dabei wird die Datei zeilenweise eingelesen und die zu ersetzenden Zeichenfolgen können über Reguläre Ausdrücke definiert werden. Ausserdem kann der Zeichensatz einer Textdatei konvertiert werden.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Logic |
| Schnittstellen | In/Out: Datei ("file" Parameter) |
| Transaktionen | 1 wenn erfolgreich |
| Ereignisse | n/a |
| | |
| __Parameter__ | |
| expression | Liste mit Regulären Ausdrücken (einer pro Zeile) die in der Eingabedatei gesucht werden |
| replacement | Liste von Werten mit denen die gefundenen Zeichenketten ersetzt werden (einer pro Zeile) |
| inputEncoding | Zeichencodierung der Eingabedatei (z.B. 'UTF-8', 'ISO-8859-1') (Optional, Default = "UTF-8") |
| outputEncoding | Zeichencodierung der Ausgabedatei (z.B. 'UTF-8', 'ISO-8859-1') (Optional, Default = "UTF-8") |
| writeBom | Gibt an ob eine 'byte order mark' (BOM) geschrieben wird wenn 'outputEncoding' auf 'UTF-8' gesetzt ist (Optional, Default = true) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = ""). Wenn "endpoint" mit *** beginnt wird der Wert der aufrufenden Instanz verwendet. |

### Anwendungsbeispiele 

Die Parameter "expression" und "replacement" können mehrzeiligen Text enthalten. Pro Zeile muss in "expression" ein Regulärer Ausdruck und in "replacement" ein Ersatztext angegeben werden. Beide Parameter müssen dieselbe Anzahl Zeilen beinhalten.

{:.table .table-striped}
| expression | replacement ||
| encoding="ISO-8859-1" | encoding="UTF-8" | Ersetzt den Ausdruck __encoding="ISO-8859-1"__ durch __encoding="UTF-8"__. |
| ([^=])(") | $1&amp;quot; | Ersetzt alle vorkommen von __"__ (Gruppe 2) die nicht nach einem __=__ (Gruppe 1) stehen durch __&amp;quot;__ |

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

Wenn der Parameter "inputEncoding" auf "UTF-8" festgelegt wurde, und die zu verarbeitende Datei in einem anderen Format vorliegt, dann wird automatisch versucht die Datei im Standard-Zeichensatz des Systems (normalerweise ISO-8859-1) einzulesen.



