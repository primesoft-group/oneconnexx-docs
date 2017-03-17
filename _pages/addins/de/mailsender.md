---
layout: page
title: MailSender
permalink: "addins/de/mailsender/"
---

Das MailSender Add-In versendet E-Mails. Der Inhalt der E-Mail wird mit dem Event an das MailSender Add-In übermittelt. Weitere Angaben wie Empfänger, Sender und Betreff können auch übermittelt werden, können aber auch im Add-In selbst konfiguriert werden.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Logic |
| Schnittstellen | Out: E-Mail |
| Transaktionen | 1 wenn erfolgreich |
| Ereignisse | &lt;Instanz&gt;.Done |
| | |
| __Parameter__ | |
| mailServer | Hostname oder IP Adresse des Mail-Servers |
| recipients | Kommaseparierte Liste von Empfängeradressen|
| sender | E-Mail Adresse des Abenders |
| subjectPrefix | Ein Präfix das der Betreffzeile jedes E-Mails vorangestellt wird (Bsp. "Test - " damit E-Mails des Testsystem sofort erkannt werden) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |


<!-- 
### Anwendungsbeispiele 

ToDo
-->

