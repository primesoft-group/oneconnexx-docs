---
layout: page
title: "Function: SnippetsResolver"
subtitle: Textbausteine einbauen
permalink: "connect/de/functions/snippets/"
---

## OneOffixx-Gespeicherte Textbausteine {% include anchor.html name="internal" %}


Es soll ein neues Dokument erstellt werden und mit Textbausteinen (Snippets) befüllt werden. Die Anzahl der Textbausteine ist beliebig. Die Textbausteine werden in die Bookmarks eingepflegt. Falls bereits Inhalte in den Bookmarks vorhanden sind, werden diese gelöscht. Die ID des Textbausteins kann mit Hilfe des Textbaustein Editors ausgelesen werden. Jede ID ist eineindeutig und ändert sich nach dem Anlegen nicht mehr. 

Die Sprache wird über die Dokumentensprache festgelegt.
    
```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <OneOffixxConnectBatch xmlns="http://schema.oneoffixx.com/OneOffixxConnectBatch/1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    	<Entries>
    		<OneOffixxConnect>
    			<Arguments>
    				<TemplateId>6bb49520-1ebd-4f68-bb5f-02f46a9e1ec8</TemplateId>
    				<LanguageLcid>2055</LanguageLcid>
    			</Arguments>
    			<Function name="SnippetsResolver" id="dd752747-733e-4175-9fc7-028ab7472742">
    				<Arguments>
    				<Snippet id="A7835D23-E945-4A39-81B9-3CEC067E26C0" bookmark="Bookmark1" />
    				<Snippet id="B8235D23-D945-5A39-31B9-23EC067E2120" bookmark="Bookmark1" />
    				<Snippet id="43535D23-45D5-6A39-81B9-DE1C067E2112" bookmark="Bookmark2" />
    				<Snippet id="XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX" bookmark="Bookmark3" />
    				</Arguments>
    			</Function>
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
```

Mehrere Textbausteine können in einem Bookmark (z.Bsp. Bookmark1) gruppiert werden indem im Attribute Bookmark der gleiche Name steht. Die Textbausteine werden in der gleichen Reihenfolgen eingebaut wie sie im XML stehen.
Es ist ebenfalls möglich, den "\_OneOffixxOpenAt" Bookmark zu verwenden. 
Dadurch wird der Text an der Cursor-Plazierung, welche in der OneOffixx Vorlage definiert ist, eingefügt.

## Eigene Textbausteine {% include anchor.html name="external" %}

Über die Textbausteine können auch eigene, d.h. nicht in OneOffixx gespeicherte, Inhalte und Texte übergeben werden. Dies im Text oder HTML Format. In dem Fall muss __keine__ id im Snippet angegeben werden - im Element selbst muss der entsprechende Inhalt hinterlegt sein:

    <Snippet type="..." bookmark="Bookmark1">Content</Snippet>

{% include alert.html type="warning" text="<b>Hinweis ab Version 2.3.4</b><br/>Um mit Formatierung besser umzugehen, kann OneOffixx ab der <b>Version 2.3.4</b> auch Snippets im Flat OPC Format oder HTML über einen eigenen Parser in das Dokument einbauen." %}

### Eigener Snippet im Text-Format {% include anchor.html name="external-text" %}

```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <OneOffixxConnectBatch xmlns="http://schema.oneoffixx.com/OneOffixxConnectBatch/1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    	<Entries>
    		<OneOffixxConnect>
    			<Arguments>
    				<TemplateId>6bb49520-1ebd-4f68-bb5f-02f46a9e1ec8</TemplateId>
    				<LanguageLcid>2055</LanguageLcid>
    			</Arguments>
    			<Function name="SnippetsResolver" id="dd752747-733e-4175-9fc7-028ab7472742">
    				<Arguments>
    	               <Snippet bookmark="Bookmark3">
					       Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.
                           Nunc viverra imperdiet enim. Fusce est. Vivamus a tellus.
                           Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin pharetra nonummy pede. Mauris et orci.
                           Aenean nec lorem. In porttitor. Donec laoreet nonummy augue.
                           Suspendisse dui purus, scelerisque at, vulputate vitae, pretium mattis, nunc. Mauris eget neque at sem venenatis eleifend. Ut nonummy.
    				   </Snippet>
    				</Arguments>
    			</Function>
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
```

