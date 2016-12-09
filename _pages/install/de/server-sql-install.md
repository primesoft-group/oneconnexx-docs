---
layout: page
title: SQL Server installieren
permalink: "install/de/server-sql-install/"
---

Das Dokument beschreibt die Installation eines SQL Servers für OneOffixx. 

Grundsätzlich kann der OneOffixx Server auch auf einer [SQL Express Edition](http://www.microsoft.com/en-us/server-cloud/products/sql-server-editions/sql-server-express.aspx) ohne Probleme eingesetzt werden. Diese Installationsvariante empfiehlt sich aber nur für Testumgebungen und für kleine Unternehmungen. 

Installieren Sie den SQL Server mit dem von Microsoft mitgelieferten Installationspaket.

{% include alert.html type="info" text="OneOffixx kann <b>sowohl mit Windows Authentication als auch mit SQL Authentication</b> betrieben werden. Wir empfehlen die SQL-Authentifizierung, da dies in den meisten Fällen ein einfachereres Setup darstellt." %}

__Authentication Mode: Mixed Mode__

Achten Sie bei der Installation darauf, dass der Authentication Mode im Mixed Mode eingestellt ist.

![x]({{ site.baseurl }}/assets/content-images/install/de/server-sql-install-mixedmode.png "Mixed-Mode Auth im SQL Server")

Nachträglich lässt sich diese Einstellungen über die Servereigenschaften im Reiter Security ändern.

![x]({{ site.baseurl }}/assets/content-images/install/de/server-sql-install-mixedmode-change.png "Mixed-Mode Auth im SQL Server ändern")

__Authentication Mode: Windows Only__

Die Standardinstallation nutzt einen SQL User um sich mit der Datenbank zu verbinden - soll ein Windows User genommen werden müssen folgende Schritte beachtet werden:

Die ConnectionStrings in der OneOffixx.config bzw. OneOffixxAdmin.config zur Datenbank müssen angepasst werden: 

    "Integrated Security=true" anstelle von "User ID=...;Password=..."

Der Windows User muss im IIS als User im AppPool hinterlegen, dieser App Pool muss für jede Application genutzt werden:

    IIS -> Application Pools -> Advanced Settings -> Identity -> Custom account

Zusätzlich muss dieser Windows User bei in der "Log on as service" Policy hinterlegt werden:

    Administrative Tools -> Local Security Policy -> Local Policies -> User Rights Assignment ->"Log on as a service"
  
Danach sollten die OneOffixx Web-Applikation über den entsprechenden Windows User laufen.
