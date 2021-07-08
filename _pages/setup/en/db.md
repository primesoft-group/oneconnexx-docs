---
layout: page
title: Datenbank
permalink: "setup/de/db/"
---

#### Voraussetzungen

Eine Datenbank ist grundsätzlich optional, bestimmte Funktionen von OneConnexx wie "Überwachung", "Alarmierung" und "Statistik" können jedoch nur zusammen mit einer Datenbank verwendet werden.
Es werden alle Versionen von *Microsoft SQL Server ab Version 2008* unterstützt, einschliesslich der kostenlosen Express Edition.

#### Datenbank erstellen

Erstellen sie eine neue Datenbank (z.B. mit Namen "OneConnexx") auf ihrem Microsoft SQL-Server. Die folgende beiden Skripte müssen dann auf dieser Datenbank ausgeführt werden um das Datenbankschema zu erstellen:

* [Tabellen]({{ site.baseurl }}/assets/content-files/create_tables.sql)
* [Gespeicherte Prozeduren]({{ site.baseurl }}/assets/content-files/create_stored_procedures.sql)

#### Service User

Der OneConnexx-Service, Alerting-Service und Web-Administration sollten einen DB Benutzer verwenden der Daten lesen, schreiben und gespeicherte Prozeduren ausführen darf. Änderungen am DB Schema sollten jedoch nicht erlaubt sein.

Es gibt die Möglichkeit einen *Windows Benutzer* oder einen *SQL Server Benutzer* zu verwenden. Der *SQL Server Benutzer* hat den Nachteil, dass das zugehörige Passwort im Klartext im Connection-String angegeben werden muss. Ein *Windows Benutzer* kann nur verwendet werden wenn auch der OneConnexx-Service unter einem eigenen Windows Benutzer installiert wurde.

##### SQL Server Benutzer

Auf der *Master* Datenbank ausführen:

```
CREATE LOGIN ocxservice WITH PASSWORD = '...'
GO
```

Auf der *OneConnexx* Datenbank ausführen:

```
CREATE USER ocxservice FROM LOGIN ocxservice
GO
```

##### Windows Benutzer

Auf der *OneConnexx* Datenbank ausführen und den Windows Benutzer angeben unter dem der OneConnexx-Service installiert wurde:

```
CREATE USER ocxservice FROM LOGIN "domäne\benutzername"
GO
```

Falls Datenbank und Web-Administration auf unterschiedlichen Servern installiert wurden, muss dem Computer-Account der Web-Administration Zugriff auf die Datenbank gewährt werden. Der Computer-Account besteht aus dem Computernamen gefolgt von einem Dollar-Zeichen ($).

Auf der *Master* Datenbank ausführen und den Domänen- und Computernamen des Web-Servers angeben, auf dem die Web-Administration installiert wurde:

```
CREATE LOGIN "domäne\computer$" FROM WINDOWS
GO
```

Auf der *OneConnexx* Datenbank ausführen:

```
CREATE USER "domäne\computer$" FROM LOGIN "domäne\computer$"
GO
```

#### Datenbankrollen

Auf der *OneConnexx* Datenbank eine neue Rolle *db_executor* erstellen. Den OneConnexx Service-User zu den Rollen *db_datareader*, *db_datawriter* und
*db_executor* hinzufügen. 

```
CREATE ROLE [db_executor] AUTHORIZATION [dbo]
GO

GRANT EXECUTE TO [db_executor]
GO

sp_addrolemember 'db_executor', 'ocxservice'
sp_addrolemember 'db_datareader', 'ocxservice'
sp_addrolemember 'db_datawriter', 'ocxservice'
GO
```

#### Hinweis zu Azure

In einer Azure Datenbank kann einem Login/User keine Default-Datenbank zugewiesen werden. Ein Verbindung (z.B. mit SQL Server Management Studio) ist somit nur möglich wenn die Datenbank explizit angegeben wird.


#### Connection Strings

Azure

```
server=xxx.database.windows.net;database=OneConnexx;User ID=ocxservice;Password=...;Trusted_Connection=False;Encrypt=True;MultipleActiveResultSets=True
```

SQL Server (mit Domänenbenutzer)

```
data source=xxx;initial catalog=OneConnexx;integrated security=True;MultipleActiveResultSets=True
```
