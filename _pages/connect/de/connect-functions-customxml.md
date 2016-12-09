---
layout: page
title: "Function: CustomXmlPartsInjector"
subtitle: Fachapplikationsspezifische CustomXML Parts übernehmen
permalink: "connect/de/functions/customxml/"
---

Die Fachapplikation übergibt via Schnittstelle einen spezifischen CustomXML Part. OneOffixx baut diesen CustomXML ohne Prüfung in das Worddokument ein.
Dadurch ist es bspw. möglich, generische Tabellen oder Listen zu übermitteln.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<OneOffixxConnectBatch xmlns="http://schema.oneoffixx.com/OneOffixxConnectBatch/1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Entries>
		<OneOffixxConnect>
			<Arguments>
				<TemplateId>6bb49520-1ebd-4f68-bb5f-02f46a9e1ec8</TemplateId>
				<LanguageLcid>2055</LanguageLcid>
			</Arguments>

			<Function name="CustomXmlPartsInjector" id="6f6430fe-6c11-41de-9f29-c29fef4de861">
				<Arguments>
					<Part>
						<HelloWorld>TestTest</HelloWorld>
					</Part>
					<Part>
						<CATALOG>
							<CD>
								<TITLE>Empire Burlesque</TITLE>
								<ARTIST>Bob Dylan</ARTIST>
								<COUNTRY>USA</COUNTRY>
								<COMPANY>Columbia</COMPANY>
								<PRICE>10.90</PRICE>
								<YEAR>1985</YEAR>
							</CD>
							<CD>
								<TITLE>Hide your heart</TITLE>
								<ARTIST>Bonnie Tyler</ARTIST>
								<COUNTRY>UK</COUNTRY>
								<COMPANY>CBS Records</COMPANY>
								<PRICE>9.90</PRICE>
								<YEAR>1988</YEAR>
							</CD>
						</CATALOG>
					</Part>
				</Arguments>
			</Function>
		</OneOffixxConnect>
	</Entries>
</OneOffixxConnectBatch>
```
