---
layout: page
title: statistics
permalink: "webclient/en/statistik/"
language: en
---

The statistics page shows configured statistics from the database. There are four different types of graphs: pie, vertical bar, horizontal bar, and line graph.

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/statisticsPage.PNG "Statistik Seite")

### Statistics overview
The functions create, edit and delete are only available for users with admin / configurator rights. 
All statistics areas are displayed on the left and the statistics of the currently active area on the right. If there is no area in the database, the General Statistics area is created. An area can only be deleted if it does not contain any statistics.

#### 1. Statistics area
The name of the area is displayed here, new statistics can be created and the area can be edited. 
If the area contains statistics, the icon for deletion will be grayed out and will not be activated again until all statistics have been deleted from this area. The current area is already selected when it is created.
	
#### 2. Edit and delete statistics
The statistics can be edited by clicking on the icon with the pen and the paper. With the trash can icon, a dialog appears with information that this action has finally been carried out. The statistics are deleted from the database and also removed from the page at the same time.

The order of the statistics within an area can be shifted by means of drap-and-drop. This also immediately adjusts the order of the diagrams.
	
#### 3. Add statistics area
A new statistics area can be added here.

#### 4. Edit statistics
The diagrams of the currently active area are displayed here. If you move the mouse over a diagram, 3 icons are displayed at the top right to **aktualisieren**, **edit ** or **delete** the statistics.

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/statisticrefresh.png "Statistik aktualisieren/editieren/löschen")

The order of the diagrams can be changed using drap-and-drop. This also immediately changes the order of the statistics in the statistics area.

### Edit statistics

Clicking the edit icon opens the dialog with the properties of the statistics:

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/statisticInputDial.PNG "Statistik erstellen/editieren Dialog")

* **Name:**	The statistics can be given a name to give the viewer information about the content.
* **Diagram type:**	The type of diagram can be selected here.
* **Height / width:**	In order to make the diagram easier to read, you can define yourself how large / small it should be displayed.
* **Legend:** The legends can be entered here, separated by commas.
* **Sql:** The query of the database, which is required to deliver the data to be displayed. The result must be in the format: label, string | FirstValue, int | SecondValue, int are returned. The SecondValue field is optional.
	

### Edit statistics area

If you click on the edit icon of a statistics area or on the icon for creating a new area, the dialog with the properties of the statistics area opens:

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/addStatisticArea.PNG "Statistikbereich erstellen/editieren Dialog")

* **Name:**	The statistics area can be given a name to give the viewer information about the content.
