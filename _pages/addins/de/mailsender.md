---
layout: page
title: MailSender
permalink: "addins/de/mailsender/"
---


Das MailSender AddIn versendet E-Mails.
Der Inhalt der E-Mail wird mit dem Event an das MailSender AddIn übermittelt.
Weitere Angaben wie Empfänger, Sender und Betreff können auch übermittelt werden, können aber auch im AddIn selbst konfiguriert werden.

## Merkmale

{:.table .table-striped}
| --- | --- |
| AddIn Type | Logic |
| Schnittstellen | Out: E-Mail |
| Transaktionen | 1 wenn erfolgreich |
| Ereignisse | <Instanz>.Done |
| Ereignis-Parameter |  |

## Parameter

{:.table .table-striped}
| --- | --- |
| mailServer | Host Name oder URL des Mail Servers |
| recipients | E-Mail Adressen der Empfänger. Mehrere E-Mails werden mit "," getrennt |
| sender | E-Mail Adresse des Abenders |
| subjectPrefix | Betreff |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional) | |


<!-- 
## Anwendungsbeispiele 

ToDo
-->

