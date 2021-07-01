---
layout: page
title: Monitoring
permalink: "webclient/en/ueberwachung/"
language: en
---
## Overview

The monitoring category consists of the three views «Overview», «Interfaces» and «Rules». The main task of monitoring is to manage the add-ins, sort them logically and clearly display the transactions written by the add-ins. Rules for the transactions can also be defined. The transactions written by the add-ins are clearly displayed in the overview. 
They are grouped by interface and sorted alphabetically and alphabetically sorted by end point within the group. Transactions are written when:

  * An add-in successfully completed a called operation.
  * An add-in could not successfully complete a called operation.

Transactions are similar to log entries, but differ in the following ways: 

  * A transaction is only written when the main function of an add-in is performed, and only the final result of the call is written.
A transaction thus only contains the final result of a call, while log entries record the process of the call

In the case of transactions that are incorrect, the status and the message text are displayed in red.
A maximum of the latest 20 transactions are displayed per interface. 
Interfaces that contain incorrect transactions are expanded from the start

### Building a transaction

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/transaction.png "Aufbau Transaktion")  

#### 1. Interface  
  The interface represents the higher-level logical grouping. The number of incorrect transactions is displayed on the same level

#### 2. end point
  The end point is an optional parameter which can be defined in the add-in configuration. It is also used for the logical structuring of the add-ins / transactions and has no influence on functionalities in the software.
  
#### 3. Timestamp
  The time stamp indicates the time at which the transaction was written.
  
#### 4. Status
  The status indicates whether the function was completed successfully or with errors.
  
#### 5. Message
  The message gives further details about the Written transaction. If the execution was successful, what was executed; if the execution was unsuccessful, what failed.
  
### Steuerschaltflächen

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/monitoringOverview.PNG "Überwachung Übersicht")

#### 1. Text filter
  Die Textsuche schränkt die Liste auf Einträge ein, welche einen bestimmten Ausdruck enthalten.
  Im Unterschied zu vielen Textsuchfeldern im OneConnexx besteht hier keine Möglichkeit reguläre Ausdrücke zu verwenden 

#### 2. Unfold / fold all
  All interfaces can be expanded with the down arrow. all interfaces can be collapsed with the up arrow.
  
#### 3. Show errors only
  Shows only the bad transactions. Interfaces that do not contain any incorrect transactions are automatically hidden
  
#### 4. Delete the transaction
  A transaction can be deleted with this button. A dialog opens asking you to confirm the deletion. Clicking the "Delete" button executes the delete command. Clicking the Cancel button takes you back to the overview page
  
#### 5. Load the interface history
  With this button the history of all transactions of an interface / endpoint combination can be loaded. The next 25 entries are loaded. The next 25 can be loaded via another button that appears. If no more than 25 data records are found in the database, the button to load more is no longer displayed.
  
## Interface configuration
The interfaces can be configured in the "Interfaces" view. An interface is used to organize and group the configured add-in instances.

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/interfaceConfiguration.PNG "Schnittstellenkonfiguration")

In the left view are the interfaces and the assigned add-ins, in the right the configured add-ins which are not assigned to any interface

#### 1. Text search
The text search restricts the list to entries that contain a certain expression. In contrast to many text search fields in the OneConnexx, there is no possibility to use regular expressions here

#### 2. Control buttons
The interfaces can be managed and configured with the configuration buttons

* An interface can be deleted with the symbol on the left. An interface can only be deleted if there are no transactions or rules for it. The subordinate add-ins are automatically moved back to the right view.
* The name of an interface can be edited with the symbol in the middle.
* A new interface can be added with the symbol on the right.

The add-ins can easily be dragged from the right view to the left using drag and drop and thus assigned to the interfaces and moved as required.

* Any number of add-ins can be added to an interface
* No further interface can be subordinate to an interface.
* Add-ins can only be subordinate to interfaces; an add-in as a sub-element of an add-in is not possible. 
regulate
## Regeln
In the "Rules" view, rules for the transactions of an interface can be configured. These rules are not used to monitor incorrect transactions, but to check whether an interface / endpoint combination writes a certain number of __successful transactions__  in a defined period of time. If this rule is not met, an incorrect transaction is written to the endpoint to which the rule is assigned. This transaction can either be left as it is, but is usually linked to the alarm. In the alerting, monitoring can be set on an interface / endpoint combination, which triggers a notification e-mail in the event of a faulty transaction. More about this under "Alerting"

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/rulesOverview.png "Regeln")

#### 1. Text search  
The text search restricts the list to entries that contain a certain expression. In contrast to many text search fields in the OneConnexx, there is no possibility to use regular expressions here

#### 2. Filter
If the Inactive checkbox is not checked, only the active rules are displayed. The opposite happens if the Active checkbox does not have a tick.

#### 3. Sorting  
This button can be used to change the sorting. Either AZ or ZA. This button is available for every column.

#### 4. Export
All rules are exported when you click this button.

#### 5. Add rule  
When you click on this button, the following dialog opens:

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/addNewMonitoringRule.png "Neue Regel hinzufügen")  

### Structure of the rule:
A rule is composed as follows:

__1:__ A rule has a name, an interface and an end point for which the rule is used.

__2:__ It contains a limit mode (maximum or minimum upper limit).

__3:__ The number of transactions in a certain period can also be given.

Together, these fields result in the rule (for example: a maximum of 1 transaction in the last 24 hours), which is applied to the specified interface and the endpoint.

__4:__ A rule is evaluated once a day at the execution time, which can be specified down to the minute. 

__5:__ Repeating by field indicates the number of hours after which the rule will be re-evaluated.

__6:__ The days of the week on which the rule is evaluated can also be specified.

__7:__ In the Days of Month field, you can specify the days of the month on which the rule will be evaluated.

For example: The rule is evaluated on the first, third, and fifth to tenth days of the month.

#### 6. Delete / edit rule 
A rule can be edited with a click on the left button. A rule can be deleted with a click on the right button.
