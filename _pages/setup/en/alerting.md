---
layout: page
title: Alerting-Service
permalink: "setup/en/alerting/"
language: en
---

### Installation packages
Installation packages are provided by Sevitec in the form of 7-zip archives. The following packages are required:

* ocx-alertingservice.7z

Copy the required installation package to the server in the directory *&lt;Drive&gt;:\OneConnexx\Install* .

Extract the contents of the installation package to *&lt;Drive&gt;:\OneConnexx\AlertingService* .

When you first install the file *OneConnexx.AlertingService.exe.config.sevitec* in *OneConnexx.AlertingService.exe.config* rename.

This creates the following directory structure:

```
\OneConnexx
 |-AlertingService
```

{% The alerting service only needs to be installed in one instance. It can monitor multiple OneConnexx installations and databases." %}

### Install service
The Alerting Windows service is installed via the command prompt (Windows console). The command prompt must be opened as an administrator.

Change to the «AlertingService» subdirectory and install the service:

```
cd \OneConnexx\AlertingService
OneConnexx.AlertingService.exe –install –servicename=OneConnexx.Alerting
```

To uninstall:

```
OneConnexx.AlertingService.exe –uninstall –servicename=OneConnexx.Alerting
```

In a company network, it is recommended to create a separate user for the alerting service under which the service is installed. 
To run the service under this user, proceed as follows:

```
sc config OneConnexx.Alerting obj= "<Username>" password= "<Passwort>"
```

* Replace *OneConnexx.Alerting* with the name under which the service was installed
* \<Username\> must be written in the form *domain\Username* for a domain user and in the form *.\Username* for a local user
* What is important is the distance to <code>obj=</code> or from <code>password=</code>

Important: The domain user must have Modify and Write rights to the logs subdirectory.

### configuration

##### OneConnexx.AlertingService.exe.config

The following parameters must be configured in the configuration file *&lt;Drive&gt;:\OneConnexx\AlertingService\OneConnexx.AlertingService.exe.config* :

* connectionStrings: The connection string to the database. If the AlertingService Windows service runs under a domain user, «Integrated Security» should be selected. If the AlertingService is to monitor several databases, several connection strings can be specified.
* nlog: Configuration of the logging of the alerting service. By default, the oneconnexx.alerting.log file is logged in the logs subdirectory .
* MailSenderDefaultTimeout: Interval in milliseconds in which mails are sent (standard: 30000, every 30 seconds).
* RuleCheckerDefaultTimeout: Interval in milliseconds in which rule violations are checked (standard: 60000, every minute).
* MailSenderDefaultFrom: sender address of the sent emails.
* MailSenderClientServer: IP address or host name of the mail server for outgoing e-mails.
* MailSenderClientPort: Port of the mail server (default: 25).
* MailSenderClientTimeout: Timeout in milliseconds for sending emails.
* MailSenderClientSsl: True = use SSL, False = no SSL (default: False).
* MailSenderClientUserName: Optionally the user name for the mail server.
* MailSenderClientUserPassword: Optionally a password for the mail server.

