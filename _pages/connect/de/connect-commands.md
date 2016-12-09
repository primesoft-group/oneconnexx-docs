---
layout: page
title: Connect Commands
permalink: "connect/de/connect-commands/"
---

## Connect Commands 

Mithilfe der Commands innerhalb eines Connect-Entries kann das Dokument weiterverarbeitet werden. Die Commands werden ausgeführt nachdem das Dokument erzeugt wurde bzw. nachdem das Dokument geladen wurde.

Einige Commands sind nur Client-Seitig, d.h. über die OneOffixx Windows Applikation verfügbar.

Es gibt ein Sonderfall für den "Merge"-Command:
Commands kann man auf Connect-Entry Ebene nutzten oder für die gesamten Batch. Dies ist interessant, wenn man mehrere Dokumente auf einmal erzeugen möchte und diese verbinden möchte. In dem Fall kann man den "Merge" Command nehmen. Danach verhält sich das gemerged Dokument wieder wie ein einzelnes und die anderen Commands können danach aufgerufen werden. Mehr dazu unter dieser Seite: [Verbinden von Dokumenten]({{ site.baseurl }}/connect/de/usecases/merge-documents/)

Commands können im __OneOffixxConnectBatch__:

```xml
    <OneOffixxConnectBatch>
    	<Commands>
   		<Command Name="..." />
    	</Commands>
		...
    </OneOffixxConnectBatch>
```

Oder im __OneOffixxConnect__ verwendet werden:

```xml
    <OneOffixxConnect>
		<Arguments>
			...
		</Arguments>
		<Commands>
			<Command Name="..." />
		</Commands>
		...
    </OneOffixxConnect>
```

## Verfügbare Commands

