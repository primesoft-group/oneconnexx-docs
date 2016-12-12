---
layout: page
title: Log
permalink: "webclient/de/log/"
---
## Echtzeit

Die Ansicht «Echtzeitlog» bietet eine Übersicht über die Logeinträge welche Aktuell geschrieben werden. Der Aktualisierungszyklus liegt bei einer Sekunde. Neue Einträge werden unten an der Liste angefügt und der Bildlauf automatisch aktualisiert, d.h. das Fenster scrollt automatisch nach unten um die aktuellsten Logeinträge anzuzeigen

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/realtimelog.png "Realtime Log")

 __Aufbau eines Logeintrags__

 ![X]({{ site.baseUrl }}/assets/content-images/webclient/de/logentry.png "Aufbau Logeintrag")

### 1. Textfilter

Die Textsuche schränkt die Liste auf Einträge ein, welche einen bestimmten Ausdruck enthalten. Das kann ein normales Wort sein oder ein sogenannter Regulärer Ausdruck.
Folgende Links enthalten weiterführende Informationen diesbezüglich:  

* <https://de.wikipedia.org/wiki/Regul%C3%A4rer_Ausdruck>  
* <http://regexr.com/>  

### 2. Automatischer Bildlauf

Durch deaktivieren dieser Option wird der automatische Bildlauf gestoppt. Die Logeinträge werden weiterhin automatisch der Liste hinzugefügt, jedoch nicht mehr Automatisch die aktuellsten Logeinträge angezeigt.

### 3. Anzeige Löschen

Diese Aktion löscht die gesamte Anzeige der Logs. Wenn die Anzeige gelöscht werden, sind die Logeinträge im Echtzeitlog nicht mehr ersichtlich und müssen über die Ansicht «Auswertung» eingesehen werden.
Das Löschen wirkt sich nicht auf die Einträge in der LogDatei aus.

## Auswertung
