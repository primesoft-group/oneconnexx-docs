---
layout: page
title: Xls2Csv
permalink: "addins/de/xls2csv/"
language: de
---

Das Xls2Csv Add-In konvertiert eine Excel-Datei (.xls oder .xlsx) in eine CSV Datei.
Falls die Excel-Datei mehrere Arbeitsmappen enthält wird nur die erste konvertiert.
Die erzeugte CSV-Datei hat denselben Namen wie die Excel-Datei, nur wird die Dateiendung auf CSV geändert.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Logic |
| Schnittstellen | In: Excel-Datei<br /> Out: CSV-Datei|
| Transaktionen | 1 pro verarbeitete Datei |
| Ereignisse | Pro erstellte Datei: &lt;Instanz&gt;.Output (Parameter = file) <br />1x am Schluss: &lt;Instanz&gt;.Done |
| | |
| __Parameter__ | |
| sourceDirectory | Verzeichnis in dem nach Excel-Dateien gesucht wird | 
| sourceFilePattern | Suchmuster mit dem nach Excel-Dateien gesucht wird (Default = *.xlsx) | 
| delimiter | Trennzeichen in der CSV-Datei (Optional, Default = Semikolon) | 
| dateTimePattern | Optionales Format mit dem Datum-/Zeitwerte in der CSV Datei formatiert werden (z.B. dd.MM.yyyy) | 
| destinationDirectory | Zielverzeichnis in das CSV Dateien geschrieben werden. Wenn leer werden die Dateien im Quellverzeichnis erstellt. | 
| overwrite | Gibt an, ob eine bestehende CSV Datei überschrieben werden soll. Wenn 'false', wird eine Zahl an den Dateinamen angehängt so dass dieser eindeutig wird. | 
| deleteSourceFile | Gibt an, ob die Eingangsdatei nach erfolgreicher Konvertierung gelöscht werden soll | 
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |
 
 
### Anwendungsbeispiele 

##### Quelldatei über "file" Parameter

Wird das Xls2Csv Add-In über ein Ereignis aktiviert das einen Parameter "file" enthält, wird die Datei in diesem Parameter als Excel-Datei interpretiert und in eine CSV-Datei umgewandelt. In diesem Fall werden die konfigurierten Parameter "sourceDirectory" und "sourceFilePattern" ignoriert.

Ereignisse mit "file" Parameter können von folgenden Add-Ins abonniert werden:
* FileDecompressor
* FileCopy
* FileSystemWatcher