{:.table .table-striped}
| Name | Beschreibung | Client | Server |                     
| ---- | --- | --- | --- |
| [DefaultProcess](#defaultprocess) | Startet den 'DefaultProcess', welcher im Windows für den Dateityp registriert ist. | ☑ | ☐ |
| [ConvertToDocument](#converttodocument) | Konvertiert Office Vorlagen (.dotx etc.) in Dokumente (.docx). |  ☑ | ☑ | 
| [ConvertToPdf](#converttopdf) | Konvertiert Vorlagen oder Dokumente (.dotx etc.) in PDF (.pdf) (ohne MS Office). |  ☐ | ☑ |
| [Print](#print) | Sendet das Dokument zum Standarddrucker. | ☑ | ☐ |
| [SaveAs](#saveas) | Speichert das Dokument am angegebenen Zielort im angegebenen Format.  | ☑ | ☑ * |
| [UpdateFieldsOnOpen](#updatefieldsonopen) | Weisst MS Office an beim Starten die Felder zu aktualisieren. |  ☑ | ☑ | 
| [Merge](#merge) | Verbindet mehreren Office Dokumente zu einem. |  ☑ | ☑ |
| [CreateConnectorResult](#createconnectorresult) | Erstellt eine OneOffixx Connector Result Datei. | ☑ | ☐ |

\* = Mit Einschränkungen

## Command Beschreibung

__DefaultProcess (Client): {% include anchor.html name="defaultprocess" %}__

Dieser Command startet den DefaultProcess, welcher im Windows für den generierten Dateityp registriert ist. Dieser Aufruf funktioniert nur über den Client.

Möglicher Parameter:

* "Start": True/False, bei False wird der Process nicht gestartet.

```xml
    <Command Name="DefaultProcess">
    	<Parameters>
    		<Add key="Start">true</Add>
    	</Parameters>
    </Command>
```

__ConvertToDocument (Server & Client): {% include anchor.html name="converttodocument" %}__

Dieses Command gilt für nur Office Dokumente (Word / Excel / PowerPoint). OneOffixx verwaltet und generiert Office Templates, d.h. .dotx-Dateien.
Um nach dem generieren des "Dokument" ein wirkliches Word-Dokument (.docx) zu bekommen wird dieser Command benötigt.

Fehlt diese Angabe und man speichert das Ergebnis als docx-Datei wird Microsoft Word eine Fehlermeldung anzeigen.


```xml
	<Command Name="ConvertToDocument" />
```

__ConvertToPdf (Server): {% include anchor.html name="converttopdf" %}__

Dieses Command gilt für nur für Word Office Dokumente. OneOffixx konvertiert das Dokument direkt in ein PDF. Dieses Command steht nur im Server zur Verfügung. Sollen PDF's im Client erzeugt werden, bitte das [SaveAs](#saveas) Command verwenden. Dadurch wird die officeeigene PDF Engine verwendet.

```xml
	<Command Name="ConvertToPdf" />
```

__Print (Client):  {% include anchor.html name="print" %}__

Das Dokument wird an den Standard-Drucker gesendet.

```xml
	<Command Name="Print" />
```

__SaveAs (Client & Server*):  {% include anchor.html name="saveas" %}__

Speichert das Dokument am angegebenen Zielort. Der neue Dateispeicherort wird für alle folgenden Commands berücksichtigt (z.B. im DefaultProcess)

Möglicher Parameter:

* "Filename": Absoluter Pfad mit Dateiendung
* "Overwrite": True/False, gibt an, ob eine bestehende Datei überschrieben werden soll
* "CreateFolder": True/False, gibt an, ob Ordner, die im Filename angegeben sind erstellt werden sollen
* "AllowUpdateDocumentPart": True/False, bei "True" wird der OneOffixx Document Part als "SavedDocument" anstatt "NewDocument" markiert

Nur Client-Seitig verfügbar:

* "Type": Wenn hier "PDF" angegeben wird, wird das Dokument über Microsoft Word als PDF gespeichert.

```xml
	<Command Name="SaveAs">
		<Parameters>
			<Add key="Filename">\\MyServer\share\organization\...\documentxyz.dotx</Add>
			<Add key="Overwrite">true</Add>
			<Add key="CreateFolder">true</Add>
			
			<Add key="Type">PDF</Add>  <!-- nur Client-Seitig verügbar. -->
			<Add key="AllowUpdateDocumentPart">false</Add>
		</Parameters>
	</Command>
```
__UpdateFieldsOnOpen (Client & Server): {% include anchor.html name="updatefieldsonopen" %}__

Dieses Command gilt für nur Office Dokumente (Word / Excel / PowerPoint). 

Speichert im Dokument die Information, dass Office die Felder, wie z.B. Inhaltsverzeichnisse oder Verknüpfungen, aktualisieren soll.

```xml
	<Command Name="UpdateFieldsOnOpen" />
```

__Merge (Client & Server - ConnectBatch): {% include anchor.html name="merge" %}__

Dieses Command gilt für nur Office Word Dokumente.

Damit man mehrere Dokumente verbinden kann und diese wie eins nutzen kann, gibt es den "Merge" Command. Dieser macht nur Sinn auf Connect-Batch Ebene.

Mögliche Parameter:

* "PageNumberStart": Gibt an, bei welcher Seite das neu generierte Dokument startet.

```xml
	<Command Name="Merge">
		<Parameters>
			<Add key="PageNumberStart">10</Add>
		</Parameters>
	</Command>
```

Das Ergebnis eines Merge ist immer ein Word Dokument (.docx).

__CreateConnectorResult (Client): {% include anchor.html name="createconnectorresult" %}__

Der Command gibt gezielt nach dem Durchlauf der Dokumentgenerierung und Command-Pipeline ein OneOffixx Connector Result File im selben Ordner aus, wie das Connect File.

Das Format der Datei ist dasselbe wie in den [Global Settings]({{ site.baseurl }}/connect/de/xml-schema/#oneoffixx-connect-batch-settings) angegeben. 

```xml
	<Command Name="CreateConnectorResult" />
```
