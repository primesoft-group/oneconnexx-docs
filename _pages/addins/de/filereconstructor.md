---
layout: page
title: FileReconstructor
permalink: "addins/de/filereconstructor/"
---

Das FileReconstructor AddIn liest eine existierende Datei und erstellt anhand des Dateiinhalts und anhand konfigurierter Regeln eine neue Datei.
Mit dem FileReconstructor AddIn werden Texte anhand von Regeln eingefügt oder ersetzt. 

## Merkmale

{:.table .table-striped}
| --- | --- |
| AddIn Type |  |
| Schnittstellen |  |
| Transaktionen | 1 pro erstellte Datei |
| Ereignisse | <Instanz>.Done <br />Pro erstellte Datei: <Instanz>.Output |
| Ereignis-Parameter | Datei |


## Parameter

{:.table .table-striped}
| --- | --- |
| inputFile | Dateiname inkl. Pfad der Quelldatei. Mehrere Dateien möglich (Optional) |
| outputFile | Filename des Files, in welches geschrieben werden soll (Optional). Platzhalter : <br /> {now}: Aktuelles Datum<br />	{file}: Filename der Inputdatei  |
| Reconfiguration | Text, welcher neu in die Datei geschrieben werden soll. Eingabe entweder mit Hochkomatas oder mit Hochkommas. Andere Möglichkeit innerhalb geschweiften Klammern Start Kolonne, End Kolonne, Länge, Auffüll Buchstabe und die Horizontale Ausrichtung angeben.  |
| deleteInputFile | true = Quelldatei wird gelöscht<br /> false = Quelldatei wird nicht gelöscht (Default = false) |
| userName | Benutzer mit den für die Zieldatei erforderlichen Berechtigungen (Optional) |
| password | Zugehöriges Passwort (Optional) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional) |

## Anwendungsbeispiele

Folgende Beispiel zeigen die verschiedenen Möglichkeiten des Parameters Reconfiguration:
1. Mit Hochkomatas oder mit Hochkommas
2. Innerhalb geschweiften Klammern Start Kolonne, End Kolonne, Länge, Auffüll Buchstabe und die Horizontale Ausrichtung

