---
layout: page
title: Alerting-Service
permalink: "setup/de/alerting/"
---

### Installationspakete
Installationspakete werden von Sevitec in Form von 7-zip Archiven zur Verfügung gestellt. Folgende Pakete werden benötigt:

* alertingservice.7z

Das benötigte Installationspaket auf den Server ins Verzeichnis *&lt;Laufwerk&gt;:\OneConnexx\Install* kopieren.

Den Inhalt des Installationspakets nach *&lt;Laufwerk&gt;:\OneConnexx\AlertingService* entpacken.

Bei der Erstinstallation die Datei *OneConnexx.AlertingService.exe.config.sevitec* in *OneConnexx.AlertingService.exe.config* umbenennen.

Dadurch wird folgende Verzeichnisstruktur erstellt:

```
\OneConnexx
 |-AlertingService
```

{% include alert.html type="warning" text="Der Alerting-Service muss nur in einer Instanz installiert werden. Er kann mehrere OneConnexx Installationen und Datenbanken überwachen." %}

### Service installieren
Der Alerting Windows-Dienst wird über die Eingabeaufforderung (Windows Konsole) installiert. Die Eingabeaufforderung muss als
Administrator geöffnet werden.

Ins «AlertingService» Unterverzeichnis wechseln und den Service installieren:

```
cd \OneConnexx\AlertingService
OneConnexx.AlertingService.exe –install –servicename=OneConnexx.Alerting
```

Zum Deinstallieren:

```
OneConnexx.AlertingService.exe –uninstall –servicename=OneConnexx.Alerting
```

In einem Unternehmensnetzwerk wird empfohlen, für den Alerting-Service einen eigenen Benutzer anzulegen unter dem der
Service installiert wird. Es kann derselbe Benutzer wie für den OneConnexx-Service verwendet werden. Dazu muss folgendermassen
vorgegangen werden:

* «Services» öffnen (Windows-Taste -> Services)
* OneConnexx.Alerting -> rechte Maustaste -> Properties -> Log On
* This account: &lt;OneConnexx-User&gt;
* Password: siehe Zugangsdaten des jeweiligen Kunden
* «Services» wieder schliessen

### Konfiguration

##### OneConnexx.AlertingService.exe.config

In der Konfigurationsdatei *&lt;Laufwerk&gt;:\OneConnexx\AlertingService\OneConnexx.AlertingService.exe.config* sind folgende Parameter zu konfigurieren:

* connectionStrings: Der Connection-String zur Datenbank. Wenn der AlertingService Windows-Dienst unter einem Domänenbenutzer läuft, sollte «Integrated Security» gewählt werden. Wenn der AlertingService mehrere Datenbanken überwachen soll, können mehrere Connection-Strings angegeben werden.
* nlog: Konfiguration der Protokollierung des Alerting-Service. Standardmässig wird in eine Datei *oneconnexx.alerting.log* im Unterverzeichnis *logs* protokolliert.
* MailSenderDefaultTimeout: Interval in Millisekunden in dem Mails versendet werden (Standard: 30000, alle 30 Sekunden).
* RuleCheckerDefaultTimeout: Interval in Millisekunden in dem Regelverletzungen geprüft werden (Standard: 60000, jede Minute).
* MailSenderDefaultFrom: Absenderadresse der versendeten E-Mails.
* MailSenderClientServer: IP Adresse oder Hostname des Mailserver für ausgehende E-Mails.
* MailSenderClientPort: Port des Mailservers (Standard: 25).
* MailSenderClientTimeout: Timeout in Millisekunden für das Versenden von E-Mails.
* MailSenderClientSsl: True = SSL verwenden, False = kein SSL (Standard: False).
* MailSenderClientUserName: Optional der Benutzername für den Mailserver.
* MailSenderClientUserPassword: Optional ein Passwort für den Mailserver.

