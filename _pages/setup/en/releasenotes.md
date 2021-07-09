---
layout: page
title: Version history
permalink: "setup/en/releasenotes/"
language: en
---

#### vNext

* __New__ FileCopy Add-In: parameter sourceTimeFilter also for FILE and SFTP protocol.


#### 1.4.5

* __New__ New Add-In List2Csv to export SharePoint Online lists to CSV files.
* __New__ New add-in SharepointToDB to export items from SharePoint Online document libraries or lists to a database.
* __New__ FileCopy Add-In: Files can be downloaded from SharePoint Online document libraries.
* __New__ SharepointEraser Add-In: New parameters "subFolder" and "recursive".
* __New__ display of the alarm history (list of the most recently sent alarms).
* __BREAKING CHANGE__ FileCopy FileCopy Add-In: If "destinationProtocol" = SHAREPOINT, the URL to the document library must be specified again in the "destinationSystem" parameter.


#### 1.4.3

* __New__ Ldap2CSV Add-In: New data type "bitmask"
* __New__ Csv2Database Add-In: New parameter "fileNameColumn"
* __New__ display of utilization
* __Error__ Csv2Database Add-In: Overly long texts are shortened to the length of the database field
* __Error__ WebConnect: : JSON return value formatting corrected, logging improved
* __Error__ OneMessageAddIn: OneMessageAddIn: Error corrected if no trace was used


#### 1.4.1

* __Error__ instances of OneOffixxDocumentCreator not running in parallel
* __Error__ Csv2Database Add-In: Support of tabs as separators, support of column names with special characters
* __New__ FileCopy Add-In: New parameter "skipExistingFiles"


#### 1.4.0

* __New__ FileCopy Add-In: Support for a "Filter" event with which another Add-In can manipulate the file to be copied
* __New__ TextReplace add-in
* __New__ MailSender Add-In: Support of TLS and authentication
* __New__ configurator role can be defined for each instance
* __New__ display of version number and modification date of an add-in
* __New__ Improved display of alerts for many email addresses
* __New__ Improved display of rule execution time in the overview
* __New__ statistics can be updated manually
* __New__ statistics can also be displayed as tables
* __New__ context menu in log analysis for filtering log entries for an instance
* __Error__ Users who are not in the configurator role can no longer copy or delete instances via the context menu
* __Error__ Parameter values ​​containing XML tags could not be saved correctly
* __Error__ Multi-line parameters were not handled correctly (DatabaseToCsv, DatabaseMaintenance, Dispatcher, Csv2Database)
* __Error__ No more session timeout in web administration


#### 1.3.0

* __New__ DatabaseMaintenance Add-In: Possibility to execute any SQL command
* __New__ The order of the statistics can be changed using drag and drop
* __New__ New parameter type for multi-line texts (see DatabaseToCsv, DatabaseMaintenance, Dispatcher, Csv2Database)
* __New__ display of the OneConnexx version in the web administration, reference to incompatible versions


#### 1.2.1

* __New__ list of installations is sorted alphabetically by name
* __New__ FileEraser Add-In supports multiple search patterns
* __New__ page "Alerting" is now a subpage of "Monitoring"
* __New__ New page "Statistics"
* __New__ Improved display for small screen widths (e.g. mobile devices)
* __New__ possibility to check rules only on certain days of the week or days of the month
* __New__ Standard texts can be defined in Web.config for new alarms
* __New__ option in log analysis to display the latest entries at the top
* __New__ rules and alarms can be exported as an Excel file
* __New__ rules and alerts can be filtered according to active / inactive
* __New__ option to issue alerts only in the event of rule violations and not for every faulty transaction
* __New__ FileCopy Add-In: Possibility to upload files> 2MB to SharePoint Online
* __New__ Xls2Csv add-in
* __New__ Csv2Database add-in
* __Error__ If the list of installations contained old entries with the same port number, the wrong connection string may have been used
* __Error__ FileCopy Add-In: deleting and archiving on SFTP Server did not work
* __Error__ FileCopy Add-In: If parameters were set by a Dispatcher Add-In and the configuration changed at the same time, the parameters were reset again
* __Error__ FileCopy Add-In: file name is written to transaction
* __Error__ FileCopy Add-In: Absolute paths now also work with the SFTP protocol
* __Error__ FileCopy Add-In: FTPS supports newer protocols
* __Error__ Ldap2CSV: Date format now also works for date fields
* __Error__ Immediately after renaming an instance, parameter changes were not saved
* __Error__ Improved bug behavior when moving instances to interfaces
* __Error__ In the HTML view, changes to the email text of alerts were not saved
* __Error__ Encoding Error loading transactions on the "monitoring"
* __Error__ log analysis did not work if there are other files in the "Logs" directory
* __Error__ Real-time log is reset each time the page is reloaded, otherwise the browser freezes with large amounts of data
* __Error__ Ldap2CSV, Xml2Csv: Ldap2CSV, Xml2Csv: double quotation marks if necessary


#### 1.1.4

* __Error__ corrected bizagi / OneMessage transformation


#### 1.1.3

* __New__ status of the checkbox and interfaces on the Monitoring / Overview page is saved in a cookie
* __Error__ corrected wrong English date format to the Monitoring page / Overview
* __Error__ corrected wrong English date format to the Monitoring page / Overview


#### 1.1.2

* __New__ tandard add-in "OneMessageAdapter"
* __New__ context menu in the tree for instances, add-ins and groups
* __Error__ error message in web administration if 'installation' directory is missing
* __Error__ grouping by add-in or group is saved permanently
* __Error__ order of the instances within a group was not always saved correctly
* __Error__ 'Last 5 min' button on the log analysis page did not update the start time
* __Error__ log files are now written in UTF-8 by default


#### 1.1.0

* __New__ OneConnexx installations are saved under %ProgramData%\Sevitec\OneConnexx\Installations and can no longer be added manually in the web administration
