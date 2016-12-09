---
layout: page
title: Client Installation
permalink: "install/de/client/"
---

Sie finden hier die Systemvoraussetzungen und eine Anleitung für die Installation der OneOffixx Client Komponenten.

## <i class="fa fa-wrench" aria-hidden="true"></i> Systemvoraussetzung {% include anchor.html name="system-requirements" %}

__Betriebssystem__

Sie können den OneOffixx Client auf folgenden Betriebssystemen installieren:

* Windows Vista SP2 oder höher (sowohl 32bit oder 64bit) 
* Windows Server 2008 oder höher (sowohl 32bit oder 64bit)

__Unterstützte Microsoft Office Versionen__

OneOffixx unterstützt alle Microsoft Office Versionen ab __Office 2007__, sowohl in der 32bit als auch 64bit Variante.

__.NET Framework__

Für den OneOffixx Client wird mindestens das __[.NET Framework 4.0 (Client Profile)](https://www.microsoft.com/en-US/download/details.aspx?id=17113)__ vorausgesetzt.

__Festplattenspeicher__

Die Software selbst benötigt etwa 200 MB Festplattenspeicher. 

Der OneOffixx Client speichert zudem (für Fehlerbehandlung) Log-Dateien und Einstellungen und legt zusätzlich einen lokalen Cache für die Offline-Nutzung an.
Die Grösse des Caches ist abhängig von der Anzahl und Grösse der Vorlagen. 

__Active Directory__

Für den Betrieb ist es erforderlich, dass der OneOffixx Client und Server sich in der gleichen bzw. über Vertrauensstellung authorisierten Domäne befinden.

## <i class="fa fa-power-off" aria-hidden="true"></i> 32bit oder 64bit Installation {% include anchor.html name="bitness" %}

Den OneOffixx Installer gibt es in einer 32- oder 64bit Variante. Die benötigte Version ist __abhängig von der verwendeten Microsoft Office Version__.

Wird ein 64bit Microsoft Office verwendet, __muss__ die 64bit OneOffixx Version installiert werden. 

## <i class="fa fa-plug" aria-hidden="true"></i> Ports & Server-Verbindung {% include anchor.html name="ports" %}

Der OneOffixx Client kommuniziert __ausschliesslich über HTTP/HTTPS__ mit dem OneOffixx Server, damit wird in der Standard-Konfiguration nur Port 80 bzw. 443 benötigt.

## <i class="fa fa-windows" aria-hidden="true"></i> MSI Parameter {% include anchor.html name="msi" %}

Das OneOffixx MSI-Paket enthält den OneOffixx Client und die diversen Microsoft Office Addins. 

__OneOffixx-Spezifische Parameter:__

* APPLICATIONFOLDER = install folder (default C:\Program Files (x86)\OneOffixx)
* INSTALLDESKTOPSHORTCUT = 1 / 0 for yes or no
* AUTOSTART = 1 / 0 for yes or no
* SERVICEENDPOINTURL = Service Endpoint
* ADDLOCAL = Features
    * WordAddInFeature = Word Add-In
    * OutlookAddInFeature = Outlook Add-In
    * ExcelAddInFeature = Excel Add-In
    * PowerPointAddInFeature = PowerPoint Add-In
    * OfferOfEvidenceAddInFeature = OneOffixx Law Add-In
    * RegulationsAddInFeature = OneOffixx Booklet Add-In

Diese Parameter hier werden nur in bestimmten Installationsvarianten (z.B. Installation auf Terminal-Servern) benötigt und sind optional: 

* DATAINLOCALAPPDATAFOLDER = False/True (must be True on Network Share)
* CACHEFOLDER = Path e.g. //Share/... (with Placeholders like %username% etc.)
* SETTINGFOLDER = Path e.g. //Share/... (with Placeholders like %username% etc.)

Es gelten ansonsten die normalen __[MSIEXEC Command-Line Options](https://msdn.microsoft.com/en-us/library/windows/desktop/aa367988%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396)__.

Beispiel: 

    msiexec /qb /i "OneOffixx.Install(x86).msi" APPLICATIONFOLDER="C:\Program Files (x86)\OneOffixx" SERVICEENDPOINTURL="http://appurl/OneOffixxService.svc" INSTALLDESKTOPSHORTCUT=1 AUTOSTART=1 /l*v OneOffixxInstall.log AddLocal=WordAddInFeature,OutlookAddInFeature

## <i class="fa fa-cogs" aria-hidden="true"></i> Installationsszenarien {% include anchor.html name="install" %}

Die Standardeinstellungen des OneOffixx Installers zielen auf eine "normale" Installation auf einem System ab, welches von einem oder mehreren Windows-Nutzern gestartet werden kann. 
Hierbei werden sowohl der Cache als auch die Einstellungen unter *%AppData%* gespeichert.

Jede OneOffixx Client Instanz muss für die vollständige Funktionalität exklusiven Zugriff auf den Cache bekommen - ist dies nicht der Fall (z.B. für einige Citrix/Terminal-Server Konfiguration) muss der Speicherort des Caches angegeben werden. 

### <i class="fa fa-cog" aria-hidden="true"></i> OneOffixx Client: Standard Installation

Es werden keine weiteren Parameter benötigt, hierbei werden Cache & Einstellungen unter *%AppData%* gespeichert.

__Empfohlen für:__

☑ Keine serverseitig gespeicherten Roaming Profile

### <i class="fa fa-cog" aria-hidden="true"></i> OneOffixx Client: Cache & Einstellungen lokal

Sowohl der Cache als auch die Einstellungen können unter *%AppDataLocal%* gespeichert werden, wenn dieser Parameter gesetzt wird:

    DATAINLOCALAPPDATAFOLDER = True

__Empfohlen für:__

☑ Serverseitig gespeicherten Roaming Profile

☑ *%AppDataLocal%* Ordner wird nicht gelöscht

☑ Benutzer ist immer auf derselben Maschine eingeloggt

### <i class="fa fa-cog" aria-hidden="true"></i> OneOffixx Client: Cache in spezifischen Ordner

Sollte sowohl *%AppData%* als auch *%AppDataLocal%* nicht in Frage kommen oder es passieren kann, dass mehrere OneOffixx Instanzen pro Nutzer offen sein könnten, kann über diese Einstellung der Cache Speicherort spezifiziert werden:

    CACHEFOLDER = Path e.g. //Share/... (with Placeholders like %username% etc.)

__Empfohlen für:__

☑ Terminal-Server Installation mit mehrere offenen Sessions pro Benutzer

__Voraussetzung:__

☑ Angebenes Netzwerk-Laufwerk ist vorhanden und immer erreichbar

### <i class="fa fa-cog" aria-hidden="true"></i> OneOffixx Client: Einstellungen in spezifischen Ordner

Die Einstellungen können ebenfalls wie der Cache in einen eigenen Ordner gespeichert werden. 

    SETTINGFOLDER = Path e.g. //Share/... (with Placeholders like %username% etc.)

## <i class="fa fa-life-ring" aria-hidden="true"></i> Troubleshooting {% include anchor.html name="troubleshooting" %}

__OneOffixx Addins in Microsoft Office starten nicht__

Falls sich die OneOffixx Addins nicht starten lassen, d.h. es ist kein OneOffixx Icon im Office Ribbon zu sehen kann es verschiedene Ursachen haben:

* Das OneOffixx Addin ist nicht installiert: 
    * Sollte das OneOffixx Addin unter "Datei - Optionen - Addins" unter den COM Addins nicht auftauchen, ist es evtl. nicht installiert. Prüfen Sie ob das entsprechende Addin bei der Installation ausgewählt wurde.
* Office ist in der 64bit Variante installiert, aber es wurde der 32bit OneOffixx Installer benutzt.
    * Sollte eine 64bit Office Installation benutzt sein, muss auch der 64bit Installer von OneOffixx genutzt werden.
* Visual C++ Redistributable 2015 Package fehlt oder ist nicht richtig installiert 
    * Ab OneOffixx Version 2.3.40140 ist das VC++ Redistributable 2015 Package im OneOffixx enthalten, allerdings kann es passieren dass eine "korrupte" System Installation des Package die Ausführung unseres Addins unterbindet. In dem Fall sollte nochmals die Installation des [VC++ Redistributable 2015 Package](https://www.microsoft.com/de-ch/download/details.aspx?id=48145) vorgenommen werden.
		
	
{% include alert.html type="warning" text="Bei Fragen oder Problemen helfen wir Ihnen natürlich gern weiter - melden Sie sich einfach bei unserem Support." %}
