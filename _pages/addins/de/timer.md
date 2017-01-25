---
layout: page
title: Timer
permalink: "addins/de/timer/"
---

Das Timer AddIn ist das meistverwendete AddIn. Das Timer AddIn löst Events zu fast jeder beliebigen Zeit und Datum aus.


{:.table .table-striped}
| --- | --- |
| __Merkmale__ | |
| AddIn Type | Event |
| Schnittstellen |  |
| Transaktionen |  |
| Ereignisse | &lt;Instanz&gt; |
| | |
| __Parameter__ | |
| interval | Intervallzeit des Timers in Millisekunden<br />Werden keine weiteren Angaben gemacht, löst das Timer AddIn jeweils nach Ablauf des Intervalls einen Event aus.<br />Werden jedoch weitere Angaben gemacht, wirken sich dies als Filter auf die Intervallzeit aus. Es sind auch Kombinationen möglich, wie z.B. «am 1. Tag pro Monat um 06:00» oder «sonntags um 20:00». |
| timeOfDay | Filter für eine bestimmte Tageszeit<br />Angabe in Stunden und Minuten. Mehrere Tageszeiten werden mit Semikolon getrennt. Bsp. «06:30; 12.00» |
| dateOfYear | Filter für ein bestimmtes Datum oder Monatstag<br />Bsp. «31.12.» oder «1.;14.» (pro Monat am 1. und 14.) |
| dayOfWeek | Filter für bestimmte Wochentage (1=Montag, …, 7=Sonntag)<br />Bsp. «1;2;3;4;5» für alle Arbeitstage |


## Anwendungsbeispiele

### Jeden Morgen um 6:00
- interval = 60000 (pro Minute einmal die weiteren Filter überprüfen)
- timeOfDay = 06:00 (Morgens um 6:00)

### Jährlich am 1.Januar ausführen
- interval = 60000 
- timeOfDay = 06:00 
- dateOfYear = 1.1 (am 1. Januar)

### Am ersten Montag eines Monats
- interval = 60000 
- timeOfDay = 06:00 
- dateOfYear = 1.; 2.; 3.; 4.; 5.; 6.; 7.  (am 1. oder 2. oder ...)
- dayOfWeek = 1 (Montag, in Kombination mit dateOfYear wird es der 1. Montag eines Monats sein).
