---
layout: page
title: MailSender
permalink: "addins/de/mailsender/"
---

Das MailSender Add-In versendet E-Mails. Der Inhalt und Betreff der E-Mail werden als Parameter im Ereignis an das MailSender Add-In übermittelt. Das MailSender Add-In unterstützt Authentifizierung mittels Benutzername und Passwort über SSL/TLS.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Logic |
| Schnittstellen | In: Ereignis (Parameter "message", "subject", "isHtml", "attachments", "recipients")<br/> Out: E-Mail |
| Transaktionen | 1 wenn erfolgreich |
| Ereignisse | &lt;Instanz&gt;.Done |
| | |
| __Parameter__ | |
| mailServer | Hostname oder IP-Adresse des Mail-Servers |
| port | Port des SMTP Servers (Standard 25, 587 für TLS) |
| useSsl | Gibt an, ob SSL/TLS für die Kommunikation mit dem Mail-Servers verwendet wird |
| useDefaultCredentials | Gibt an, ob der OneConnexx Service-User für die Authentifizierung gegenüber dem SMTP Server verwendet werden soll. Dazu muss der Mail-Server NTLM Authentifizierung unterstützen. |
| userName | Optional der Benutzername für die Authentifizierung gegenüber dem SMTP Server |
| password | Optional das Passwort für die Authentifizierung gegenüber dem SMTP Server |
| recipients | Kommaseparierte Liste von Empfängeradressen|
| sender | E-Mail Adresse des Abenders |
| subjectPrefix | Ein Präfix das der Betreffzeile jedes E-Mails vorangestellt wird (Bsp. "Test - " damit E-Mails des Testsystem sofort erkannt werden) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |


<!-- 
### Anwendungsbeispiele 

ToDo
-->

