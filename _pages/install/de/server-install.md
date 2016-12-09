---
layout: page
title: OneOffixx Basis Installation
permalink: "install/de/server-install/"
---

Im mitgelieferten OneOffixx Installationspaket ist ein Powershell Script __"Install.ps1"__ enthalten, welches die Basis-Installation übernimmt.

Das Script muss __als Administrator__ ausgeführt werden, da fehlende Windows Features aktiviert werden, und das Ausführen von Powershell Scripts muss aktiviert sein. 

__ExecutionPolicy:__

Um das Script zu starten muss die ExecutionPolicy mindestens auf "RemoteSigned" stehen:

     Set-ExecutionPolicy RemoteSigned

![x]({{ site.baseurl }}/assets/content-images/install/de/server-install-ps.png "Powershell Set-ExecutionPolicy")

__Variante 1: Starten über eine neue Powershell Session"__

Eine neue Powershell Session erzeugen und im Installationspaket die "Install.ps1" aufrufen.

__Variante 2: Run with Powershell__

Über den Windows Explorer kann das "Install.ps1" gestartet werden, hierbei muss allerdings die ExecutionPolicy dies ebenfalls zulassen:

![x]({{ site.baseurl }}/assets/content-images/install/de/server-install-explorer.png "Starten via Windows Explorer")

## Script Ablauf

__1. Benötigte Windows Feature überprüfen__

Im ersten Schritt wird überprüft ob alle erforderlichen Windows Features installiert sind. Darunter zählt unter anderem der Internet Information Service mit ASP.NET sowie WCF Dienste.

__2. "OneOffixx"-Website im IIS__

Im nächsten Schritt wird überprüft ob bereits eine "OneOffixx"- Website im IIS registriert ist. Ist dies bereits der Fall wird zum nächsten Schritt gegangen.

Falls die Website nicht gefunden wird, werden Sie gefragt ob diese angelegt werden soll mit der Angabe des Installationspfades und des Port. Die Standardeinstellungen werden Ihnen im Installation-Script angezeigt.

__3. "OneOffixx"-Apps__

Im letzten Schritt werden die eigentlichen Webanwendungen in der "OneOffixx"-Website hinterlegt.

Falls die Anwendungen bereits installiert sind wird der Installateur gefragt, ob die eine Aktualisierung stattfinden soll. Dabei können die "web.config" bzw. OneOffixx-Konfigurationsdateien der bestehenden Anwendungen
beibehalten werden oder nicht. 

Im Fall einer einfachen Aktualisierung empfiehlt es sich die Konfigurationsdateien beizubehalten.

__Abschluss der Basis-Installation__

Nach der ersten Installation sollten nun sowohl der IIS als auch die Webanwendungen installiert sein.

{% include alert.html type="info" text="In der Standard-Installation wird eine Webseite erzeugt, welche auf den Port 80 lauscht. Dies könnt mit evtl. anderen Webseiten zu konflikten führen. <br/><b>In dem Fall wird die OneOffixx Website nicht gestartet.</b>" %}

