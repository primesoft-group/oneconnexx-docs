---
layout: page
title: Datenbank
permalink: "setup/de/db/"
---

#### Datenbank erstellen

Folgende Skripts können verwendet werden um das Datenbankschema zu erstellen:

Tabellen
Gespeicherte Prozeduren

#### Service User

Der OneConnexx-Service, Alerting-Service und Web-Administration sollten einen DB Benutzer verwenden der Daten lesen, schreiben und gespeicherte Prozeduren ausführen darf. Änderungen am DB Schema sollten jedoch nicht erlaubt sein.

Auf der *Master* Datenbank ausführen:

```
CREATE LOGIN ocxservice WITH PASSWORD = '...'
GO
```

Auf der OneConnexx Datenbank ausführen:

```
CREATE USER ocxservice FROM LOGIN ocxservice
GO
```

#### Datenbankrollen

Eine neue Rolle *db_executor* erstellen. Den OneConnexx Service-User zu den Rollen *db_datareader*, *db_datawriter* und
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
