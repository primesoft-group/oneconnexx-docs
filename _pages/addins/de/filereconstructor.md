---
layout: page
title: FileReconstructor
permalink: "addins/de/filereconstructor/"
---

Das FileReconstructor AddIn liest eine existierende Datei ein, formt zeilenweise den Inhalt anhand konfigurierten Regeln um und schreibt die rekonstruierten Zeilen in eine neue Datei.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | |
| AddIn Type | Logic |
| Schnittstellen | In/Out: Dateieverzeichnis |
| Transaktionen | 1 pro erstellte Datei |
| Ereignisse | Pro erstellte Datei: &lt;Instanz&gt;.Output (Parameter = file) <br />&lt;Instanz&gt;.Done |
| | |
| __Parameter__ | |
| inputFile | Quelldatei inkl. Verzeichnis. Mehrere Dateien möglich (Optional) |
| reconfiguration | Zeilenweise angewandte Konvertierungsregeln.<br />1. Fix Text: Eingabe in Hochkommas (') oder Anführungszeichen (")<br />2. Verweis auf Ursprungszeile: Geschweifte Klammern im Format {Index Start-Zeichen, Index End-Zeichen, [Textlänge], [Auffüll-Zeichen], [Horizontale Ausrichtung]}<br />&nbsp;&nbsp;a. Sofern die Textlänge nicht angegeben ist, wird diese auf dem End- und Start-Index berechnet.<br />&nbsp;&nbsp;b. Falls kein End-Index angegeben ist, wird dieser auf dem Start-Index und der Textlänge berechnet.<br />&nbsp;&nbsp;c. Liegt der End-Index ausserhalb der eigentlichen Zeilenlänge, wird der Index des letzten Zeichens der Zeile verwendet.<br />&nbsp;&nbsp;d. Ist die Textlänge grösser der Differenz des End- und Start-Index wird das Auffüllzeichen verwendet (Default = Space).<br />&nbsp;&nbsp;e. Das Auffüllzeichen wird je nach Ausrichtung ('left'/'l' (Standard) oder 'right'/'r') rechts beziehungsweise links eingefügt. |
| outputFile | Zieldatei. Platzhalter : <br /> {now}: Aktuelles Datum<br />	{file}: Filename der Inputdatei |
| outputPath | Zielverzeichnis(Optional, Default = "") |
| deleteInputFile | true = Quelldatei wird gelöscht (Optional, Default = false) |
| userName | Benutzer mit den für die Zieldatei erforderlichen Berechtigungen (Optional) |
| password | Zugehöriges Passwort (Optional) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |


## Anwendungsbeispiele

### Schlüsseltexte bei fixer Spaltebreite:
Die Eingabedatei enthält Spalten mit fixer breite, Inhalt sieht folgendermassen aus:
EUR1000     CHF1072
EUR400      USD430

Die Ausgabedatei soll aus 6 Spalten bestehen und mittels Semikolon separiert sein:
TO;CHF;**1072;FROM;EUR;1000  
TO;USD;***430;FROM;EUR;400   

