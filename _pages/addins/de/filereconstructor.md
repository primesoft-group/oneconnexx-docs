---
layout: page
title: FileReconstructor
permalink: "addins/de/filereconstructor/"
---

Das FileReconstructor AddIn liest eine existierende Datei und erstellt anhand des Dateiinhalts und anhand konfigurierter Regeln eine neue Datei.
Die Regeln beinhalten das Einfügen und Ersetzen von Texten.

## Merkmale

{:.table .table-striped}
| --- | --- |
| AddIn Type | Logic |
| Schnittstellen | In/Out: Dateieverzeichnis |
| Transaktionen | 1 pro erstellte Datei |
| Ereignisse | Pro erstellte Datei: <Instanz>.Output (Parameter = file) <br /><Instanz>.Done |


## Parameter

{:.table .table-striped}
| --- | --- |
| inputFile | Quelldatei inkl. Verzeichnis. Mehrere Dateien möglich (Optional) |
| outputFile | Zieldatei. Platzhalter : <br /> {now}: Aktuelles Datum<br />	{file}: Filename der Inputdatei  |
| outputPath | Zielverzeichnis(Optional, Default = "") |
| reconfiguration | Konvertierungs-Regeln.<br />Eingabe entweder mit Hochkomatas oder mit Hochkommas.<br />Oder innerhalb geschweiften Klammern Start Kolonne, End Kolonne, Länge, Auffüll Buchstabe und die Horizontale Ausrichtung angeben.<br />Anwendungsbeispiele beachten. |
| deleteInputFile | true = Quelldatei wird gelöscht (Optional, Default = false) |
| userName | Benutzer mit den für die Zieldatei erforderlichen Berechtigungen (Optional) |
| password | Zugehöriges Passwort (Optional) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |

## Anwendungsbeispiele

### Schlüsseltexte bei fixer Spaltebreite:
Die Zieldatei ist eine Text-Datei mit folgendem Aufbau:<br />
- Datensätze zu je 6 Feldern mit folgenden Feldlängen: 2,20,20,15,20,121
- Feld-Inhalte pro Datensatz: Schlüssel „01“; Währungskürzel dreistellig, Gegenwährungskürzel dreistellig, Schlüssel „D“, Datum im Format „ddmmyyyy“, FX-Kurs im Format *#.####

reconfiguration = "01"{0,3,20,}{3,6,20}"D"{0,0,14}{163,165}{161,163}{157,161,16}{171,191,121}

