---
layout: page
title: Timer
permalink: "addins/de/timer/"
language: de
---

Das Timer Add-In ist das meistverwendete Add-In. Das Timer Add-In löst Ereignisse zu vordefinierten Zeitpunkten aus.<br /><br />

{:.table .table-striped}
| --- | --- |
| __Merkmale__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-In Type | Event |
| Schnittstellen |  |
| Transaktionen |  |
| Ereignisse | &lt;Instanz&gt; |
| | |
| __Parameter__ | |
| interval | Intervallzeit des Timers in Millisekunden<br />Werden keine weiteren Angaben gemacht, löst das Timer Add-In jeweils nach Ablauf des Intervalls ein Ereignis aus.<br />Werden jedoch weitere Angaben gemacht, wirken sich diese als zusätzliche Filter aus. Es sind auch Kombinationen möglich, wie z.B. «am 1. Tag jeden Monat um 06:00» oder «Sonntags um 20:00». |
| timeOfDay | Filter für eine bestimmte Tageszeit<br />Angabe in Stunden und Minuten. Mehrere Tageszeiten werden mit Semikolon getrennt. Bsp.: «06:30;12:00» |
| dateOfYear | Filter für ein bestimmtes Datum oder Tag des Monats<br />Mehrere Daten können durch Semikolon getrennt werden. Bsp.: «31.12.» (nur an diesem Tag) oder «1.;14.» (immer am 1. und 14. jedes Monats) |
| dayOfWeek | Filter für bestimmte Wochentage (1=Montag, …, 7=Sonntag)<br />Bsp.: «1;2;3;4;5» (an allen Arbeitstagen) |


### Anwendungsbeispiele

##### Jeden Morgen um 6:00
- interval = 60000 (pro Minute einmal die weiteren Filter überprüfen)
- timeOfDay = 06:00 (Morgens um 6:00)

##### Jährlich am 1. Januar um 6:00 Uhr
- interval = 60000 
- timeOfDay = 06:00 
- dateOfYear = 1.1. (am 1. Januar)

##### Am ersten Montag eines Monats um 6:00 Uhr
- interval = 60000 
- timeOfDay = 06:00 
- dateOfYear = 1.;2.;3.;4.;5.;6.;7. (an einem der ersten 7 Tage jedes Monats)
- dayOfWeek = 1 (Montag, in Kombination mit dateOfYear wird es der 1. Montag eines Monats sein).
