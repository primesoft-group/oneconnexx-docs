---
layout: page
title: Database
permalink: "setup/en/db/"
language: en
---

#### Requirements

A database is basically optional, but certain OneConnexx functions such as "Monitoring", "Alerting" and "Statistics" can only be used in conjunction with a database. 
All versions of Microsoft SQL Server from version 2008 are supported, including the free Express Edition.

#### Create database

Create a new database (e.g. with the name "OneConnexx") on your Microsoft SQL server. The following two scripts must then be executed on this database in order to create the database schema:

* [Tables]({{ site.baseurl }}/assets/content-files/create_tables.sql)
* [Stored Procedures]({{ site.baseurl }}/assets/content-files/create_stored_procedures.sql)

#### Service User

The OneConnexx service, alerting service and web administration should use a DB user who is allowed to read, write and execute stored procedures. However, changes to the DB schema should not be allowed.

It is possible to use a *Windows user* or a *SQL Server user*. The  *SQL Server user* has the disadvantage that the associated password must be specified in clear text in the connection string. A *Windows user* can only be used if the OneConnexx service has also been installed under a separate Windows user.

##### SQL Server user

Execute on the *master* database:

```
CREATE LOGIN ocxservice WITH PASSWORD = '...'
GO
```

Execute on the *OneConnexx* database:

```
CREATE USER ocxservice FROM LOGIN ocxservice
GO
```

##### Windows users

Execute on the *OneConnexx* database and specify the Windows user under which the OneConnexx service was installed:

```
CREATE USER ocxservice FROM LOGIN "domäne\username"
GO
```

If the database and web administration were installed on different servers, the web administration computer account must be granted access to the database. The computer account consists of the computer name followed by a dollar sign ($).

Execute on the *master* database and specify the domain and computer name of the web server on which the web administration was installed:

```
CREATE LOGIN "domäne\computer$" FROM WINDOWS
GO
```

Execute on the *OneConnexx* database:

```
CREATE USER "domäne\computer$" FROM LOGIN "domäne\computer$"
GO
```

#### Database roles

Create a new role *OneConnexx* on the OneConnexx database. Add the OneConnexx service user to the roles *db_executor*, *db_datareader*, *db_datawriter* and
*db_executor*:

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

#### Note on Azure

In an Azure database, a login / user cannot be assigned a default database. A connection (e.g. with SQL Server Management Studio) is therefore only possible if the database is specified explicitly.


#### Connection Strings

Azure

```
server=xxx.database.windows.net;database=OneConnexx;User ID=ocxservice;Password=...;Trusted_Connection=False;Encrypt=True;MultipleActiveResultSets=True
```

SQL Server (with domain user)

```
data source=xxx;initial catalog=OneConnexx;integrated security=True;MultipleActiveResultSets=True
```
