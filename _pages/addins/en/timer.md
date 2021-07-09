---
layout: page
title: Timer
permalink: "addins/en/timer/"
language: en
---

The timer add-in is the most widely used add-in. The timer add-in triggers events at predefined times.<br /><br />

{:.table .table-striped}
| --- | --- |
| __features__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-in type | Event |
| Interfaces |  |
| Transactions |  |
| Events | &lt;instance&gt; |
| | |
| __parameter__ | |
| interval | Interval time of the timer in milliseconds<br />If no further information is given, the timer add-in triggers an event after the interval has expired.<br />However, if further information is provided, it acts as an additional filter. Combinations are also possible, such as "on the 1st day of every month at 6:00 a.m." or "Sundays at 8:00 p.m.". |
| timeOfDay | Filter for a specific time of day,<br />specified in hours and minutes. Several times of the day are separated by semicolons. Example: "06:30; 12:00" |
| dateOfYear | Filters for a specific date or day of the month<br />Multiple dates can be separated by semicolons. Example: "31.12." (only on this day) or «1st; 14th» (always on the 1st and 14th of each month) |
| dayOfWeek | Filter for certain days of the week (1 = Monday, ..., 7 = Sunday)<br />Example: "1; 2; 3; 4; 5" (on all working days) |


### Application examples

##### Every morning at 6:00
- interval = 60000 (check the other filters once per minute)
- timeOfDay = 06:00 (in the morning at 6:00)

##### Annually on January 1st at 6:00 a.m.
- interval = 60000 
- timeOfDay = 06:00 
- dateOfYear = 1.1. (on 1. Januar)

##### At 6:00 a.m. on the first Monday of each month
- interval = 60000 
- timeOfDay = 06:00 
- dateOfYear = 1.;2.;3.;4.;5.;6.;7. (an einem der ersten 7 Tage jedes Monats)
- dayOfWeek = 1 (Monday, in combination with dateOfYear it will be the 1st Monday of the month).
