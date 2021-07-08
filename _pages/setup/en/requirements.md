---
layout: page
title: System requirements
permalink: "setup/en/requirements/"
language: en
---

### Operating system & components

OneConnexx can be installed on the following operating systems:

* Windows Server 2019
* Windows Server 2016
* Windows Server 2012 R2
* Windows Server 2012
* Windows Server 2008 R2
* Windows Server 2008

The following components are required to operate the OneConnexx applications:

* Internet Information Server from version 7
* Microsoft .NET Framework 4.5.2 or higher
* Optional for monitoring, alerting, statistics: Microsoft SQL Server from version 2008 (Express or higher)

### RAM & CPU Cores

OneConnexx operates as a service. A website is also operated within the Internet Information Server for administration. 
We recommend that you take Microsoft's requirements into account.

However, at least 4 GB of RAM and 2 cores are recommended. 
If other software is running on the server (e.g. the SQL Server), it is advisable to use a more powerful CPU or more memory.

### Hard disk space

The software itself only requires a few MB of hard disk space. 
However, depending on the configuration and load, logging generates log files, which can require several GB of hard disk space in total.

### Active Directory

The server on which OneConnexx is installed can be a member of the Active Directory. 
OneConnexx administration authorization is granted either via the Active Directory or with local users.

### Use of virus scanners on the Windows server

If a virus scanner is in use on the system on which the OneConnexx applications are running, it should be configured in such a way that the functionality of OneConnexx is not restricted.

Recommendations:

* The virus scanner should not analyze the OneConnexx installation directory on the server. 
Since log files are generated in the standard setting, the directories are often written to.
* The directory of the IIS log files should not be analyzed.
* If the virus scanner analyzes HTTP / HTTPS connections, the address of the OneConnexx service should be added as an exception.

{% include alert.html type="warning" text="If OneConnexx is operated with a virus scanner on the server without these changes, this can lead to performance problems." %}
