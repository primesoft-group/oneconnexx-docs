---
layout: page
title: Installation
permalink: "webclient/en/installation/"
language: en
---

### Overview of OneConnexx instances

All OneConnexx instances on the local system are displayed on this page as soon as they have been started.

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/installationsOverview.png "Übersicht Installtionen")  


* __Name:__ The name of the installation can be chosen as you like.
* __Port:__ The port via which the service can be addressed, this is determined automatically and can only be changed in the OneConnexx configuration file of the corresponding installation.
* __Status:__ Indicates whether the installation is currently started and connected.
* __SQL-databse:__ Indicates whether a database has been configured and whether it can be reached.
* __Windows Service:__ Indicates whether the Windows service is started and enables the service to be started or stopped manually.

A click on name or port loads the installation.
	

#### 1. Edit installation

With a click on the “Edit” symbol the following dialog opens:

 ![X]({{ site.baseUrl }}/assets/content-images/webclient/de/addInstallation.png "Installtion Bearbeiten") 
 
Only the name and connection string parameters can be adjusted. 
The connection to the SQL database can be tested directly with the “Check connection” button.
 
#### 2. Delete installation
 
An installation can be removed from the list by clicking on the “Delete” symbol. An installation can only be removed if the corresponding OneConnexx has not started.