### Eigener Snippet im HTML-Format (Office Standard Styling) {% include anchor.html name="external-html-mso" %}

Bei der Übermittlung von HTML Inhalten, ist der "type" Html anzugeben. Es können generell [alle von Office zugelassenen HTML Inhalte](https://msdn.microsoft.com/en-us/library/aa338201%28v=office.12%29.aspx) übermittelt werden.

{% include alert.html type="warning" text="<b>Hinweis ab Version 2.3.4</b><br/>Ab Version 2.3.4 kann OneOffixx HTML interpretieren um so Styling-Informationen zu erhalten. Die Beispiele hier fügen das HTML in das Dokument ein und Microsoft Office wäre dafür zuständig das HTML zu interpretieren. Dabei werden aber nur bestimmte HTML-Elemente unterstützt und Stylings können zum Teil nicht angewendet werden, z.B. Styling von Listen oder Tabellen.<br/>Im nächsten Abschnitt wird erklärt wie man die neue HTML Format Variante einsetzt." %}

__Einfacher Texte:__

```xml
    <Snippet bookmark="_OneOffixxOpenAt" type="Html">
       <![CDATA[
               <p>Demo</p>
       ]]>
    </Snippet>
```

__Text in definiertem Word-Style:__

Überschriften wie H1-H4 sowie die normalen Formatierung (bspw. fett resp. \<strong\>) werden automatisch in den ensprechenden Überschriftsstyle (bspw. &lt;h1&gt; = Überschrift1) dargestellt.

```xml
          <Snippet bookmark="_OneOffixxOpenAt" type="Html">
             <![CDATA[
             	<h1>Grosser Titel</h1>
            	<strong>fetter Text</strong>
             ]]>
           </Snippet>
```

Texte können in durch die Angabe von "mso-style-name:" einem bestimmten Word-Style zugeordnet werden.

```xml
          <Snippet bookmark="_OneOffixxOpenAt" type="Html">
          	<![CDATA[
            		<p style="mso-style-name:oneoffixxStyleName">Demo</p>
          	]]>
           </Snippet>
```

__Tabelle:__

Als HTML können auch Tabellen übermittelt werden.

```xml
          <Snippet bookmark="_OneOffixxOpenAt" type="Html">
          	<![CDATA[
            		<table width="100%">
              			<tr>
                			<td>erste Spalte</td>
                			<td>zweite Spalte</td>
              			</tr>
            		</table>
          	]]>
          </Snippet>
```

__Bilder:__

Bilder können als [Data-URI](https://de.wikipedia.org/wiki/Data-URL) übermittelt werden.

```xml
          <Snippet bookmark="_OneOffixxOpenAt" type="Html">
          	<![CDATA[
            		<img src="data:image/png;base64,..."
          	]]>
          </Snippet>
```

### Eigener Snippet im HTML-Format (OneOffixx Parser) {% include anchor.html name="external-html-parser" %}

<span class="label label-info">NEU ab 2.3.4</span>

Bei der Variante wird OneOffixx das HTML direkt ins OpenXML Format konvertieren und dabei bestimmte Style-Informationen verwenden.

__Grundaufbau: {% include anchor.html name="external-html-parser-overview" %}__

Der Aufbau ist fast identisch, jedoch wurde ein zusätzlicher Parameter __"parser"__ beim Snippet hinzugefügt. Im __"parser"__ muss __"OneOffixx"__ angegeben werden.

```xml
          <Snippet bookmark="_OneOffixxOpenAt" type="Html" parser="OneOffixx">
          	<![CDATA[
            		<p>HTML Fragmente...</p>
          	]]>
          </Snippet>
```

__OneOffixx-Attribute: {% include anchor.html name="external-html-parser-attr" %}__

Um Style-Informationen oder "Rendering"-Informationen weiterzugeben, können folgende Attribute genutzt werden:

* __data-oo-style__: Der angegebene Style wird dem entsprechenden Open-XML Element zugewiesen. 
  * Styles können auf \<p\>, \<ul\> / \<ol\> oder \<table\>-Elemente angewendet werden.    
* __data-oo-align__: Definiert die Ausrichtung.
  * Mögliche Werte: left, right, center
  * Das Attribut kann auf \<p\>, \<td\> oder \<th\>-Elemente angewendet werden.   
* __data-oo-table-...__: Definierte Angaben für \<table\>-Elemente. 
* __data-oo-image-...__: Definierte Angaben für \<img\>-Elemente. 

{% include alert.html type="warning" text="<b>Wichtiger Hinweis zu Styles:</b><br/><br/>Es können nur <b>bestehende Styles</b> verwendet werden, d.h. diese müssen im Wordprocessing-Dokument vorliegen. Zudem wird die 'StyleId' genutzt, welche von dem angezeigten Name in Microsoft Word abweichen kann. (z.B. aus 'Überschrift 1' kann Office eine Style mit der Id 'berschrift1' erstellen).<br/>Falls ein Style bei einer Liste verwendet wird, wird dieser nur angewandt, wenn an diesem Style 'Auflistungs-Formatierungen' definiert sind." %}

__Hinweis zu CSS & andere Attributen: {% include anchor.html name="external-html-parser-css" %}__

CSS Angaben oder Attribute werden (bis auf die Ausnahmen "colspan" bei der Tabelle und "src" bei Bildern) __ignoriert__.

__Hinweis zu Textangaben <span class="label label-info">NEU ab 2.3.40160</span>: {% include anchor.html name="external-html-parser-text" %}__

Der Parser kann sowohl UTF8 als auch HTML encodierte (z.B. &uuml;) Texte direkt ins Open XML wandeln. 

Ausgenommen davon sind folgende Zeichen, welche zwingend in HTML encodiert werden __müssen__:

```
" als &quot;
' als &apos;
> als &gt;
< als &lt;
& als &amp;
```

__Unterstützte Elemente - Typographie: {% include anchor.html name="external-html-parser-typo" %}__

Diese Elemente werden in die entsprechenden OpenXML Elemente umgewandelt, dabei wird versucht den jeweiligen Stil einzuhalten, sodass ein \<b\> entsprechend "Fett" formatiert wird.

Elemente für OpenXML Paragraphen:

* \<p\>
* \<h1\>, \<h2\>, \<h3\>, \<h4\>, \<h5\>, \<h6\>

<span class="label label-info">NEU ab 2.3.40160</span>

* \<pre\>,\<blockquote\>,\<address\>

Elemente für OpenXML Text:

* \<span\>
* \<u\>
* \<s\>
* \<sub\>
* \<sup\>
* \<i\>
* \<em\>
* \<b\>
* \<strong\>

<span class="label label-info">NEU ab 2.3.40160</span>

* \<code\>,\<time\>,\<label\>
* \<a\> (nur der Link-Text wird übernommen)

Elemente für OpenXML Linien <span class="label label-info">NEU ab 2.3.40160</span>:

* \<hr\>
	* Optionale Attribute:
		* data-oo-hr-type="---": Erzeugt eine Linie ähnlich wie beim AutoFormat "---"
		* data-oo-hr-type="\_\_\_": Erzeugt eine Linie ähnlich wie beim AutoFormat "\_\_\_"
		* data-oo-hr-type="\#\#\#": Erzeugt eine Linie ähnlich wie beim AutoFormat "\#\#\#"
		* data-oo-hr-type="\~\~\~": Erzeugt eine Linie ähnlich wie beim AutoFormat "\~\~\~"
		* data-oo-hr-type="\*\*\*": Erzeugt eine Linie ähnlich wie beim AutoFormat "\*\*\*"
		* data-oo-hr-type="===": Erzeugt eine Linie ähnlich wie beim AutoFormat "==="
	* Ohne Attributangabe wird ein Linienelement erzeugt.

Elemente für OpenXML Zeilen, Spalten oder Seitenumbrüche <span class="label label-info">NEU ab 2.3.40160</span>:

* \<br\>
	* Optionale Attribute:
		* data-oo-br-type="textWrapping": Erzeugt einen Zeilenumbruch.
		* data-oo-br-type="page": Erzeugt einen Seitenumbruch.
		* data-oo-br-type="column": Erzeugt einen Spaltenumbruch, falls der Abschnitt mehrere Spalten enthält.
	* Ohne Attributangabe wird ein normaler Zeilenumbruch erzeugt.

Elemente in denen nach bekannten Kindelementen gesucht wird <span class="label label-info">NEU ab 2.3.40160</span>:

* \<html\>,\<body\>,\<form\>,\<div\>

Verschachtelte \<p\>- oder \<h1\>-(etc.) Elemente werden nicht unterstützt. Diese Elemente sind auch laut HTML-Spezifikation nicht dafür ausgelegt.

{% include alert.html type="warning" text="&lt;h1&gt;-&lt;h6&gt;-Elemente werden behandelt wie &lt;p&gt;-Elemente, jedoch wird automatisch <b>kein</b> Word-Style angewandt. Styles müssen <b>immer</b> explizit angegeben werden." %}

__Unterstützte Elemente - Bilder: {% include anchor.html name="external-html-parser-img" %}__

Bilder können als [Data-URL](https://de.wikipedia.org/wiki/Data-URL) übermittelt werden. 

Elemente:

* \<img\>

Unterstützte Bildformate (angegeben über den MIME-Type in der Data-URL) sind:

* image/bmp
* image/png
* image/gif
* image/jpeg
* image/tiff

OneOffixx-Attribute:

* __data-oo-image-title__: Definiert den (optionalen) Titel eines Bildes.
  * Das Attribut kann auf \<img\>-Elemente angewendet werden.
* __data-oo-image-desc__: Definiert die (optionale) Beschreibung eines Bildes.
  * Das Attribut kann auf \<img\>-Elemente angewendet werden.
* __data-oo-image-width__: Definiert die Breite des Bildes im Dokument. 
  * Das Attribut kann auf \<img\>-Elemente angewendet werden.
  * Es wird eine Zahl ohne Komma erwartet.
* __data-oo-image-height__: Definiert die Höhe des Bildes im Dokument. 
  * Das Attribut kann auf \<img\>-Elemente angewendet werden.
  * Es wird eine Zahl ohne Komma erwartet.
* __data-oo-image-sizeunit__: Definiert die Einheit. Standardmässig wird Pixel (px) gewählt.
  * Mögliche Werte: px, cm, mm 
  * Es wird eine Zahl ohne Komma erwartet.
  * Weitere Information im Abschnitt Bilder.

Bilder können im Fliesstext, als einzelner Paragraph, in Listen oder Tabellen eingesetzt werden. 

Für die Berechnung der Bildgrösse gibt es verschiedene Varianten:

* Fall __keine expliziten__ Höhen- ("data-oo-image-height") oder Breiten-("data-oo-image-width") Angaben vorhanden sind, wird die Pixel-Grösse des Bildes genutzt.
* Falls eine Höhen- __oder__ Breiten-Angabe vorhanden ist, wird das Seitenverhältnis des Ursprungsbild beibehalten und entsprechend die Grösse berechnet.  
* Falls sowohl __Höhen- und Breiten-Angabe__ vorhanden ist, wird dies als Grösse genutzt - egal welches Seitenverhältnis das Bild hat.

Optional können über die "data-oo-image-title" und "data-oo-image-desc" Beschreibungen im OpenXML hinterlegt werden. 

__Unterstützte Elemente - Tabellen: {% include anchor.html name="external-html-parser-tables" %}__

HTML Tabellen können ebenfalls umgewandelt werden, jedoch werden ohne entsprechende Style-Angabe, zu der wir später kommen, keine Tabellenränder oder ähnliches dargestellt.

Elemente:

* \<table\> 
* \<thead\> - innerhalb der \<table\>
* \<tbody\> - innerhalb der \<table\>
* \<tfoot\> - innerhalb der \<table\>
* \<tr\> - innerhalb von \<thead\>, \<tbody\> oder \<tfoot\>
* \<td\> - innerhalb von \<tr\>
* \<th\> - innerhalb von \<tr\>
* Alle Typographie-Elemente, Bilder und Input-Controls innerhalb eines \<td\>
* Listen innerhalb eines \<td\>
* Tabellen innerhalb eines \<td\>

Das "colspan"-Attribut wird für \<td\>-Elemente respektiert.

OneOffixx-Attribute:

* __data-oo-table-width__: Definiert die Breite der Tabelle in Prozent.
  * Das Attribut kann auf \<table\>-Elemente angewendet werden.    
* __data-oo-table-columns__: Definiert die Breite der jeweiligen Spalten innerhalb einer Tabelle in Prozent.
  * Das Attribut kann auf \<table\>-Elemente angewendet werden.
  * Die Werte sind kommasepariert, jeweils pro Spalte, anzugeben.
* __data-oo-table-look-\*__: Durch diese Attribute kann die Word-Tabelle genauer spezifiziert werden, z.B. ob eine Ergebniszeile sichtbar ist oder nicht. Die Eigenschaften decken sich mit den [TableLook-Properties](https://msdn.microsoft.com/en-us/library/documentformat.openxml.wordprocessing.tablelook%28v=office.14%29.aspx?f=255&MSPPError=-2147217396) vom OpenXML SDK. <span class="label label-info">NEU ab 2.3.40160</span>
* __data-oo-table-look-firstRow__: True/False - Überschrift: Besondere Formatierung für die erste Zeile anzeigen.
* __data-oo-table-look-lastRow__: True/False - Ergebniszeile: Besondere Formatierung für die letzte Zeile anzeigen.
* __data-oo-table-look-firstColumn__: True/False - Erste Spalte: Besondere Formatierung für die erste Spalte anzeigen.
* __data-oo-table-look-lastColumn__: True/False - Letzte Spalte: Besondere Formatierung für die letzte Spalte anzeigen.
* __data-oo-table-look-noHBand__: True/False - Gebänderte Zeilen: Besondere Formatierung für gerade bzw. ungerade Zeilen anzeigen.
* __data-oo-table-look-noVBand__: True/False - Gebänderte Spalten: Besondere Formatierung für gerade bzw. ungerade Spalten anzeigen.

__Unterstützte Elemente - Input-Controls <span class="label label-info">NEU ab 2.3.40160</span>: {% include anchor.html name="external-html-parser-controls" %}__

Bestimmte HTML-Input Controls können auch in das jeweilige Open XML "Custom-Control" umgewandelt werden.

Elemente:

* \<input type="checkbox" \>
	* Das "checked" Attribut wird ausgewertet
* \<input type="datetime" \>
	* Das "value" Attribut wird ausgewertet
* \<input type="text" \>
	* Das "value" Attribut wird ausgewertet
* \<textarea \>
	* Der Textinhalt wird ausgewertet	

Diese Controls können sowohl einzeln auch auch im normalen Textfluss stehen.

__Unterstützte Elemente - Listen: {% include anchor.html name="external-html-parser-lists" %}__

HTML Listen können ebenfalls umgewandelt werden, jedoch werden diese nur mit minimalen Style-Angaben versehen falls man keinen expliziten Style angibt. 

Elemente:

* \<ul\> - ohne Style-Angabe als Bullet-List dargestellt
* \<ol\> - ohne Style-Angabe als Numeric-List dargestellt
* \<li\> - innerhalb von \<ul\> oder \<ol\> 
* Alle Typographie-Elemente, Bilder und Input-Controls innerhalb eines \<li\>
* Verschachtelte Listen, wobei der 'Numbering'-Style der Haupt-Liste beibehalten wird, innerhalb eines \<li\>

Hinweis zu Word-Listen & Absatzformatvorlagen:

Listen werden im Word über zwei verschiedene Arten von "Formatvorlagen" gesteuert. 
Es gibt 'Listentypen', welche die Einrückung, Zeichen und Nummerierung steuern (z.B. die Zahlen 1. und 1.1 und 1.1.1).
Diesen Listentyp kann man eine andere Formatvorlage anhängen, welcher sich auf den eigentlichen Text neben der Nummerierungsangabe auswirkt.
Damit OneOffixx die HTML-Liste entsprechend richtig konvertieren kann, sollte folgendes Vorgehen eingehalten werden.

Pro "Haupt"-'\<ul\>' bzw. '\<ol\>' sollte __ein Listentyp__ definiert werden. Dieser Listentyp sollte mit einer Formatvorlage (z.B. 'ListText') verbunden werden.
Im Connect gibt man immer nur den Namen der eigentlichen Formatvorlage (z.B. wie oben 'ListText') an - der Listentyp ist indirekt verknüpft. Aktuell ist es erforderlich auf __jeder__ neuen '\<ul\>' bzw. '\<ol\>' Ebene den Style anzugeben. Man kann auch verschiedene Styles verwenden. Ohne Angabe nutzt Word den Standard-Absatz Style.

Zusammenfassung:
Man kann beliebig viele Styles erstellen um den __Text__ in einer Liste zu formatieren. Dies muss jeweils auf jeder Ebene angegeben werden.
Man muss einen Listentyp erstellen, welcher mit dem "primären" Style verbunden ist. Dieser Listentyp steuert die Nummerierung, Einrückungen etc.

__Beispiel: {% include anchor.html name="external-html-parser-sample" %}__

```xml
          <Snippet bookmark="_OneOffixxOpenAt" type="Html" parser="OneOffixx">
          	<![CDATA[
            		<p>HTML Fragmente...</p>
            		<p></p>
            		<ul data-oo-style="CorpList">
            			<li>Element eins</li>
            			<li>
            				<ul data-oo-style="CorpList">
            					<li>Unter Element</li>	
            				</ul>
            			</li>
            		</ul>
            		<p data-oo-style="Highlight">Text</p>
            		<p><u><em><strong>fett, kursiv and unterstrichen </strong></em></u> oder ohne</p>
            		<table data-oo-style="ListTable3Accent5" data-oo-table-width="70" data-oo-table-columns="20,80" width="100%">
            			<tr>
            				<td>erste Spalte</td>
            				<td>zweite Spalte</td>
            			</tr>
            			<tr>
            				<td>foo</td>
            				<td>bar</td>
	            		</tr>
	            		<tr>
            				<td>foo</td>
            				<td>bar</td>
	            		</tr>
			</table>
			<img data-oo-image-title="Test-Titel" data-oo-image-desc="Test-Beschreibung" data-oo-image-width="2" data-oo-image-sizeunit="px" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAIAAAACCAIAAAD91JpzAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAYdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuOWwzfk4AAAAWSURBVBhXY/gvwFD734Lhv9r//491ASz+Bve3zck6AAAAAElFTkSuQmCC" />
			<p><span>Letzer...</span></p>
          	]]>
          </Snippet>
```

### Eigener Snippet im OPC-Flat-Format {% include anchor.html name="external-flatopc" %} 

<span class="label label-info">NEU ab 2.3.4</span>

Es können auch Snippets im [Flat OPC](https://blogs.msdn.microsoft.com/ericwhite/2008/09/29/the-flat-opc-format/) Format entgegen genommen werden. 

Hierbei werden allerdings __keine Styles oder Numberings__ übernommen, nur der Body-Part.

```xml
          <Snippet bookmark="_OneOffixxOpenAt" type="OpenXml">
          	<![CDATA[
            		<?mso-application progid="Word.Document"?>
			<pkg:package xmlns:pkg="http://schemas.microsoft.com/office/2006/xmlPackage">
			...
			</pkg:package>
          	]]>
          </Snippet>
```
