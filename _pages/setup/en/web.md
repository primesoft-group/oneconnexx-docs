---
layout: page
title: Web-Administration
permalink: "setup/en/web/"
language: en
---

### Prepare the server

With the help of the Powershell script [IISOneConnexxScript.ps1]({{ site.baseurl }}/assets/content-files/IISOneConnexxScript.ps1)  , the required server roles and features are automatically installed.

#### Manual installation

Add the following server roles in the Server Manager under "Add roles and features":

* WebServer (IIS)
  * Management tools
    * IIS Management Console
  * Web Server
    * Security -> Windows Authentication
    * Application Development -> ASP.NET 4.5

And under features:

* .NET Framework 4.5

In Windows Server 2008:

* Activate the ASP.NET application feature
* WebServer IIS -> Add Roles -> ASP.NET

### Installation packages

Installation packages are provided by Sevitec in the form of 7-zip archives. The following packages are required:

* ocx-web.7z

Copy the required installation package to the server in the directory *&lt;Drive&gt;:\OneConnexx\Install* kopieren.

Extract the contents of the installation package to *&lt;Drive&gt;:\OneConnexx\Web* entpacken.

Rename the file *Web.config.sevitec* to *Web.config*.

Right-click on the «Web» directory and choose Properties -> Security, Add IIS_IUSRS group with read & execute rights.

```
icacls C:\OneConnexx\Web /grant IIS_IUSRS:(OI)(CI)RX
```

{% include alert.html type="warning" text="The web administration only needs to be installed in one instance. It can administer several OneConnexx installations." %}

### Set up IIS

Unter «Sites» -> right mouse button -> «Add Website…»

* Name = OneConnexxAdministration
* Physical Path = &lt;drive&gt;:\OneConnexx\Web
* Binding, Port = 9500

Click on the newly created site -> Authentication -> Windows Authentication = Enabled

Under ApplicationPools make sure that the newly created ApplicationPool «OneConnexxAdministration» has selected the version "v4.0" as ".NET CLR Version".

#### Grant IIS authorization to stop / start the service

So that the OneConnexx Windows service can be stopped / started by the web application, the user under which the IIS is running must be granted the appropriate authorization.

1. Download subinacl  ([http://www.microsoft.com/en-us/download/details.aspx?id=23510](http://www.microsoft.com/en-us/download/details.aspx?id=23510))
1. Install subinacl
1. Open command prompt as administrator
1. Change to the directory where subinacl was installed (z.B. C:\Program Files (x86)\Windows Resource Kits\Tools\)
1. ```subinacl /service OneConnexx /grant=IIS_IUSRS=F```

{% include alert.html type="warning" text="The last command must be executed for each installed OneConnexx instance. «OneConnexx» is the name under which the Windows service was installed. «IIS_IUSRS» is a user group which from IIS 7.0 automatically contains all ApplicationPool identities." %}

#### File system permissions for IIS

The web administration requires read access to the log files as well as to the add-ins DLLs in the shadow directory (to read the version).

For this purpose, the IIS_IUSRS user group is granted read access to the OneConnexx installation directory including all subdirectories. If several OneConnexx instances are installed, the authorization must be set individually for each directory. 

```
icacls C:\OneConnexx\OneConnexxService /grant IIS_IUSRS:(OI)(CI)R
```

If the name or the connection string of the database is configured for a OneConnexx instance, this information is saved in a file «connection.config» in the directory *%ProgramData%\Sevitec\OneConnexx*:

```
mkdir "%ProgramData%\Sevitec\OneConnexx"
icacls %ProgramData%\Sevitec\OneConnexx /grant Users:(OI)(CI)RW
```

### Log files and saved connections

The web administration writes log files to the *%ProgramData%\Sevitec\OneConnexx\WebAdmin*.

The web administration reads a list of all installed OneConnexx instances from the directory *%ProgramData%\Sevitec\OneConnexx\Installations*.

If the name or the connection string of the database is configured for a OneConnexx instance, this information is saved in a file «connection.config» in the directory *%ProgramData%\Sevitec\OneConnexx\WebAdmin*.

{% include alert.html type="warning" text="The %ProgramData% directory is usually an invisible directory and is located under C:\ProgramData." %}

### Configuration in Web.config

The following settings can be made in the Web.config file (under *&lt;drive&gt;:\OneConnex\Web*).

__Logging__

By default, log files are written to the *%ProgramData%\Sevitec\OneConnexx\WebAdmin* directory.
A new log file is created every day and the files from the last 7 days are archived. These settings can be changed in the &lt;nlog&gt; section. 
All possible settings are described at https://github.com/nlog/nlog/wiki .

__Display language__

The OneConnexx web administration is bilingual (German/English) and uses the browser language by default, or English if the browser language is not German or English. 
If the display language is to be set independently of the browser language, this can be specified in the &lt;globalization&gt; onfiguration element.
The default setting is:

```
<globalization enableClientBasedCulture="true" uiCulture="auto" culture="auto" />
```

To permanently change the display language to English:

```
<globalization enableClientBasedCulture="true" uiCulture="en-gb" culture="en-gb" />
```

__Permissions__

Access to the web administration is controlled via «Windows Authentication», ie based on the registered Windows user. 
Who basically has access to the web administration is specified in the  &lt;authorization&gt; section:

```
<authorization>
  <allow roles="corp\OcxUsers" />
  <deny users="*" />
</authorization>
```

With this example all members of the user group "OcxUsers" in the domain "corp" have access. Instead of a user group, individual users can also be specified (example: &lt;allow users="corp\jones" /&gt;).

Additional authorizations are controlled via a role concept. The roles are:

* *User*: Can connect to all configured OneConnexx installations. Has read-only access to configuration settings. Sensitive configuration parameters such as passwords cannot be viewed.
* *Configurator*: Can also create, delete and configure add-ins. All configuration parameters can be viewed and changed.
* *Administrator*: Like configurator, but can also create, delete and edit OneConnexx installations and start and stop Windows services.

The  *Administrator*  role can be assigned to an individual Windows user or to a Windows user group in the *Web.config* . Multiple users or user groups can be specified separated by commas.

```
<add key="AdminRole" value="corp\OcxAdmins" />
```

Warning: If this parameter is not specified or is set to an empty string, the administrator role applies to **all** users.

The members of the configurator role can be edited directly on the [Configuration]({{site.baseurl }}/webclient/en/konfiguration/) page for each OneConnexx installation.

Users who are neither in the *configurator* nor in the *administrator* role, but generally have access to the web application, belong in the *user* role.

__Deactivating functions__

The "Configuration files" page in the main menu can be deactivated with the following entry:

```
<add key="Feature.ConfigFiles" value="false" />
```

The "Statistics" page in the main menu can be deactivated with the following entry:

```
<add key="Feature.Statistic" value="false" />
```

__Standard texts for new alarms__

The e-mail subject and text for newly created alarms can be specified with the following entries:

```
<add key="Alert.Subject.Default" value="Error on interface {interface} / {endpoint}" />
<add key="Alert.Body.Default" value="There was a problem with the interface {interface} and endpoint {endpoint}:&lt;br/&gt;{message}" />
```
