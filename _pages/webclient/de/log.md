---
layout: page
title: Log
permalink: "webclient/de/log/"
---
## Echtzeit

Die Ansicht «Echtzeitlog» bietet eine Übersicht über die Logeinträge welche Aktuell geschrieben werden. Der Aktualisierungszyklus liegt bei einer Sekunde. Neue Einträge werden unten an der Liste angefügt und der Bildlauf automatisch aktualisiert, d.h. das Fenster scrollt automatisch nach unten um die aktuellsten Logeinträge anzuzeigen

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/realTimeLog.png "Realtime Log")

Aufbau eines Logeintrags:

 ![X]({{ site.baseUrl }}/assets/content-images/webclient/de/logEntry.png "Aufbau Logeintrag")

#### 1. Textfilter

Die Textsuche schränkt die Liste auf Einträge ein, welche einen bestimmten Ausdruck enthalten. Das kann ein normales Wort sein oder ein sogenannter Regulärer Ausdruck.
Folgende Links enthalten weiterführende Informationen diesbezüglich:  

* <https://de.wikipedia.org/wiki/Regul%C3%A4rer_Ausdruck>  
* <http://regexr.com/>  

#### 2. Automatischer Bildlauf

Durch deaktivieren dieser Option wird der automatische Bildlauf gestoppt. Die Logeinträge werden weiterhin automatisch der Liste hinzugefügt, jedoch nicht mehr Automatisch die aktuellsten Logeinträge angezeigt.

#### 3. Anzeige Löschen

Diese Aktion löscht die gesamte Anzeige der Logs. Wenn die Anzeige gelöscht wird, sind die Logeinträge im Echtzeitlog nicht mehr ersichtlich und müssen über die Ansicht «Auswertung» eingesehen werden.
Das Löschen wirkt sich nicht auf die Einträge in der Logdatei aus.

## Auswertung

In der Ansicht «Auswertung» können die gesamten im Logverzeichnis liegenden Logeinträge gefiltert werden. Im Unterschied zum Echtzeitlog werden die neu geschriebenen Logs nicht automatisch geladen. Die Schaltfläche «Log Aktualisieren» erlaubt aber jederzeit eine Aktualisierung der Liste. Der Filtervorgang wird automatisch ausgeführt, sobald sich ein Wert in den Filterboxen ändert. (Verzögerung ca. 1.5 Sekunden)

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/filterLogs.png "Log Auswertung")

#### 1. Datumsfilter

  Mit dem Datumsfilter wird die Zeitspanne der Logeinträge eingeschränkt. 
  
#### 2. Textfilter

Die Textsuche schränkt die Liste auf Einträge ein, welche einen bestimmten Ausdruck enthalten. 
Durch das Aktivieren der erweiterten Suche können Reguläre Ausdrücke verwendet werden. Folgende Links enthalten weiterführende Informationen diesbezüglich:  

* <https://de.wikipedia.org/wiki/Regul%C3%A4rer_Ausdruck>  
* <http://regexr.com/>  

#### 3. Logstufe

Mit dem Filter Logstufe wird die Liste auf ein oder mehrere Loglevel eingeschränkt.  

#### 4. Add-In/Instanz

Mit dem Filter Add-In wird die Liste auf ein oder mehrere spezifische Add-Ins eingeschränkt. Mit dem Pfeil oben rechts können alle Instanzen aus/eingeklappt werden. Gleich wie auf der Konfigurationsseite kann hier die Sortierung zwischen Gruppe (Ordnersymbol) und Typ (Puzzleteil) gewechselt werden.

#### 5. Steuerschaltflächen  
  * Filter Ausblenden <br />
    Blendet die obigen Filterboxen aus, sodass nur die Logeinträge angezeigt werden.
	
  * Log Aktualisieren <br />
    Lädt die neuesten Logeinträge aus den Logfiles.
	
  * Filter zurücksetzen <br />
    Setzt alle Filterkriterien auf ihren Standardwert zurück.
    
  * Älteste zuoberst <br />
    Ordnet die Logeinträge nach Zeit, so dass der älteste Eintrag zuoberst ist.
  
  * Neuste zuoberst <br />
    Ordnet die Logeinträge nach Zeit, so dass der neuste Eintrag zuoberst ist.

#### 6. Kontextmenu / Filtern nach einer Instanz

Klickt man mit der rechten Maustaste auf einen Logeintrag, wird ein Kontextmenu angezeigt:

![X]({{ site.baseUrl }}/assets/content-images/webclient/de/contextmenu.png "Kontextmenu")

Mit dem Befehl "Nach Instanz filtern" wird der Filter automatisch so angepasst, dass nur noch Logeinträge der ausgewählten Instanz in einem Bereich von +/- 1 Minute zum ausgewählten Logeintrag angezeigt werden.

