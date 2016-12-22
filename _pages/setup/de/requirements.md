---
layout: page
title: Systemvoraussetzungen
permalink: "setup/de/requirements/"
---

#### Betriebssystem & Komponenten

OneConnexx kann auf folgenden Betriebssystemen installieren werden:

* Windows Server 2016
* Windows Server 2012 R2
* Windows Server 2012
* Windows Server 2008 R2
* Windows Server 2008

Für den Betrieb der OneConnexx Anwendungen sind folgende Komponenten notwendig:

* Internet Information Server ab Version 7
* Microsoft .NET Framework 4.5.2 oder höher
* Optional für Statistik: SQL Server ab Version 2008 (Express oder höher)

#### Arbeitsspeicher & CPU Cores

OneConnexx wird als Dienst betrieben. Zur Administration wird zusätzlich ein Webseite innerhalb des Internet Information Servers
betrieben. Wir empfehlen die Anforderungen von Microsoft zu berücksichtigen.

Empfehlenswert sind jedoch mindestens 4 GB Arbeitsspeicher und 2 Cores. Läuft auf dem Server noch weitere Software
(z.B. der SQL Server) empfiehlt sich einen stärkeren CPU bzw. mehr Arbeitsspeicher zu benutzen.

#### Festplattenspeicher

Die Software selbst benötigt nur wenige MB Festplattenspeicher. Das Logging erzeugt jedoch je nach Konfiguration und Last
Logfiles, welche insgesamt mehrere GB Festplattenspeicher benötigen können.

#### Active Directory

Der Server auf dem OneConnexx installiert wird, kann Mitglied des Active Directory sein. Die Berechtigung der
Administration des OneConnexx erfolgt entweder über das Active Directory oder mit lokalen Benutzern.

#### Einsatz von Virenscanners auf dem Windows Server

Falls auf dem System auf dem die OneConnexx Anwendungen ausgeführt werden ein Virenscanner im Einsatz ist, sollte
dieser so konfiguriert werden, dass die Funktionalität von OneConnexx nicht eingeschränkt ist.

Empfehlungen:

* Der Virenscanner sollte das OneConnexx Installationsverzeichnis auf dem Server nicht analysieren. Da in der
Standardeinstellung Logfiles generiert werden, wird in den Verzeichnissen häufig geschrieben.
* Das Verzeichnis der IIS Logdateien sollte nicht analysiert werden.
* Falls der Virenscanner HTTP/HTTPS Verbindungen analysiert, sollte die Adresse des OneConnexx Service als Ausnahme
hinzugefügt werden.

{% include alert.html type="warning" text="Falls OneConnexx ohne diese Änderungen mit einem Virenscanner auf dem Server betrieben wird, kann es zu Performanceproblemen kommen." %}

test
