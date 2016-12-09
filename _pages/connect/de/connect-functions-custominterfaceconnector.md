---
layout: page
title: "Function: CustomInterfaceConnector"
subtitle: Daten aus einer Fachapplikation übergeben
permalink: "connect/de/functions/custominterface/"
---

Wird OneOffixx aus einer Fachapplikationen heraus aufgerufen können fachapplikationsspezifische Daten an OneOffixx übergeben werden.

Element- und Attributnamen sind frei wählbar bzw. können von Fachapplikation definiert und angepasst werden. 

Pro Schnittstelle muss __ein eindeutiger Schnittstellename__ definiert werden. Dadurch ist OneOffixx in der Lage die Daten intern zu transformieren und für die Dokumentgenerierung aufzubereiten.

```xml
<Interface Name="SchnittstelleXY" />
```
Standard-Format-Aufruf:

```xml
 <Function name="CustomInterfaceConnector" id="70E94788-CE84-4460-9698-5663878A295B">
    <Arguments>
      <Interface Name="SchnittstelleXY">
         <Node Id="KeyA">ValueA</Node>
         <Node Id="KeyB">ValueB</Node>
         <Node Id="KeyC">ValueC</Node>
      </Interface>
    </Arguments>
  </Function>
```

Beispiel-Aufruf, wobei eine Transformation konfiguriert werden muss:

```xml
  <Function name="CustomInterfaceConnector" id="70E94788-CE84-4460-9698-5663878A295B">
    <Arguments>
      <Interface Name="SchnittstelleXY">
        <Allgemein>
          <Telefon_a>#Telefon_a#</Telefon_a>
          <Telefon_b>#Telefon_b#</Telefon_b>
          <Homepage>#Homepage#</Homepage>
          <akadTitel>#akadTitel#</akadTitel>
          <TelefonSekretariat>#TelefonSekretariat#</TelefonSekretariat>
          <ObjKeyOrgProfile>#ObjKeyOrgProfile#</ObjKeyOrgProfile>
        </Allgemein>
        <Auftrag>
          <EntscheidDatum>#EntscheidDatum#</EntscheidDatum>
          <VersandDatum>#VersandDatum#</VersandDatum>
          <SBEntscheid>#SBEntscheid#</SBEntscheid>
          <VerfuegungTitel>#VerfuegungTitel#</VerfuegungTitel>
          <verrechnungstabelle>
            <vteintrag>
              <vtperiode>@01.01.1900-01.01.2016</vtperiode>
              <vtanspruch>@11'600.00</vtanspruch>
              <vtzurueckbezahlt>@1'234.00</vtzurueckbezahlt>
              <vtoffen>@5'000.00</vtoffen>
            </vteintrag>
            <vteintrag>
              <vtperiode>@01.01.1901-01.01.2016</vtperiode>
              <vtanspruch>@11'600.01</vtanspruch>
              <vtzurueckbezahlt>@1'234.01</vtzurueckbezahlt>
              <vtoffen>@5'000.01</vtoffen>
            </vteintrag>
          </verrechnungstabelle>
          <VTtotalText>#VTtotalText#</VTtotalText>
          <VTTotal>#VTTotal#</VTTotal>
        </Auftrag>
      </Interface>
    </Arguments>
  </Function>
```
