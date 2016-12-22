---
layout: page
title: Datenbank
permalink: "setup/de/db/"
---

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