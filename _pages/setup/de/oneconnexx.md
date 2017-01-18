---
layout: page
title: OneConnexx-Service
permalink: "setup/de/oneconnexx/"
---

### 32- oder 64-Bit?

Den OneConnexx gibt es in einer 32-Bit und einer 64-Bit Version. Auf einem 64-Bit Betriebssystem wird empfohlen die 64-Bit 
Version des OneConnexx zu verwenden, ausser ein AddIn erfordert zwingend den 32-Bit Modus. Die AddIns laufen automatisch als
32-Bit oder 64-Bit Prozesse, je nach Version des OneConnexx.

### Installationspackete

Installationspackete werden von Sevitec in Form von 7-zip Archiven zur Verfügung gestellt. Folgende Packete werden benötigt:

* service.7z (Basis Service)
* addins.7z (Standard AddIns)
* Allfällige kundenspezifische AddIns in einem separaten Installationspacket.

Alle benötigten Installationspackete auf den Server ins Verzeichnis *&lt;Laufwerk&gt;:\OneConnexx\Install* kopieren.

Falls nur eine OneConnexx Instanz installiert wird, den Inhalt aller Installationspackete nach *&lt;Laufwerk&gt;:\OneConnexx* entpacken.

Wenn mehrere Instanze geplant sind (z.B. Test und Produktiv), dann wird empfohlen die Installationspackete in einen Unterordner
*&lt;Laufwerk&gt;:\OneConnexx\&lt;Instanzname&gt;* zu entpacken.

Danach sollte folgende Verzeichnisstruktur vorhanden sein:

```
\OneConnexx
 |-AddIns 
 |-Config
 |-Pipeline
```

### Service installieren

Der OneConnexx Windows-Dienst wird pro Installation über die Eingabeaufforderung (Windows Konsole) installiert.
Die Eingabeaufforderung muss als Administrator geöffnet werden. Der Name unter dem der Dienst installiert wird
muss auf der Kommandozeile angegeben werden. Sollen verschiedene Instanzen (z.B. Test und Produktiv) auf demselben
Server installiert werden, muss für jede Instanz ein eindeutiger Name verwendet werden.

Ins Stammverzeichnis des OneConnexx wechseln und den Service installieren:

```
cd \OneConnexx
OneConnexx.exe –install –servicename=OneConnexx
```

Zum Deinstallieren:

```
OneConnexx.exe –uninstall –servicename=OneConnexx
```

_-servicename=OneConnexx_ wird dabei durch den gewählten eindeutigen Namen der Instanz ersetzt.

In einem Unternehmensnetzwerk wird empfohlen, für den OneConnexx einen eigenen Benutzer anzulegen unter dem der
Service installiert wird. Dazu muss folgendermassen vorgegangen werden:

* «Services» öffnen (Windows-Taste -> Services)
* OneConnexx -> rechte Maustaste -> Properties -> Log On
* This account: &lt;OneConnexx-User&gt;
* Password: siehe Zugangsdaten des jeweiligen Kunden
* «Services» wieder schliessen

Dem &lt;OneConnexx-User&gt; für das Verzeichnis *&lt;Laufwerk&gt;:\OneConnexx* und alle Unterordner volle Berechtigung erteilen.

### Konfiguration

##### OneConnexx.exe.config

In der Konfigurationsdatei *&lt;Laufwerk&gt;:\OneConnexx\OneConnexx.exe.config* sind folgende Parameter zu konfigurieren:

* connectionString: Der Connection-String zur Datenbank. Wenn der OneConnexx Windows-Dienst unter einem Domänenbenutzer läuft, sollte «Integrated Security» gewählt werden. Wenn keine Datenbank verwendet werden soll darf kein Connection-String konfiguriert werden.
* AdminTcpChannel: Standardmässig ist TCP Port 9500 konfiguriert. Sollen mehrere OneConnexx Instanzen auf einem Server installiert werden, muss für jede Instanz ein eindeutiger Port konfiguriert werden.
* ConfigArchiveDirectory: Optional kann ein Verzeichnis (lokal oder als Netzwerkpfad) angegeben werden, in das bei jeder Konfigurationsänderung eine Sicherung der Konfigurationsdatei kopiert wird.

Alle anderen Konfigurationsparameter sollten nicht verändert werden!

##### nlog.config

In der Konfigurationsdatei *&lt;Laufwerk&gt;:\OneConnexx\Config\nlog.config* kann die Protokollierung des OneConnexx-Services
und der AddIns konfiguriert werden. Normalerweise muss an der Protokollierung nichts geändert werden.
Die Standardkonfiguration lautet:

* Logdateien werden im Unterverzeichnis «Log» erstellt
* Die aktuelle Logdatei heisst «oneconnexx.log»
* Pro Tag wird eine neue Logdatei geschrieben, die Logdateien der letzten 7 Tage werden aufbewahrt
* Es werden alle Logmeldungen protokolliert