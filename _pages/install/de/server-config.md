---
layout: page
title: OneOffixx Basis Konfiguration
permalink: "install/de/server-config/"
---

Die Konfiguration umfasst im wesentlichen 3 Schritte und die Admin Webanwendung sollte Sie durch diese Schritte begleiten. Starten können Sie den __"Rampup Guide"__ indem Sie die Admin Seite im Browser aufrufen.

Das Admin-Dashboard hilft bei der Installation bzw. dem Betrieb von OneOffixx, ist aber nur indirekt für den produktiv Betrieb notwendig. 

__1. Schritt: OneOffixxAdmin.config__

Im ersten Schritt wird geprüft ob die "OneOffixxAdmin.config" Datei Konfigurationsparameter enthält. 

Falls nicht, wird direkt der "Rampup Guide" angezeigt. Nehmen Sie die Beispiel-Konfiguration aus dem "Ramup Guide" und
editieren Sie die "OneOffixxAdmin.config" Datei manuell oder nutzen Sie den "Config-Editor". 

_OneOffixxAdmin.config manuell editieren:_

Die OneOffixxAdmin.config befindet sich im Admin-Ordner Ihrer OneOffixx Installation.

Wichtigster Konfigurationspunkt ist der ConnectionString zur späteren OneOffixx Produktionsdatenbank, welcher wie folgt angegeben werden muss:

    Data Source=localhost;InitialCatalog=oneoffixx;UserID=[user];Password=[PW];MultipleActiveResultSets=True

Für den Fall das die Windows Authentifzierung genutzt wird, sähe der ConnectionString so aus:

    Data Source=localhost;InitialCatalog=oneoffixx;Integrated Security=true;MultipleActiveResultSets=True

__2. Schritt: Datasource Management__
	
Wenn Sie die Konfiguration in der "OneOffixxAdmin.config" gespeichert haben (entweder manuell oder per Config-Editor), sollten Sie die Startseite der Admin Webanwendung aufrufen. Sie sollten jetzt einen Eintrag
sehen und in zum "Datasource Management" wechseln.

Falls der SQL User __"dbcreator" Rechte__ besitzt und Sie noch __keine Datenbank__ angelegt
haben drücken Sie auf __"Init"__. 

Dies wird die Datenbank samt den Tabellen anlegen. 

Falls Sie __bereits eine leere Datenbank__ angelegt haben, __markieren Sie die Checkbox__. 

Danach sollte in beiden Fällen die Datenbank erstellt wurden sein.

__3. Schritt: OneOffixx.config__

Im letzten Schritt müssen Sie die eigentlichen OneOffixx Anwendungen, d.h. die Service, Connect oder Web-Anwendung, mit den darin enthaltenen "OneOffixx.config" Dateien konfigurieren. Geben Sie hier den
ConnectionString von der OneOffixx Produktionsdatenbank an.

__Admin absichern__

Die Server-Komponenten sind nun erfolgreich installiert und konfiguriert. Es empfiehlt sich den Anweisungen des Konfiguration-Wizard zu folgen und den OneOffixx Admin über die "web.config" nur für bestimmte Nutzer freizuschalten. Im "Rampup Guide" sollten Sie einige Beispiele dazu finden.
