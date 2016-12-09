---
layout: page
title: Connect Functions
permalink: "connect/de/connect-functions/"
subtitle: "//OneOffixxConnectBatch/Entries/OneOffixxConnect/Function"
---

Über das __"Function"__-Element können Daten und Steuerinformationen den definierten Dokumentfunktionen übergeben werden.
  
Das Function-Element hat bei jeder Dokumentfunktion den gleichen Aufbau, jedoch sind die "Arguments" und "Settings" jeweils verschieden. 

Über die __"id"__ wird die aufzurufende Dokumentfunktion definiert. Der "name" ist optional, ist aber für die Lesbarkeit hilfreich.

	<Function id="x">
		<Arguments>...</Arguments>
		<Settings>...</Settings>
	</Function>
 
{% include alert.html type="warning" text="Im OneOffixx muss die aufzurufende Dokumentfunktion am jeweiligen Template auch definiert sein." %}
 
## Dokumentfunktionen 

{:.table .table-striped}
| Id  | Name | Beschreibung |                      
| --- | ---- | --- |
| 2de8db66-f3d7-456d-bba3-6bb0f12c1fb6 | [DocumentParameter]({{ site.baseurl }}/connect/de/functions/documentparameter/) | Daten im Dokument als Inhalte abbilden |
| b9e8ec94-bec0-418a-b985-c565ac3bec23 | [Recipient]({{ site.baseurl }}/connect/de/functions/recipient/) | Kontaktinformationen als Empfängeradressen hinterlegen |
| dd752747-733e-4175-9fc7-028ab7472742 | [SnippetResolver]({{ site.baseurl }}/connect/de/functions/snippets/) | Textbausteine einbauen |
| 5c8b5321-e02d-4a1c-80e3-627d40aeabaf | [ProfileData]({{ site.baseurl }}/connect/de/functions/profiledata/) | Profildaten aus Fachapplikation übernehmen |
| 6f6430fe-6c11-41de-9f29-c29fef4de861 | [CustomXmlPartsInjector]({{ site.baseurl }}/connect/de/functions/customxml/) | Fachapplikationsspezifische CustomXML Parts übernehmen |
| 70E94788-CE84-4460-9698-5663878A295B | [CustomInterfaceConnector]({{ site.baseurl }}/connect/de/functions/custominterface/) | Daten aus einer Fachapplikation übergeben |
| c364b495-7176-4ce2-9f7c-e71f302b8096 | [MetaData]({{ site.baseurl}}/connect/de/functions/metadata/) | Daten im Dokument in den Dokumenteigenschaften setzen |
