---
layout: page
title: Architecture
permalink: "architecture/en/overview/"
language: en
---

## Overview

A OneConnexx installation typically consists of the following components:

![x]({{ site.baseurl }}/assets/content-images/architecture/de/overview.png "Übersicht")

Database, alerting service and mail server are optional, but necessary if the "alerting" and "monitoring" features are to be used.

In a scenario with several OneConnexx instances, the database, IIS, alerting service and mail server only need to be present once.

## OneConnexx-Service

![x]({{ site.baseurl }}/assets/content-images/architecture/de/oneconnexxservice.png "OneConnexx-Service")

The heart of OneConnexx is the OneConnexx service. It is installed as an independent Windows service.

When it starts up, the OneConnexx service reads the configuration from a configuration file and instantiates the configured add-in instances.

The execution of the service and the add-in instances are recorded in a log file. NLog is used as the logging framework.

Individual add-ins log the result of their execution with an entry in the database. To do this, a connection string must be configured for the OneConnexx service, and the corresponding add-in instance must be assigned to a logical "interface".

#### Configuration

Which add-ins are used and how they are configured is read from a configuration file (usually Config\oneconnexx.config).

The configuration takes place via a web application in the browser. Changed settings are transferred to the OneConnexx service via a .NET remoting interface and are written to the configuration file.

#### Add-in types

OneConnexx distinguishes between the following 2 types of add-ins:

![x]({{ site.baseurl }}/assets/content-images/architecture/de/eventaddin.png "Ereignis Add-In")

Instances of **event add-ins** are started when the OneConnexx service is started and are active as long as the service is running.
They can trigger events which in turn start other add-ins. A typical example of an event add-in is a web service that opens a socket when it starts, waits for a client to connect,
and triggers an event as soon as a client request is received.

![x]({{ site.baseurl }}/assets/content-images/architecture/de/logicaddin.png "Logik Add-In")

Instances of **logic add-ins** are activated by an event, perform a specific task and are then inactive again.
An example of a logic add-in is the FileCopy add-in, which copies a file from A to B.

#### Add-in framework

Add-ins are instantiated using the Microsoft Managed Extensibility Framework. All available add-ins are read from the «AddIn» directory and copied into
the «Shadow» directory. The «Shadow» directory is only visible if the option to show hidden files is activated in Windows Explorer.

The OneConnexx service loads the configured add-in DLLs from the «Shadow» directory and monitors the «AddIn» directory for changes.
This mechanism makes it possible to update individual add-ins during operation:

* A new DLL is copied into the «AddIn» directory.
* The OneConnexx service recognizes the changed file.
* In case of an event add-in, all running instances of the corresponding add-in are stopped.
* In case of a logic add-in, the system waits until all active instances have completed their execution. The processing of events is interrupted so that no more new instances are started.
* The changed files from the «AddIn» directory are copied into the «Shadow» directory.
* The previously terminated instances of the updated logic add-in are started again.

#### Add-In communication

Add-ins communicate with each other through events. Each add-in instance can trigger an event. An event is usually defined by the name of the initiating instance and optionally by an event type.
For example, a “FileCopy” add-in triggers an “Output” event for each copied file, which contains the name of the copied file. 
After all files have been copied, a “Done” event is also triggered. For example, if the instance is called “FileCopy_Demo”, then the triggered events are called as follows:

```
FileCopy_Demo.Output
FileCopy_Demo.Done
```

Instances of logic add-ins can subscribe to this event and are activated as soon as the event is triggered.
If several events occur to which an add-in instance has subscribed, these are processed in sequence.
Each add-in instance has its own queue for events. There is only parallel processing between different instances.

![x]({{ site.baseurl }}/assets/content-images/architecture/de/eventqueue.png "Ereignis-Queue")

## Web administration

![x]({{ site.baseurl }}/assets/content-images/architecture/de/webapplication.png "Web-Applikation")

Administration and configuration of the OneConnexx service takes place via a .NET MVC web application. The web application is hosted in Microsoft IIS and uses "Windows Authentication" for the authorization check.
Several instances of a OneConnexx service can be administered by one instance of the web application. Communication with the service instances takes place using .NET remoting.

Changes to the add-in configuration are collected in the web application and must be saved explicitly.
This sends all changes to the OneConnexx service, which saves them to the configuration file.

Configuration of monitoring and alerting rules are stored in the database. The web application accesses the database directly.

For the real-time view and evaluation of the log files, the web application accesses the log files of the corresponding OneConnexx instance directly.
This only works if the web application is installed on the same server as the OneConnexx service.

## Database

![x]({{ site.baseurl }}/assets/content-images/architecture/de/db.png "Datenbank")

Microsoft SQL Server (any edition) is used as the database backend. A database instance can, but does not have to be, used by several OneConnexx instances. 
A database is only required for the "Monitoring" and "Alerting" features and can also be omitted if these features are not used.

All data access takes place using EntityFramework and stored procedures.

#### Scheme

![x]({{ site.baseurl }}/assets/content-images/architecture/de/dbschema.png "Datenbankschema")

Table **Alert**: Contains the e-mails configured in the web administration under "Alerting".

Table **Rule**: Contains the rules configured in the web administration under "Monitoring/Rules".

Table **MailQueue**: If an alerting e-mail has to be sent, an entry is created in this table. As soon as the e-mail has been sent, the entry is deleted.

Table **Interface**: Contains the interfaces configured in the web administration under “Monitoring/Interfaces”.

Table **Instance**: Contains an entry for each configured add-in instance.

Table **Transaction**: Each add-in writes an entry in this table when it is executed, provided it is assigned to an interface.

Table **TransactionCache**: Contains the last transaction per interface and endpoint. This table corresponds to the Monitoring/Overview view in the web administration.


## Alerting service

![x]({{ site.baseurl }}/assets/content-images/architecture/de/alertingservice.png "Alerting-Service")

The alerting service is optional and is only required for the "Monitoring" and "Alerting" features. The alerting service can monitor several instances of the OneConnexx service and is responsible for the following 2 tasks:

* Check all rules stored in the database. For this purpose, the transactions that are also stored in the database are evaluated. If a rule violation is detected, an entry is created in the mail queue.
* Sending the e-mails in the mail queue.

Note: Entries in the mail queue can also be created directly by add-ins if an error occurs during their execution.

## Mail server

![x]({{ site.baseurl }}/assets/content-images/architecture/de/mailserver.png "Mail-Server")

A mail server must be provided for sending alerts. The mail server is not part of the OneConnexx installation but must already exist in your organization.
Communication with the mail server takes place via the SMTP protocol.
