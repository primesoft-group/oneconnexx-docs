---
layout: page
title: Web-Administration
permalink: "setup/de/web/"
---

### Server vorbereiten

Mithilfe des Powershell Skripts [IISOneConnexxScript.ps1]({{ site.baseurl }}/assets/content-files/IISOneConnexxScript.ps1) werden automatisch die erforderlichen Serverrollen und Features
installiert.

#### Manuelle Installation

Im Server Manager unter «Add roles and features» folgende Serverrollen hinzufügen:

* WebServer (IIS)
  * Management Tools
    * IIS Management Console
  * Web Server
    * Security -> Windows Authentication
    * Application Development -> ASP.NET 4.5

Und unter Features:

* .NET Framework 4.5

Unter Windows Server 2008:

* Anwendungsfeature ASP.NET aktivieren
* WebServer IIS -> Add Roles -> ASP.NET

### Installationspakete

Installationspakete werden von Sevitec in Form von 7-zip Archiven zur Verfügung gestellt. Folgende Pakete werden benötigt:

* ocx-web.7z

Das benötigte Installationspaket auf den Server ins Verzeichnis *&lt;Laufwerk&gt;:\OneConnexx\Install* kopieren.

Den Inhalt des Installationspakets nach *&lt;Laufwerk&gt;:\OneConnexx\Web* entpacken.

Die Datei *Web.config.sevitec* in *Web.config* umbenennen.

Auf dem «Web» Unterverzeichnis -> Properties -> Security -> Gruppe IIS_IUSRS hinzufügen mit Read & execute Rechten.

```
icacls C:\OneConnexx\Web /grant IIS_IUSRS:(OI)(CI)RX
```

{% include alert.html type="warning" text="Die Web-Administration muss nur in einer Instanz installiert werden. Sie kann mehrere OneConnexx Installationen administrieren." %}

### IIS einrichten

Unter «Sites» -> Rechte Maustaste -> «Add Website…»

* Name = OneConnexxAdministration
* Physical Path = &lt;Laufwerk&gt;:\OneConnexx\Web
* Binding, Port = 9500

Neu erstellte Site anklicken -> Authentication -> Windows Authentication = Enabled

Unter ApplicationPools sicherstellen dass der neu erstellte ApplicationPool «OneConnexxAdministration» als ".NET CLR Version" die Version "v4.0" ausgewählt hat.

#### IIS Berechtigung erteilen um Dienst zu Stoppen/Starten

Damit der OneConnexx Windows-Dienst von der Web-Applikation gestoppt/gestartet werden kann, muss dem Benutzer unter dem der
IIS läuft die entsprechende Berechtigung erteilt werden.

1. subinacl herunterladen ([http://www.microsoft.com/en-us/download/details.aspx?id=23510](http://www.microsoft.com/en-us/download/details.aspx?id=23510))
1. subinacl installieren
1. Eingabeaufforderung als Administrator öffnen
1. Ins Verzeichnis wechseln wo subinacl installiert wurde (z.B. C:\Program Files (x86)\Windows Resource Kits\Tools\)
1. ```subinacl /service OneConnexx /grant=IIS_IUSRS=F```

{% include alert.html type="warning" text="Der letzte Befehl muss für jede installierte OneConnexx Instanz ausgeführt werden. «OneConnexx» ist der Name unter dem der Windows-Dienst installiert wurde. «IIS_IUSRS» ist eine Benutzergruppe die ab IIS 7.0 automatisch alle ApplicationPool-Identitäten enthält." %}

#### Dateisystemberechtigungen für IIS

Damit die Web-Administration die Logdateien des OneConnexx-Services lesen kann, muss der IIS_IUSRS Benutzergruppe Lesezugriff
auf das Verzeichnis mit den Logdateien gewährt werden (*&lt;Laufwerk&gt;:\OneConnexx\OneConnexxService\Logs*). Bei mehreren installierten OneConnexx Instanzen muss die Berechtigung für jedes Log-Verzeichnis einzeln gesetzt werden. 

```
icacls C:\OneConnexx\OneConnexxService\Logs /grant IIS_IUSRS:(OI)(CI)R
```

Falls noch nicht bei der Installation des OneConnexx Service geschehen, müssen Schreibrechte für das Verzeichnis *%ProgramData%\Sevitec\OneConnexx* erteilt werden:

```
mkdir "%ProgramData%\Sevitec\OneConnexx"
icacls %ProgramData%\Sevitec\OneConnexx /grant Users:(OI)(CI)RW
```

### Logfiles und gespeicherte Verbindungen

Die Web-Administration schreibt Logfiles ins Verzeichnis *%ProgramData%\Sevitec\OneConnexx\WebAdmin*

Die Web-Administration liest eine Liste aller installierten OneConnexx-Instanzen aus dem Verzeichnis *%ProgramData%\Sevitec\OneConnexx\Installations*

Wird für eine OneConnexx-Instanz der Name oder die Verbindungszeichenfolge der Datenbank konfiguriert, werden diese Informationen in einer Datei «connection.config» im Verzeichnis *%ProgramData%\Sevitec\OneConnexx\WebAdmin* gespeichert.

{% include alert.html type="warning" text="Das Verzeichnis %ProgramData% ist normalerweise ein unsichtbares Verzeichnis und befindet sich unter C:\ProgramData." %}

### Konfiguration in Web.config

In der Datei Web.config (unter *&lt;Laufwerk&gt;:\OneConnex\Web*) können folgende Einstellungen vorgenommen werden.

__Logging__

Standardmässig werden Logdateien ins Verzeichnis *%ProgramData%\Sevitec\OneConnexx\WebAdmin* geschrieben.
Pro Tag wird eine neue Logdatei erstellt und die Dateien der letzten 7 Tage werden archiviert.
Diese Einstellungen können im Abschnitt &lt;nlog&gt; geändert werden.
Alle möglichen Einstellungen sind unter https://github.com/nlog/nlog/wiki beschrieben.

__Anzeigesprache__

Die OneConnexx Web-Administration ist zweisprachig (Deutsch/Englisch) und verwendet standardmässig die Browsersprache,
bzw. Englisch wenn die Browsersprache nicht Deutsch oder Englisch ist. Soll die Anzeigesprache unabhängig von der
Browsersprache festgelegt werden, kann dies im Konfigurationselement &lt;globalization&gt; angegeben werden.
Die Standardeinstellung lautet:

```
<globalization enableClientBasedCulture="true" uiCulture="auto" culture="auto" />
```

Um die Anzeigesprache fest auf Englisch umzustellen:

```
<globalization enableClientBasedCulture="true" uiCulture="en-gb" culture="en-gb" />
```

__Berechtigungen__

Der Zugriff auf die Web-Administration wird über «Windows Authentication» gesteuert, d.h. aufgrund des angemeldeten Windows
Benutzers. Berechtigungen werden über ein Rollenkonzept gesteuert. Es gibt folgende Rollen:

* *Benutzer*: Kann sich mit allen konfigurierten OneConnexx Installationen verbinden. Hat nur Lesezugriff auf die Konfigurationseinstellungen. Sensitive Konfigurationsparameter wie Passwörter können nicht eingesehen werden.
* *Konfigurator*: Kann zusätzlich Add-Ins erstellen, löschen und konfigurieren. Alle Konfigurationsparameter können eingesehen und verändert werden.
* *Administrator*: Wie Konfigurator, kann aber zusätzlich OneConnexx Installationen erstellen, löschen und bearbeiten sowie die Windows-Dienste starten und stoppen.

Diese Rollen können einzelnen Windows Benutzern oder Windows Benutzergruppen zugeordnet werden.


