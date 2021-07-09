---
layout: page
title: OneConnexx-Service
permalink: "setup/en/oneconnexx/"
language: en
---

### 32- or 64-bit?

The OneConnexx is available in a 32-bit and a 64-bit version. It is recommended to use the 64-bit version of the OneConnexx on a 64-bit operating system, unless an add-in requires 32-bit mode. 
The add-ins run automatically as 32-bit or 64-bit processes, depending on the version of the OneConnexx.

### Installation packages

Installation packages are provided by Sevitec in the form of 7-zip archives. The following packages are required:

* ocx-service.7z (basic service)
* ocx-addins.7z (standard add-ins)
* Any customer-specific add-ins in a separate installation package.

Copy all required installation packages onto the server in the directory <Drive>: \ OneConnexx \ Install .

If only one OneConnexx instance is installed, extract the content of ocx-service.7z to <Drive>: \ OneConnexx \ OneConnexxService , and the content of ocx-addins.7z in a subdirectory AddIns .

If several instances are planned (e.g. test and productive), it is recommended to unzip the installation packages in a subfolder
*&lt;Drive&gt;:\OneConnexx\<Instance name>* zu entpacken.

The following directory structure should then be available:

```
\OneConnexx
 |-<Instanzname>
   |-AddIns 
   |-Config
   |-Pipeline
```

{% include alert.html type="warning" text="Bei der Erstinstallation folgende Dateien umbenennen:<br/><br/> <em>OneConnexx.exe.config.sevitec</em> in <em>OneConnexx.exe.config</em><br/>
<em>Config\oneconnexx.config.sevitec</em> in <em>Config\oneconnexx.config</em><br/>
<em>Config\nlog.config.sevitec</em> in <em>Config\nlog.config</em>" %}

### Install service

The OneConnexx Windows service is installed per installation via the command prompt (Windows console). The command prompt must be opened as an administrator.
The name under which the service is installed must be given on the command line. 
If different instances (e.g. test and productive) are to be installed on the same server, a unique name must be used for each instance.

Change to the root directory of the OneConnexx and install the service:

```
cd \OneConnexx\OneConnexxService
OneConnexx.exe –install –servicename=OneConnexx
```

To uninstall:

```
OneConnexx.exe –uninstall –servicename=OneConnexx
```

-servicename = OneConnexx is replaced by the selected unique name of the instance.

In a company network, it is recommended to create a separate user for the OneConnexx under which the service is installed. 
To run the service under this user, proceed as follows:

```
sc config OneConnexx obj= "<Benutzername>" password= "<Passwort>"
```

* Replace *OneConnexx* with the name under which the service was installed
* \<Username \> must be written in the form *domain\Username * for a domain user and in the form*.\Username *
* What is important is the distance to<code>obj=</code> or from <code>password=</code>

#### File system permissions

If the OneConnexx service is not installed under the local system account (Local System / Local System), the  &lt;OneConnexx-User&gt; must be granted full authorization for the directory *&lt;Drive&gt;:\OneConnexx* and all subfolders. In this example, OneConnexx was installed under *C:\OneConnexx* under a user named *ocxservice*:

```
icacls C:\OneConnexx /grant ocxservice:(OI)(CI)RW
```

Since various files are stored in the *%ProgramData%\Sevitec\OneConnexx* , it must be ensured during the first installation that normal users have write access to this directory. The following commands create this directory and grant the required permission:

```
mkdir "%ProgramData%\Sevitec\OneConnexx"
icacls %ProgramData%\Sevitec\OneConnexx /grant Users:(OI)(CI)RW
```
configuration
### Konfiguration

##### OneConnexx.exe.config

The following parameters must be configured in the configuration file *&lt;Drive&gt;:\OneConnexx\OneConnexxService\OneConnexx.exe.config* :

* connectionString: The connection string to the database. If the OneConnexx Windows service is running under a domain user, "Integrated Security" should be selected. If no database is to be used, no connection string may be configured.
* AdminTcpChannel: TCP port 9501 is configured by default. If several OneConnexx instances are to be installed on a server, a unique port must be configured for each instance.
* ConfigArchiveDirectory: Optionally, a directory (local or as a network path) can be specified into which a backup of the configuration file is copied every time the configuration is changed.

All other configuration parameters should not be changed!

##### nlog.config

The logging of the OneConnexx service and the add-ins can be configured in the configuration file *&lt;Drive&gt;:\OneConnexx\OneConnexxService\Config\nlog.config*.
 . Normally nothing needs to be changed in the logging. The standard configuration is:

* Log files are created in the "Logs" subdirectory
* The current log file is called «oneconnexx.log»
* A new log file is written every day, the log files from the last 7 days are saved
* All log messages are recorded
