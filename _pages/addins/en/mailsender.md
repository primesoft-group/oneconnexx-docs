---
layout: page
title: MailSender
permalink: "addins/en/mailsender/"
language: en
---

The MailSender add-in sends emails. The content and subject of the e-mail are sent to the MailSender add-in as parameters in the event. The MailSender add-in supports authentication using a username and password over SSL / TLS.<br /><br />
Connections to mail servers that expect an encrypted SSL connection (usually on port 465) from the start are not supported. Instead, an unencrypted connection is first established (usually on port 587) and then the encryption is initiated using the STARTTLS command.
<br/><br/>

{:.table .table-striped}
| --- | --- |
| __features__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-in type | Logic |
| Interfaces | In: Event (parameters “message”, “subject”, “isHtml”, “attachments”, “recipients”)<br/> Out: E-Mail |
| Transactions | 1 if successful |
| Events | &lt;Instance&gt;.Done |
| | |
| __parameter__ | |
| mailServer | Host name or IP address of the mail server |
| port | Port of the SMTP server (optional, standard = 25) |
| useSsl | Specifies whether the connection to the mail server should be encrypted using TLS |
| useDefaultCredentials | Specifies whether the OneConnexx service user should be used for authentication against the SMTP server. For this, the mail server must support NTLM authentication. |
| userName | Username for authentication to the SMTP server (optional) |
| password | Password for authentication to the SMTP server (optional) |
| recipients | Comma-separated list of recipient addresses can be overwritten by a parameter in the triggering event |
| sender | Email address of the evening |
| subjectPrefix | A prefix that is placed in front of the subject line of every email (e.g. "Test -" so that emails from the test system are recognized immediately) |
| endpoint | Name of the end point that is used in the transaction (optional, default = “”) |


<!-- 
### Anwendungsbeispiele 

ToDo
-->

