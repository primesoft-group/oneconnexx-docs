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
| Ereignisse | &lt;Instanz&gt;.Done |

## Parameter

{:.table .table-striped}
| --- | --- |
| mailServer | Hostname oder IP Adresse des Mail-Servers |
| recipients | Kommaseparierte Liste von Empfängeradressen|
| sender | E-Mail Adresse des Abenders |
| subjectPrefix | Ein Präfix das der Betreffzeile jedes E-Mails vorangestellt wird (Bsp. "Test - " damit E-Mails des Testsystem sofort erkannt werden) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |


<!-- 
## Anwendungsbeispiele 

ToDo
-->

