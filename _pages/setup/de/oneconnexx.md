---
layout: page
title: OneConnexx-Service
permalink: "setup/de/oneconnexx/"
---

### 32- oder 64-Bit?

Den OneConnexx gibt es in einer 32-Bit und einer 64-Bit Version. Auf einem 64-Bit Betriebssystem wird empfohlen die 64-Bit 
Version des OneConnexx zu verwenden, ausser ein Add-In erfordert zwingend den 32-Bit Modus. Die Add-Ins laufen automatisch als
32-Bit oder 64-Bit Prozesse, je nach Version des OneConnexx.

### Installationspakete

Installationspakete werden von Sevitec in Form von 7-zip Archiven zur Verfügung gestellt. Folgende Pakete werden benötigt:

* ocx-service.7z (Basis Service)
* ocx-addins.7z (Standard Add-Ins)
* Allfällige kundenspezifische Add-Ins in einem separaten Installationspacket.

Alle benötigten Installationspakete auf den Server ins Verzeichnis *&lt;Laufwerk&gt;:\OneConnexx\Install* kopieren.

Falls nur eine OneConnexx Instanz installiert wird, den Inhalt von *ocx-service.7z* nach *&lt;Laufwerk&gt;:\OneConnexx\OneConnexxService* entpacken, und den Inhalt von *ocx-addins.7z* in ein Unterverzeichnis *AddIns*.

Wenn mehrere Instanze geplant sind (z.B. Test und Produktiv), dann wird empfohlen die Installationspakete in einen Unterordner
*&lt;Laufwerk&gt;:\OneConnexx\&lt;Instanzname&gt;* zu entpacken.

Danach sollte folgende Verzeichnisstruktur vorhanden sein:

```
\OneConnexx
 |-OneConnexxService
   |-AddIns 
   |-Config
   |-Pipeline
```

{% include alert.html type="warning" text="Bei der Erstinstallation folgende Dateien umbenennen:<br/> <em>OneConnexx.exe.config.sevitec</em> in <em>OneConnexx.exe.config</em><br/>
<em>Config\nlog.config.sevitec</em> in <em>Config\nlog.config</em>" %}

### Service installieren

Der OneConnexx Windows-Dienst wird pro Installation über die Eingabeaufforderung (Windows Konsole) installiert.
Die Eingabeaufforderung muss als Administrator geöffnet werden. Der Name unter dem der Dienst installiert wird
muss auf der Kommandozeile angegeben werden. Sollen verschiedene Instanzen (z.B. Test und Produktiv) auf demselben
Server installiert werden, muss für jede Instanz ein eindeutiger Name verwendet werden.

Ins Stammverzeichnis des OneConnexx wechseln und den Service installieren:

```
cd \OneConnexx\OneConnexxService
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

#### Dateisystemberechtigungen

Falls der OneConnexx Service nicht unter dem lokalen Systemkonto (Lokales System/Local System) installiert wird, muss dem  &lt;OneConnexx-User&gt; für das Verzeichnis *&lt;Laufwerk&gt;:\OneConnexx* und alle Unterordner volle Berechtigung erteilt werden. In diesem Beispiel wurde OneConnexx unter *C:\OneConnexx* installiert und läuft unter einem Benutzer mit Namen *ocxservice*:

```
icacls C:\OneConnexx /grant ocxservice:(OI)(CI)RW
```

Da verschiedene Dateien im Verzeichnis *%ProgramData%\Sevitec\OneConnexx* gespeichert werden, muss bei der ersten Installation sichergestellt werden, dass normale Benutzer Schreibzugriff auf dieses Verzeichnis haben. Die folgenden Befehle erstellen dieses Verzeichnis und erteilen die benötigte Berechtigung:

```
mkdir "%ProgramData%\Sevitec\OneConnexx"
icacls %ProgramData%\Sevitec\OneConnexx /grant Users:(OI)(CI)RW
```

### Konfiguration

##### OneConnexx.exe.config

In der Konfigurationsdatei *&lt;Laufwerk&gt;:\OneConnexx\OneConnexxService\OneConnexx.exe.config* sind folgende Parameter zu konfigurieren:

* connectionString: Der Connection-String zur Datenbank. Wenn der OneConnexx Windows-Dienst unter einem Domänenbenutzer läuft, sollte «Integrated Security» gewählt werden. Wenn keine Datenbank verwendet werden soll darf kein Connection-String konfiguriert werden.
* AdminTcpChannel: Standardmässig ist TCP Port 9500 konfiguriert. Sollen mehrere OneConnexx Instanzen auf einem Server installiert werden, muss für jede Instanz ein eindeutiger Port konfiguriert werden.
* ConfigArchiveDirectory: Optional kann ein Verzeichnis (lokal oder als Netzwerkpfad) angegeben werden, in das bei jeder Konfigurationsänderung eine Sicherung der Konfigurationsdatei kopiert wird.

Alle anderen Konfigurationsparameter sollten nicht verändert werden!

##### nlog.config

In der Konfigurationsdatei *&lt;Laufwerk&gt;:\OneConnexx\OneConnexxService\Config\nlog.config* kann die Protokollierung des OneConnexx-Services
und der Add-Ins konfiguriert werden. Normalerweise muss an der Protokollierung nichts geändert werden.
Die Standardkonfiguration lautet:

* Logdateien werden im Unterverzeichnis «Logs» erstellt
* Die aktuelle Logdatei heisst «oneconnexx.log»
* Pro Tag wird eine neue Logdatei geschrieben, die Logdateien der letzten 7 Tage werden aufbewahrt
* Es werden alle Logmeldungen protokolliert
