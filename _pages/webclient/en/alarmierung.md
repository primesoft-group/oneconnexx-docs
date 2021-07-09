---
layout: page
title: Alerting
permalink: "webclient/en/alarmierung/"
language: en
---
## introduction
Alerting is closely related to the rules from the area of ​​“monitoring”. 
The main task of the alerting is to monitor a specified combination of interface / endpoint and to send an information mail as soon as an incorrect transaction is written. 
The alerting is normally set in such a way that rule violations (in the form of a transaction) written by rule monitoring trigger the alerting mail directly.

__example__ 

Starting position:

Endpoint a of interface x should write a maximum of three successful transactions within 24 hours (rule). If endpoint a of interface x writes an incorrect transaction, a notification e-mail should be sent (alerting).

Adoption:

Four successful transactions are written within 24 hours for the endpoint a of the interface x

Result:

The rule monitoring writes a rule violation (= an incorrect transaction). Alerting registers the incorrect transaction and triggers the infomail accordingly.

The infomail is also triggered if endpoint a of interface x writes an incorrect transaction without a rule violation (e.g. filecopy fails)

## Overview

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/alertingsOverview.png "Übersicht Regeln")  

#### 1. Text search
The text search restricts the list to entries that contain a certain expression. In contrast to many text search fields in the OneConnexx, there is no possibility to use regular expressions here.

#### 2. Filter
If the "Inactive" checkbox is not checked, only the active alertings are displayed. The opposite happens if the "Active" checkbox does not have a tick.

#### 3. Sorting
This button can be used to change the sorting. Either AZ or ZA. This button is available for every column. The last sorting set is always active.

#### 4. Export
All alertings are exported when you click this button.

#### 5. Add alert
When you click on this button, the following dialog opens:

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/addAlerting.png "Neue Regel hinzufügen")  

To create the alert, an interface can be selected from the list of existing interfaces. A specific endpoint of the interface can also be entered (not selected) (* for all endpoints of the selected interface). You can also choose whether the alert should only be triggered if a rule is violated or if there is an error in the transaction. The interface and the endpoint are then monitored and as soon as an incorrect transaction or a rule violation is written, a mail is sent to the defined recipient. In addition, the name of the interface and the endpoint and the message of the transaction can be accessed in the text using the placeholders defined under the input field for the message.

#### 6. Delete / edit alert
An alert can be edited with a click on the left button. An alert can be deleted with a click on the right button.
