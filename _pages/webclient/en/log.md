---
layout: page
title: Log
permalink: "webclient/en/log/"
language: en
---
## Real time

The «Real-time log» view provides an overview of the log entries that are currently being written. The update cycle is one second. New entries are added to the bottom of the list and the scrolling is automatically updated, ie the window automatically scrolls down to display the most recent log entries

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/realTimeLog.png "Realtime Log")

Structure of a log entry:

 ![X]({{ site.baseUrl }}/assets/content-images/webclient/de/logEntry.png "Aufbau Logeintrag")

#### 1. Text filter

The text search restricts the list to entries that contain a certain expression. This can be a normal word or a so-called regular expression. The following links contain further information on this:

* <https://de.wikipedia.org/wiki/Regul%C3%A4rer_Ausdruck>  
* <http://regexr.com/>  

#### 2. Automatic scrolling

Deactivating this option will stop the automatic scrolling. The log entries are still automatically added to the list, but the latest log entries are no longer automatically displayed.

#### 3. Delete display

This action clears the entire display of the logs. If the display is deleted, the log entries are no longer visible in the real-time log and must be viewed in the "Evaluation" view. The deletion does not affect the entries in the log file.

## evaluation

All the log entries in the log directory can be filtered in the «Evaluation» view. In contrast to the real-time log, the newly written logs are not loaded automatically. The «Update Log» button allows the list to be updated at any time. The filter process is carried out automatically as soon as a value in the filter boxes changes. (Delay approx. 1.5 seconds)

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/filterLogs.png "Log Auswertung")

#### 1. Date filter

  The time period for the log entries is restricted with the date filter.
  
#### 2. Text filter

The text search restricts the list to entries that contain a certain expression. By activating the advanced search, regular expressions can be used. 
The following links contain further information on this:

* <https://de.wikipedia.org/wiki/Regul%C3%A4rer_Ausdruck>  
* <http://regexr.com/>  

#### 3. log level

With the filter log level, the list is restricted to one or more log levels. 

#### 4. Add-in / instance

With the Add-In filter, the list is restricted to one or more specific add-ins. All instances can be expanded / collapsed with the arrow at the top right. As on the configuration page, the sorting between group (folder symbol) and type (puzzle piece) can be changed here.

#### 5. Control buttons
  * **Hide filter:** Hides the above filter boxes so that only the log entries are displayed.
  * **Update log:** Loads the latest log entries from the log files.
  * **Reset filter:** Resets all filter criteria to their default values.
  * **Oldest on top:** Sorts the log entries by time so that the oldest entry is on top.
  * **Latest on top:** Sorts the log entries according to time so that the newest entry is on top.

#### 6. Context menu / filter for an instance

If you click with the right mouse button on a log entry, a context menu is displayed:

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/contextmenu.png "Kontextmenu")

With the “Filter by instance” command, the filter is automatically adjusted so that only log entries from the selected instance are displayed in a range of +/- 1 minute from the selected log entry.

