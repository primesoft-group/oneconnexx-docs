---
layout: page
title: MailSender
permalink: "addins/de/mailsender/"
---

Das MailSender Add-In versendet E-Mails. Der Inhalt und Betreff der E-Mail werden als Parameter im Ereignis an das MailSender Add-In übermittelt. Das MailSender Add-In unterstützt Authentifizierung mittels Benutzername und Passwort über SSL/TLS.<br /><br />
Verbindungen zu Mail-Servern die von Anfang an eine verschlüsselte SSL Verbindung (meist auf Port 465) erwarten, werden nicht unterstützt. Stattdessen wird zuerst eine unverschlüsselte Verbindung (meist auf Port 587) aufgebaut, und dann mittels dem STARTTLS Befehl die Verschlüsselung initiiert.
<br/><br/>

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
| port | Port des SMTP Servers (Optional, Standard = 25) |
| useSsl | Gibt an, ob die Verbindung zum Mail-Server mittels TLS verschlüsselt werden soll |
| useDefaultCredentials | Gibt an, ob der OneConnexx Service-User für die Authentifizierung gegenüber dem SMTP Server verwendet werden soll. Dazu muss der Mail-Server NTLM Authentifizierung unterstützen. |
| userName | Benutzername für die Authentifizierung gegenüber dem SMTP Server (Optional) |
| password | Passwort für die Authentifizierung gegenüber dem SMTP Server (Optional) |
| recipients | Kommaseparierte Liste von Empfängeradressen|
| sender | E-Mail Adresse des Abenders |
| subjectPrefix | Ein Präfix das der Betreffzeile jedes E-Mails vorangestellt wird (Bsp. "Test - " damit E-Mails des Testsystem sofort erkannt werden) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |


<!-- 
### Anwendungsbeispiele 

ToDo
-->

