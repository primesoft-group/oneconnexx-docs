---
layout: page
title: ListToCSV
permalink: "addins/de/list2csv"
---

Mit dem ListToCSV Add-In können Sharepoint-Online Listen oder Views in eine CSV-Datei exportiert werden. 

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Logic |
| Schnittstellen | In: Sharepoint-Liste <br /> Out: CSV-Datei |
| Transaktionen |  |
| Ereignisse |  |
| | |
| __Parameter__ | |
| spSiteUrl | Die URL zur Sharepoint-Seite |
| spListName | Der Name der Sharepoint-Liste auf der Sharepoint-Seite |
| spViewName | (Optional)Der Name der Sharepoint-View für die oben angegeben Liste. Wird dieses Feld leer gelassen, so wird eine Standardview benutzt. |
| spUser | Der Benutzername zur Authentisierung auf Sharepoint |
| spPassword |  Das Passwort zur Authentisierung auf Sharepoint |
| fileSaveLocation | Der komplette Speicherpfad der CSV-Datei. |
| customHeader | (Optional) Header für die erste Zeile im CSV. Jeder Wert muss durch ein ',' getrennt werden. Wenn leer gelassen, werden die internen Sharepoint-Überschriften benutzt.  |
| delimiter | Das CSV-Trennzeichen |
| entriesToExport | Legt fest, ob alle Einträge oder nur solche, welche nach der letzten Ausführung dazugekommen sind, exportiert werden. |
