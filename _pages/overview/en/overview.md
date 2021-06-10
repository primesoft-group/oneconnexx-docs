---
layout: page
title: Übersicht
permalink: "overview/en/overview/"
language: en
---

## OneConnexx - Enterprise Service Bus (ESB)

OneConnexx connects a wide variety of applications and systems both within your IT infrastructure and with the systems of your customers or partners.
OneConnexx also supports you with various process-supporting functions in handling your business processes.

![x]({{ site.baseurl }}/assets/content-images/overview/de/overview.png "Übersicht")

## Connectors

In contrast to other ESBs, where the peripheral systems have to be adapted so that they can communicate with the ESB, OneConnexx provides connectors. 
In the diagram above, the connectors are represented by the green arrows. Connectors are implemented in OneConnexx using add-ins. OneConnexx already contains connectors for the most common communication protocols and some third-party systems (list is not exhaustive):

* Database (MS SQL Server)
* File system
* FTP, SFTP, FTPS, WebDAV, Amazon S3
* SOAP Web-Services
* Email (SMTP)
* LDAP / Active Directory
* Microsoft SharePoint
* Bizagi
* OneOffixx

## Process-supporting functions

Process-supporting functions are often required in data processing and process management. This includes, for example, starting a process at predefined times or as soon as a file is stored in a monitored directory.
But data transformations or the sending of e-mails also belong to this category of functions. OneConnexx already offers many process-supporting functions as add-ins (list is not exhaustive):

* Timer (interval, daily, weekly, monthly, yearly)
* Monitor directories
* Send emails
* Compress / decompress files
* XSL transformations
* Delete old files
* Monitoring server availability (ping)

## Custom add-ins

There are many reasons for customer-specific developments. Customer-specific add-ins often contain customer-specific business logic such as validation of data or special transformations.
These can hardly be achieved with standard add-ins and dynamic configuration, or only with considerable effort. The connection to special peripheral systems can also require customer-specific development.
In addition to the existing connectors and process-supporting functions, we can implement new add-ins with little effort. The development effort is low, since a large number of basic functions can be used during implementation.
Thanks to our framework, newly developed add-ins automatically benefit from the following basic functions:

* Logging
* Monitoring of executio
* Linking add-ins with events
* Configuration of add-ins using the administration web
 
## Mapping of processes by linking add-ins

By linking connectors and process-supporting functions, complex processes can be mapped. A possible process would be, for example:

![x]({{ site.baseurl }}/assets/content-images/overview/de/process.png "Prozess")

Timer (e.g. on the 1st of every month) -> Exporting users from the Active Directory to a CSV file -> Copying this CSV file to an FTP server -> Informing a person via email

## Administration and Management

Administration and configuration of OneConnexx takes place via a modern web application that can be operated with any modern browser. OneConnexx web administration supports you during configuration and operation with 
evaluation of log and monitoring data.

#### Configure add-ins

Add-ins are added, configured or deleted in the OneConnexx web administration. Add-ins can also be linked to one another. The web administration supports the user with a short description of the add-in parameters 
and ensures error-free configuration.

#### Log

When analyzing problems or implementing new processes, extensive log files are essential. The web administration offers, on one hand, a real-time view and, on the other hand, an view in the past with detailed filter options.

#### Monitoring and alerting

The error-free execution of the configured processes can be monitored by a variety of rules. E-mails can be defined that are sent to predefined recipients if a rule is violated.
