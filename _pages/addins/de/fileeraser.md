---
layout: page
title: FileEraser
permalink: "addins/de/fileeraser/"
---

Das FileErase AddIn löscht oder verschiebt Dateien in einem bestimmten Verzeichnis.

## Merkmale

{:.table .table-striped}
| --- | --- |
| AddIn Type | Logic |
| Schnittstellen | In/Out: Dateieverzeichnis |
| Transaktionen | 1 wenn mind. 1 Datei gelöscht/verschoben und keine Fehler |
| Ereignisse | &lt;Instanz&gt;.Done |


## Parameter

{:.table .table-striped}                    
| --- | --- |
| timeoutDays | Dateien, wo die letzte Änderung länger als "timoutDays" Tage zurückliegt, werden gelöscht/verschoben |
| directory | Zu überwachendes Verzeichnis |
| pattern | Das Dateipattern dient zur Einschränkung der zu behandelnden Dateien<br /> * = alles; Bsp. «*.txt» => alle Dateien mit Endung .txt <br />? = unsicher wie die Datei heisst. Bsp. «1?.txt» => alle Text Dateien welche mindestens eine 1 beinhalten. <br />Mehrere Pattern werden mit Semikolon getrennt. Bsp. «*.txt; *.xml» => alle Text und XML Dateien. |
| useCreateInsteadModifyDate | true = Das Erstellungsdatum anstelle des Änderungsdatums überprüfen. (Optional, Default = false) |
| destinationDirectory | Zielverzeichnis, in welches die Dateien verschoben werden, anstatt sie zu löschen (Optional) |
| userName | Benutzer mit den für das Zielverzeichnis erforderlichen Berechtigungen (Optional) |
| password | Zugehöriges Passwort (Optional) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |

<!-- 
## Anwendungsbeispiele 

ToDo
-->

