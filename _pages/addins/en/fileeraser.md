---
layout: page
title: FileEraser
permalink: "addins/en/fileeraser/"
language: en
---

Das FileErase Add-In löscht oder verschiebt Dateien in einem bestimmten Verzeichnis.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Logic |
| Schnittstellen | In/Out: Dateiverzeichnis |
| Transaktionen | 1 wenn mindestens 1 Datei erfolgreich gelöscht/verschoben |
| Ereignisse | &lt;Instanz&gt;.Done |
| | |
| __Parameter__ | |
| timeoutDays | Anzahl Tage nach denen Dateien gelöscht/verschoben werden |
| directory | Das zu überwachende Verzeichnis |
| pattern | Das Suchmuster für die zu löschenden/verschiebenden Dateien<br />Die Platzhalter * und ? können wie von Windows gewohnt benutzt werden. Mehrere Suchmuster können durch Semikolon getrennt angegeben werden. Bsp.: "\*.txt;\*.xml" => alle Text und XML Dateien. |
| useCreateInsteadModifyDate | true = Das Erstellungsdatum anstelle des Änderungsdatums wird geprüft (Optional, Default = false) |
| destinationDirectory | Zielverzeichnis, in welches die Dateien verschoben werden, anstatt sie zu löschen (Optional) |
| userName | Benutzer mit dem auf die Verzeichnisse "directory" und "destinationDirectory" zugegriffen wird (Optional) |
| password | Zugehöriges Passwort (Optional) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |

### Anwendungsbeispiele 

Ein FileCopy Add-In kann alle kopierten Dateien zusätzlich in einem Verzeichnis archivieren. Um zu verhindern dass die Festplatte vollgeschrieben wird, können mit Hilfe eines FileEraser Add-Ins alle archivierten Dateien nach z.B. 30 Tagen automatisch gelöscht werden.
