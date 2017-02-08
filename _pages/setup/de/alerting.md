---
layout: page
title: Alerting-Service
permalink: "setup/de/alerting/"
---

### Installationspackete
Installationspackete werden von Sevitec in Form von 7-zip Archiven zur Verfügung gestellt. Folgende Packete werden benötigt:

* alertingservice.7z

Das benötigte Installationspacket auf den Server ins Verzeichnis *&lt;Laufwerk&gt;:\OneConnexx\Install* kopieren.

Den Inhalt des Installationspackets nach *&lt;Laufwerk&gt;:\OneConnexx* entpacken. Dadurch wird folgende Verzeichnisstruktur erstellt:

```
\OneConnexx
 |-AlertingService
```
Die Datei *OneConnexx.AlertingService.exe.config.sevitec* in *OneConnexx.AlertingService.exe.config* umbenennen.

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

_-servicename=OneConnexx.Alerting_ wird dabei durch den gewählten eindeutigen Namen ersetzt.

In einem Unternehmensnetzwerk wird empfohlen, für den Alerting-Service einen eigenen Benutzer anzulegen unter dem der
Service installiert wird. Es kann derselbe Benutzer wie für den OneConnexx-Service verwendet werden. Dazu muss folgendermassen
vorgegangen werden:

* «Services» öffnen (Windows-Taste -> Services)
* OneConnexx -> rechte Maustaste -> Properties -> Log On
* This account: &lt;OneConnexx-User&gt;
* Password: siehe Zugangsdaten des jeweiligen Kunden
* «Services» wieder schliessen
