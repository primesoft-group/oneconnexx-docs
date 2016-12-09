---
layout: page
title: XML Schema
permalink: "connect/de/xml-schema/"
---

## Überblick {% include anchor.html name="overview" %}

Ein __"OneOffixxConnectBatch"__ umfasst eins oder mehrere __"OneOffixxConnect"__ "Entries". 

Das __"OneOffixxConnectBatch"__ Element kann __"Settings"__ und __"Commands"__ enthalten, welche sich global auf alle "Entries" auswirken bzw. gesonderte Funktionalitäten (wie z.B. das Zusammenfassen von Dokumenten) ermöglichen.

Das __"OneOffixxConnect"__ beschreibt konkret einen Dokumentgenerierungs- bzw. Dokumentänderungsaufruf. Template-Auswahldaten, also welches Template oder welche Sprache, werden über die __"Arguments"__ gesetzt. 
Dokument-Daten können über die verschiedenen Dokumentfunktionen übergeben werden. Die Dokumentfunktionen werden hierbei über die "id" des __"Function"__ Elements identifiziert.

    <OneOffixxConnectBatch>
		<Settings />
		<Commands />
		<Entries>
			<OneOffixxConnect>
				<Arguments />
				<Function id="x" />
				<Function id="y" />
				...
			</OneOffixxConnect>
		</Entries>
    </OneOffixxConnectBatch>

## Namespace {% include anchor.html name="namespace" %}

Der Namespace für OneOffixx Connect lautet 

    http://schema.oneoffixx.com/OneOffixxConnectBatch/1

Wobei die hinterste Nummer der Major-Version entspricht. Die Minor Version steht in Global Settings (Key="Version" Value ="XXX")


## OneOffixx Connect Batch {% include anchor.html name="oneoffixx-connect-batch" %}

![x]({{ site.baseurl }}/assets/content-images/connect/de/schema.png "Schema")

Enthält eine Batch Liste mit OneOffixx Connect Strukturen. Ein OneOffixx Connect entspricht einem OneOffixx Dokument.

## Global Settings {% include anchor.html name="oneoffixx-connect-batch-settings" %}

    //OneOffixxConnectBatch/Settings

Diese Struktur enthält eine Key/Value Liste mit Globalen Settings. Diese Settings werden während der Verarbeitung in die OneOffixx Connect Struktur kopiert.

![x]({{ site.baseurl }}/assets/content-images/connect/de/schema-globalsettings.png "Global Settings")

OneOffixx kennt die folgenden Settings:

```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <OneOffixxConnectBatch xmlns="http://schema.oneoffixx.com/OneOffixxConnectBatch/1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <Settings>
        <Add key="KeepConnector">true</Add>
        <Add key="CreateConnectorResult">false</Add>
        <Add key="CreateConnectorResultOnError">true</Add>
      </Settings>
      <Entries>
      …
      </Entries>
    </OneOffixxConnectBatch>
```

Diese Settings haben die gleiche Funktion wie die [entsprechenden Kommandozeilenparameter]({{ site.baseurl }}/connect/de/usage/#aufruf). Falls angegeben überschreiben sie die Kommandozeilenparameter.

__Hinweis:__ Nur bei der Angabe einer TemplateId wird ein Result-File __nach__ der Generierung erstellt. Wenn das Result_File auch bei Tag angaben gesichert erstellt werden soll, gäbe es die Möglichkeit über den "CreateConnectorResult"-Command zu gehen.

## Global Commands {% include anchor.html name="oneoffixx-connect-batch-commands" %}

    //OneOffixxConnectBatch/Commands

Diese Struktur enthält Kommandos, welche die ganze Dokumentliste betreffen. (Bsp Merge Document). 

![x]({{ site.baseurl }}/assets/content-images/connect/de/schema-globalcommands.png "Global Commands")

## Entries {% include anchor.html name="oneoffixx-connect-batch-entries" %}

    //OneOffixxConnectBatch/Entries

Entries entspricht einer Liste mit Dokumenten bzw. Connect aufrufen.

![x]({{ site.baseurl }}/assets/content-images/connect/de/schema-entries.png "Connect Entries")

## OneOffixx Connect {% include anchor.html name="oneoffixx-connect-batch-connect" %}

    //OneOffixxConnectBatch/Entries/OneOffixxConnect

Die OneOffixxConnect Struktur entspricht einem Dokument. Jedes Dokument kann mit Argumenten, Kommandos und Dokumentfunktionen ausgestattet werden. 

![x]({{ site.baseurl }}/assets/content-images/connect/de/schema-connect.png "Connect")

Dokummentenfunktionen ("Function" im XML) reichen das Dokument mit Daten an und sind optional. Jede Funktion wird über ihre eindeutige ID identifiziert.
 
Über "Commands" kann man das generierte Dokument weiterverarbeiten und so z.B. an einem bestimmten Speicherort ablegen.

## Validierung {% include anchor.html name="validate" %}

Um eine OneOffixx Connect zu validieren resp. zu prüfen, kann dies via Prozessaufruf mit dem Parameter /ValidateConnector erzielt werden.
Beispielaufruf:

    c:\\program…\OneOffixx.exe /KeepConnector /ValidateConnector /connect XYZDatei.xml

Es ist zu beachten, dass hierbei das Connect-File nicht verarbeitet, sondern geprüft wird. Im produktiven Betrieb, empfielt sich eine ständige Validierung aus Performancegründen nicht.

## XSD {% include anchor.html name="xsd" %}

Nachfolgend das vollständige XSD, welches auch bei der Validierung genutzt wird:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" version="1.1">
  <xs:annotation>
    <xs:appinfo>OneOffixxConnect</xs:appinfo>
    <xs:documentation xml:lang="DE">
      Schema for OneOffixxConnect
      Copyright Sevitec Informatik AG - Alle Rechte vorbehalten.
    </xs:documentation>
  </xs:annotation>
  <!--
  ##########################
  ### Connect Batch Root ###
  ##########################
  -->
  <xs:element name="OneOffixxConnectBatch" type="OneOffixxConnectBatch"/>
  <xs:complexType name="OneOffixxConnectBatch">
    <xs:sequence>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:element name="Settings" type="ConnectGeneralSettings" minOccurs="0" maxOccurs="1"/>
        <xs:element name="Commands" type="ConnectCommands" minOccurs="0" maxOccurs="1"/>
        <xs:element name="Entries" type="ConnectEntries" minOccurs="0" maxOccurs="unbounded"/>
      </xs:choice>
    </xs:sequence>
  </xs:complexType>
  <!--
  ##############################
  ### Connect Batch Settings ###
  ##############################
  -->
  <xs:complexType name="ConnectGeneralSettings">
    <xs:sequence>
      <xs:element name="Add" type="ConnectGeneralSetting" minOccurs="1" maxOccurs="unbounded"/>
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="ConnectGeneralSetting">
    <xs:simpleContent>
      <xs:extension base="xs:boolean">
        <xs:attribute name="key" use="required" type="ConnectGenralSettingsList"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
  <xs:simpleType name="ConnectGenralSettingsList">
    <xs:annotation>
      <xs:documentation></xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:string">
      <xs:enumeration value="KeepConnector"/>
      <xs:enumeration value="CreateConnectorResult"/>
      <xs:enumeration value="CreateConnectorResultOnError"/>
    </xs:restriction>
  </xs:simpleType>
  <!--
  ##############################
  ### Connect Batch Commands ###
  ##############################
  -->
  <xs:complexType name="ConnectCommands">
    <xs:sequence>
      <xs:element name="Command" type="ConnectCommand" minOccurs="0" maxOccurs="unbounded"/>
    </xs:sequence>
  </xs:complexType>
  <xs:simpleType name="CommandNames">
    <xs:annotation>
      <xs:documentation></xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:string">
      <xs:enumeration value="DefaultProcess"/>
      <xs:enumeration value="ConvertToDocument"/>
      <xs:enumeration value="ConvertToPdf"/>
      <xs:enumeration value="UpdateFieldsOnOpen"/>
      <xs:enumeration value="CreateConnectorResult"/>
      <xs:enumeration value="SaveAs"/>
      <xs:enumeration value="Merge"/>
      <xs:enumeration value="Print"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:complexType name="ConnectCommand">
    <xs:sequence>
      <xs:element name="Parameters" type="ConnectCommandParameters" minOccurs="0" maxOccurs="unbounded"/>
    </xs:sequence>
    <xs:attribute name="Name" use="required" type="CommandNames"/>
  </xs:complexType>
  <xs:complexType name="ConnectCommandParameters">
    <xs:sequence>
      <xs:element name="Add" type="ConnectCommandParameter" minOccurs="0" maxOccurs="unbounded"/>
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="ConnectCommandParameter">
    <xs:simpleContent>
      <xs:extension base="xs:string">
        <xs:attribute name="key" type="CommandList" use="required"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
  <xs:simpleType name="CommandList">
    <xs:union memberTypes="CommandsDefaultProcess CommandsMerge CommandsPrint CommandsSaveAs"/>
  </xs:simpleType>
  <xs:simpleType name="CommandsDefaultProcess">
    <xs:annotation>
      <xs:documentation>Erlaubte Kommandos für Standardprozess Ablauf</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:string">
      <xs:enumeration value="Start"/>
      <xs:enumeration value="Verb"/>
      <xs:enumeration value="ForceWindowOnTop"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="CommandsMerge">
    <xs:annotation>
      <xs:documentation>Erlaubte Kommandos für Merge</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:string">
      <xs:enumeration value="PageNumberStart"/>
      <xs:enumeration value="Filename"/>
      <xs:enumeration value="InputFile"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="CommandsPrint">
    <xs:annotation>
      <xs:documentation>Erlaubte Kommandos für Print</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:string">
      <xs:enumeration value="Printer"/>
      <xs:enumeration value="Try"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="CommandsSaveAs">
    <xs:annotation>
      <xs:documentation>Erlaubte Kommandos für SaveAs</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:string">
      <xs:enumeration value="Filename"/>
      <xs:enumeration value="Overwrite"/>
      <xs:enumeration value="CreateFolder"/>
      <xs:enumeration value="Type"/>
      <xs:enumeration value="AllowUpdateDocumentPart"/>
    </xs:restriction>
  </xs:simpleType>
  <!--
  #############################
  ### Content Root Elemente ###
  #############################
  -->
  <xs:complexType name="ConnectEntries">
    <xs:sequence>
      <xs:element name="OneOffixxConnect" type="OneOffixxConnectContentRoot" minOccurs="0" maxOccurs="unbounded"/>
    </xs:sequence>
  </xs:complexType>
  <xs:element name="OneOffixxConnect" type="OneOffixxConnectContentRoot"/>
  <xs:complexType name="OneOffixxConnectContentRoot">
    <xs:sequence>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:element name="Arguments" type="OneOffixxConnectGlobalArguments" minOccurs="1" maxOccurs="1"/>
        <xs:element name="Commands" type="ConnectCommands" minOccurs="0" maxOccurs="1"/>
        <xs:element name="Function" type="DocumentFunctions" minOccurs="0" maxOccurs="unbounded"/>
      </xs:choice>
    </xs:sequence>
  </xs:complexType>
  <!--
  ###################################
  ### Allgemeine Connect Elemente ###
  ###################################
  -->
  <xs:complexType name="OneOffixxConnectGlobalArguments">
    <xs:all>
      <xs:element ref="FilterOrTemplateIdOrDocumentLocation"  minOccurs="1" maxOccurs="1"/>
      <xs:element name="LanguageLcid" type="Lcid" minOccurs="0" maxOccurs="1"/>
      <xs:element name="ProfileId" type="xs:string" minOccurs="0" maxOccurs="1"/>
      <xs:element name="Profile" type="Profile"  minOccurs="0" maxOccurs="1"/>
      <xs:element name="Organization" type="xs:string" minOccurs="0" maxOccurs="1"/>
      <xs:element name="ForceWindowOnTop" type="xs:boolean" minOccurs="0" maxOccurs="1"/>
    </xs:all>
  </xs:complexType>
  <xs:element name="FilterOrTemplateIdOrDocumentLocation" abstract="true" />
  <xs:element name="TemplateId" type="Guid" substitutionGroup="FilterOrTemplateIdOrDocumentLocation"/>
  <xs:element name="TemplateFilter" type="TemplateFilter" substitutionGroup="FilterOrTemplateIdOrDocumentLocation">
    <xs:annotation>
      <xs:documentation>Erlabut das Filtern von Templates nach Tags.</xs:documentation>
    </xs:annotation>
  </xs:element>
  <xs:complexType name="TemplateFilter" >
    <xs:sequence>
      <xs:element name="Tag" type="xs:string" minOccurs="0"  maxOccurs="unbounded" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="Profile" >
    <xs:sequence>
      <xs:element name="OrganizationId" type="xs:string" minOccurs="0"  maxOccurs="1" />
    </xs:sequence>
  </xs:complexType>
  <xs:element name="DocumentLocation" type="xs:anyURI" substitutionGroup="FilterOrTemplateIdOrDocumentLocation"/>
  <xs:complexType name="Settings">
    <xs:sequence>
      <xs:element name="Value" minOccurs="0" maxOccurs="unbounded">
        <xs:complexType>
          <xs:simpleContent>
            <xs:extension base="DocumentFunctionSettingValues">
              <xs:attribute name="key" type="DocumentFunctionSettingKeys" use="required"/>
            </xs:extension>
          </xs:simpleContent>
        </xs:complexType>
      </xs:element>
    </xs:sequence>
  </xs:complexType>
  <!--
  ##########################
  ### Dokumentfunktionen ###
  ##########################
  -->
  <xs:complexType name="DocumentFunctions">
    <xs:all>
      <xs:element name="Settings" type="Settings" minOccurs="0" maxOccurs="1"/>
      <xs:element name="Arguments" type="Arguments" minOccurs="0" maxOccurs="1"/>
    </xs:all>
    <xs:attribute name="name" use="required" type="DocumentFunctionNames"/>
    <xs:attribute name="id" use="required" type="DocumentFunctionIDs"/>
  </xs:complexType>
  <xs:complexType name="Arguments">
    <xs:sequence>
      <xs:choice>
        <xs:element name="Value" type="DocumentFunctionValueArguments" minOccurs="0" maxOccurs="unbounded"/>
        <xs:element name="ContactList" type="DocumentFunctionContactListArguments" minOccurs="0" maxOccurs="1"/>
        <xs:element name="Snippet" type="DocumentFunctionSnippetArguments" minOccurs="0" maxOccurs="unbounded"/>
        <xs:element name="Part" type="DocumentFunctionPartsInjectorArguments" minOccurs="0" maxOccurs="unbounded"/>
        <xs:element name="Interface" type="DocumentFunctionInterfaceConnectorInterfaceArguments" minOccurs="0" maxOccurs="unbounded"/>
        <xs:element name="CustomInterfaces" type="AnyXMLData" minOccurs="0" maxOccurs="1"/>
      </xs:choice>
    </xs:sequence>
  </xs:complexType>
  <xs:simpleType name="DocumentFunctionNames">
    <xs:annotation>
      <xs:documentation>Dokumentfunktionsbezeichnung</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:string">
      <xs:enumeration value="DocumentParameter"/>
      <xs:enumeration value="Recipient"/>
      <xs:enumeration value="ProfileData"/>
      <xs:enumeration value="Save"/>
      <xs:enumeration value="Metadata"/>
      <xs:enumeration value="SnippetsResolver"/>
      <xs:enumeration value="CustomXmlPartsInjector"/>
      <xs:enumeration value="CustomInterfaceConnector"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="DocumentFunctionIDs">
    <xs:annotation>
      <xs:documentation>Dokumentfunktions-IDs</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:string">
      <!-- Dokumentparameter -->
      <xs:enumeration value="2de8db66-f3d7-456d-bba3-6bb0f12c1fb6"/>
      <!-- Empfänger -->
      <xs:enumeration value="b9e8ec94-bec0-418a-b985-c565ac3bec23"/>
      <!-- Profildaten -->
      <xs:enumeration value="5C8B5321-E02D-4A1C-80E3-627D40AEABAF"/>
      <!-- Speichern / Save -->
      <xs:enumeration value="187593ed-59af-4642-af9f-2f7fa56915bb"/>
      <!-- Metadaten -->
      <xs:enumeration value="c364b495-7176-4ce2-9f7c-e71f302b8096"/>
      <!-- Bausteine / SnippetsResolver -->
      <xs:enumeration value="dd752747-733e-4175-9fc7-028ab7472742"/>
      <!-- Strukturdatenübermittlung (PartsInjector) -->
      <xs:enumeration value="6f6430fe-6c11-41de-9f29-c29fef4de861"/>
      <!-- Fachapplikationsspezifische Parameter (CustomInterfaceConnector) -->
      <xs:enumeration value="70E94788-CE84-4460-9698-5663878A295B"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="DocumentFunctionSettingKeys">
    <xs:union memberTypes="DFSettingKeysDocumentParameter DFSettingKeysRecipient DFSettingKeysSave"/>
  </xs:simpleType>
  <xs:simpleType name="DocumentFunctionSettingValues">
    <xs:union memberTypes="DFSettingValuesDocumentParameter DFSettingValuesRecipient DFSettingValuesSave"/>
  </xs:simpleType>
  <!--
  ####################################
  ### Dokumentfunktionen Arguments ###
  ####################################
  -->
  <!-- Dokumentparameter, Profildaten, Metadaten und Save-->
  <xs:complexType name="DocumentFunctionValueArguments" mixed="true">
    <xs:annotation>
      <xs:documentation>Values für Dokumentparameter, Profildaten, Metadaten und Save</xs:documentation>
    </xs:annotation>
    <xs:sequence>
      <xs:element name="Line" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
    </xs:sequence>
    <xs:attribute name="key" type="Key" use="required"/>
    <!-- MetadataDatytyps für DF Metadaten -->
    <xs:attribute name="type" type="MetadataDatatyps" use="optional"/>
  </xs:complexType>
  <xs:simpleType name="MetadataDatatyps">
    <xs:annotation>
      <xs:documentation>Datentypen für Metadaten</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:string">
      <xs:enumeration value="string"/>
      <xs:enumeration value="bool"/>
      <xs:enumeration value="int"/>
      <xs:enumeration value="datetime"/>
    </xs:restriction>
  </xs:simpleType>
  <!-- Bausteine / Snippet Resolver -->
  <xs:complexType name="DocumentFunctionSnippetArguments" mixed="true">
    <xs:sequence>
      <xs:any processContents="skip" minOccurs="0" maxOccurs="unbounded"/>
    </xs:sequence>
    <xs:attribute name="id" type="Guid" use="optional"/>
    <xs:attribute name="bookmark" type="xs:NMTOKEN" use="required"/>
    <xs:attribute name="type" type="SnippetTypeListe" use="optional"/>
    <xs:attribute name="parser" type="SnippetParserListe" use="optional"/>
  </xs:complexType>
  <xs:simpleType name="SnippetTypeListe">
    <xs:annotation>
      <xs:documentation>Datentypen für Bausteine</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:string">
      <xs:enumeration value="Html"/>
      <xs:enumeration value="RichText"/>
      <xs:enumeration value="Text"/>
      <xs:enumeration value="Mhtml"/>
      <xs:enumeration value="Image"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="SnippetParserListe">
    <xs:annotation>
      <xs:documentation>Parser-Types for Snippets</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:string">
      <xs:enumeration value="OneOffixx"/>
    </xs:restriction>
  </xs:simpleType>
  <!-- Custom Interfaces -->
  <xs:complexType name="DocumentFunctionInterfaceConnectorInterfaceArguments">
    <xs:sequence>
      <xs:element name="Node" type="CustomInterfaceConnectorNodeType" minOccurs="0" maxOccurs="unbounded"/>
    </xs:sequence>
    <xs:attribute name="Name" type="Key" use="required"/>
  </xs:complexType>
  <xs:complexType name="CustomInterfaceConnectorNodeType">
    <xs:simpleContent>
      <xs:extension base="xs:string">
        <xs:attribute name="Id" use="required" type="Key"/>
        <xs:attribute name="Value" use="optional" type="xs:string"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
  <!-- Part Injector -->
  <xs:complexType name="DocumentFunctionPartsInjectorArguments">
    <xs:sequence>
      <xs:any processContents="skip" minOccurs="0" maxOccurs="unbounded"/>
    </xs:sequence>
  </xs:complexType>
  <!-- Empfänger -->
  <xs:complexType name="DocumentFunctionContactListArguments">
    <xs:sequence>
      <xs:element name="ContactItem" type="ContactItemType" minOccurs="1" maxOccurs="unbounded"/>
      <xs:element name="GlobalViewOptions" type="GlobalViewContactListOptionsType" minOccurs="0" maxOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="ContactItemType">
    <xs:all>
      <xs:element name="AddressType" type="AddressingType" minOccurs="0" maxOccurs="1"/>
      <xs:element name="Company" type="CompanyType" minOccurs="0" maxOccurs="1"/>
      <xs:element name="Person" type="PersonType" minOccurs="0" maxOccurs="1"/>
      <!-- AdressProviderData kann mehrfach vorkommen - Deklaration maxOccurs="unbounded" in xs:all ist jedoch nicht möglich -->
      <xs:element name="AddressProviderData" type="AddressProviderDataType" minOccurs="0"/>
      <xs:element name="Transmission" type="TransmissionType" minOccurs="0" maxOccurs="1"/>
      <xs:element name="ExtendentFields" type="ExtendentFieldsType" minOccurs="0" maxOccurs="1"/>
      <xs:element name="ContactViewOptions" type="ContactViewOptionsType" minOccurs="0" maxOccurs="1"/>
    </xs:all>
    <xs:attribute name="Selected" type="xs:boolean" use="optional"/>
    <xs:attribute name="id" type="Key" use="optional"/>
  </xs:complexType>
  <xs:simpleType name="AddressingType">
    <xs:restriction base="xs:string">
      <xs:enumeration value="CompanyData"/>
      <xs:enumeration value="PersonData"/>
      <xs:enumeration value="CompanyAndPersonData"/>
    </xs:restriction>
  </xs:simpleType>
  <!-- Company Data -->
  <xs:complexType name="CompanyType">
    <xs:sequence>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:element name="CompanyName" type="CompanyNameType" minOccurs="1" maxOccurs="1"/>
        <xs:element name="Supplement" type="xs:string" minOccurs="0" maxOccurs="1"/>
        <xs:element name="Department" type="xs:string" minOccurs="0" maxOccurs="1"/>
        <xs:element name="Address" type="AddressType" minOccurs="0" maxOccurs="1"/>
        <xs:element name="Communication" type="CommunicationType" minOccurs="0" maxOccurs="unbounded"/>
        <xs:element name="Picture" type="xs:string" minOccurs="0" maxOccurs="1"/>
      </xs:choice>
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="CompanyNameType" mixed="true">
    <xs:sequence>
      <xs:element name="Line" type="xs:string" minOccurs="0" maxOccurs="2"/>
    </xs:sequence>
  </xs:complexType>
  <!-- Person Data -->
  <xs:complexType name="PersonType">
    <xs:sequence>
      <!-- choice wird benötigt damit in beliebiger Reihenfolge möglich -->
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:element name="Title" type="xs:string" minOccurs="0" maxOccurs="1"/>
        <xs:element name="LastName" type="xs:string" minOccurs="0" maxOccurs="1"/>
        <xs:element name="FirstName" type="xs:string" minOccurs="0" maxOccurs="1"/>
        <xs:element name="SecondName" type="xs:string" minOccurs="0" maxOccurs="1"/>
        <xs:element name="NickName" type="xs:string" minOccurs="0" maxOccurs="1"/>
        <xs:element name="Initials" type="xs:string" minOccurs="0" maxOccurs="1"/>
        <xs:element name="BirthDate" type="Date" minOccurs="0" maxOccurs="1"/>
        <xs:element name="Profession" type="xs:string" minOccurs="0" maxOccurs="1"/>
        <xs:element name="Position" type="xs:string" minOccurs="0" maxOccurs="1"/>
        <xs:element name="SalutationShort" type="xs:string" minOccurs="0" maxOccurs="1"/>
        <xs:element name="Salutation" type="xs:string" minOccurs="0" maxOccurs="1"/>
        <xs:element name="Greeting" type="xs:string" minOccurs="0" maxOccurs="1"/>
        <xs:element name="Address" type="AddressType" minOccurs="0" maxOccurs="1"/>
        <xs:element name="Communication" type="CommunicationType" minOccurs="0" maxOccurs="unbounded"/>
        <xs:element name="Picture" type="xs:string" minOccurs="0" maxOccurs="1"/>
      </xs:choice>
    </xs:sequence>
  </xs:complexType>
  <!-- Adressprovider Data -->
  <xs:complexType name="AddressProviderDataType">
    <xs:all>
      <xs:element name="ProviderName" type="xs:string" minOccurs="0" maxOccurs="1"/>
      <xs:element name="Updated" type="Date" minOccurs="0" maxOccurs="1"/>
      <xs:element name="Published" type="Date" minOccurs="0" maxOccurs="1"/>
      <xs:element name="Label" type="LabelType" minOccurs="0" maxOccurs="1"/>
      <xs:element name="ProviderResponse" type="AnyTextOrXMLData" minOccurs="0" maxOccurs="1"/>
      <xs:element name="Links" type="LinksType" minOccurs="0" maxOccurs="1"/>
    </xs:all>
    <xs:attribute name="Id" use="optional" type="xs:string"/>
  </xs:complexType>
  <xs:complexType name="LabelType">
    <xs:simpleContent>
      <xs:extension base="xs:string">
        <xs:attribute name="Type" use="optional" type="LabelTypeList"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
  <xs:simpleType name="LabelTypeList">
    <xs:restriction base="xs:string">
      <xs:enumeration value="text"/>
      <xs:enumeration value="html"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:complexType name="LinksType">
    <xs:sequence>
      <xs:element name="Link" type="LinkType" minOccurs="0" maxOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="LinkType">
    <xs:simpleContent>
      <xs:extension base="xs:string">
        <xs:attribute name="Type" use="optional" type="LinkTypeList"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
  <xs:simpleType name="LinkTypeList">
    <xs:restriction base="xs:string">
      <xs:enumeration value="WebPage"/>
      <xs:enumeration value="VCard"/>
    </xs:restriction>
  </xs:simpleType>
  <!-- Informationen zur Übermittlung -->
  <xs:complexType name="TransmissionType">
    <xs:all>
      <xs:element name="DocumentLanguage" type="xs:string" minOccurs="0" maxOccurs="1"/>
      <xs:element name="TypeOfDistribution" type="xs:string" minOccurs="0" maxOccurs="1"/>
      <xs:element name="IsDefault" type="xs:boolean" minOccurs="0" maxOccurs="1"/>
    </xs:all>
    <xs:attribute name="Text" use="optional" type="xs:string"/>
  </xs:complexType>
  <!-- Extendent Fields -->
  <xs:complexType name="ExtendentFieldsType">
    <xs:sequence>
      <xs:element name="Item" type="ItemType" minOccurs="0" maxOccurs="unbounded" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="ItemType">
    <xs:simpleContent>
      <xs:extension base="xs:string">
        <xs:attribute name="Key" use="required" type="Key"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
  <!-- Contact View Options -->
  <xs:complexType name="ContactViewOptionsType">
    <xs:attribute name="SelectedAddress" use="optional" type="SelectedAddressList"/>
    <xs:attribute name="AddressingType" use="optional" type="AddressingTypeList"/>
    <xs:attribute name="ShowProviderLayout" use="optional" type="xs:boolean"/>
    <xs:attribute name="PersonOverFirm" use="optional" type="xs:boolean"/>
    <xs:attribute name="CountryView" use="optional" type="xs:boolean"/>
    <xs:attribute name="CountryCodeView" use="optional" type="xs:boolean"/>
    <xs:attribute name="SalutationView" use="optional" type="xs:boolean"/>
    <xs:attribute name="SalutationSeparatetLine" use="optional" type="xs:boolean"/>
    <xs:attribute name="SecondNameView" use="optional" type="xs:boolean"/>
    <xs:attribute name="PositionView" use="optional" type="xs:boolean"/>
    <xs:attribute name="InterneAddress" use="optional" type="xs:boolean"/>
  </xs:complexType>
  <xs:complexType name="GlobalViewContactListOptionsType">
    <xs:all>
      <xs:element name="ValueList" type="AnyXMLData" minOccurs="0" maxOccurs="1"/>
      <xs:element name="Locality" type="AnyXMLData" minOccurs="0" maxOccurs="1"/>
    </xs:all>
    <xs:attribute name="OutputFilter" use="optional" type="ContactsOutputFilterList"/>
    <xs:attribute name="MergeAddressList" use="optional" type="xs:boolean"/>
  </xs:complexType>
  <xs:simpleType name="ContactsOutputFilterList">
    <xs:restriction base="xs:string">
      <xs:enumeration value="first"/>
      <xs:enumeration value="selected"/>
      <xs:enumeration value="an"/>
      <xs:enumeration value="cc"/>
      <xs:enumeration value="bcc"/>
      <xs:enumeration value="all"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="SelectedAddressList">
    <xs:restriction base="xs:string">
      <xs:enumeration value="Business"/>
      <xs:enumeration value="Private"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="AddressingTypeList">
    <xs:restriction base="xs:string">
      <xs:enumeration value="An"/>
      <xs:enumeration value="Cc"/>
      <xs:enumeration value="Bcc"/>
    </xs:restriction>
  </xs:simpleType>
  <!-- Address Data -->
  <xs:complexType name="AddressType">
    <xs:all>
      <xs:element name="Street" type="xs:string" minOccurs="0" maxOccurs="1"/>
      <xs:element name="CareOf" type="xs:string" minOccurs="0" maxOccurs="1"/>
      <xs:element name="Apartment" type="xs:string" minOccurs="0" maxOccurs="1"/>
      <xs:element name="Floor" type="xs:string" minOccurs="0" maxOccurs="1"/>
      <xs:element name="City" type="CityType" minOccurs="0" maxOccurs="1"/>
      <xs:element name="PostOfficeBox" type="xs:string" minOccurs="0" maxOccurs="1"/>
      <xs:element name="PostOfficeBoxCity" type="CityType" minOccurs="0" maxOccurs="1"/>
      <xs:element name="Country" type="CountryType" minOccurs="0" maxOccurs="1"/>
    </xs:all>
  </xs:complexType>
  <xs:complexType name="CityType">
    <xs:simpleContent>
      <xs:extension base="xs:string">
        <xs:attribute name="ZipCode" type="ZipCode"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
  <xs:complexType name="CountryType">
    <xs:simpleContent>
      <xs:extension base="xs:string">
        <xs:attribute name="ShortCode" use="required" type="CountryShortCode"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
  <!-- Communication Data -->
  <xs:complexType name="CommunicationType" mixed="true">
    <xs:attribute name="Type" use="required" type="CommunicationTypeList"/>
    <xs:attribute name="Prefered" use="optional" type="xs:boolean"/>
  </xs:complexType>
  <xs:simpleType name="CommunicationTypeList">
    <xs:restriction base="xs:string">
      <xs:enumeration value="Language"/>
      <xs:enumeration value="Email_direct"/>
      <xs:enumeration value="Email_central"/>
      <xs:enumeration value="Phone_direct"/>
      <xs:enumeration value="Phone_central"/>
      <xs:enumeration value="Fax_direct"/>
      <xs:enumeration value="Fax_central"/>
      <xs:enumeration value="Mobile"/>
      <xs:enumeration value="Homepage"/>
    </xs:restriction>
  </xs:simpleType>
  <!--
  ###################################
  ### Dokumentfunktionen Settings ###
  ###################################
  -->
  <!-- Dokumentparameter -->
  <xs:simpleType name="DFSettingKeysDocumentParameter">
    <xs:annotation>
      <xs:documentation>Zugelassene Settings Keys für Dokumentparameter</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:string">
      <xs:enumeration value="ShowDialog"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="DFSettingValuesDocumentParameter">
    <xs:annotation>
      <xs:documentation>Zugelassene Settings Values für Dokumentfunktionen</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:string">
      <xs:enumeration value="true"/>
      <xs:enumeration value="false"/>
    </xs:restriction>
  </xs:simpleType>
  <!-- Empfänger -->
  <xs:simpleType name="DFSettingKeysRecipient">
    <xs:annotation>
      <xs:documentation>Zugelassene Settings Keys für Empfänger</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:string">
      <xs:enumeration value="ShowDialog"/>
      <xs:enumeration value="OutlookContactSaveEnabled"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="DFSettingValuesRecipient">
    <xs:annotation>
      <xs:documentation>Zugelassene Settings Values für Dokumentfunktionen</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:string">
      <xs:enumeration value="true"/>
      <xs:enumeration value="false"/>
    </xs:restriction>
  </xs:simpleType>
  <!-- Speichern -->
  <xs:simpleType name="DFSettingKeysSave">
    <xs:annotation>
      <xs:documentation>Zugelassene Settings Keys für Speicherfunktion</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:string">
      <xs:enumeration value="FilepathBehavior"/>
      <xs:enumeration value="FilenameBehavior"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="DFSettingValuesSave">
    <xs:annotation>
      <xs:documentation>Zugelassene Settings Values für Dokumentfunktionen</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:string">
      <xs:enumeration value="default"/>
      <xs:enumeration value="static"/>
    </xs:restriction>
  </xs:simpleType>
  <!--
  ##############################
  ### spezifische Datentypen ###
  ##############################
  -->
  <xs:simpleType name="Guid">
    <xs:annotation>
      <xs:documentation>Validierung GUID bsp. af3c8c18-ccca-4e7b-85ed-1da6afe0b742</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:string">
      <xs:pattern value="([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})|(\{[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}\})" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="Lcid">
    <xs:annotation>
      <xs:documentation>Validierung Lcid bsp. 2055</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:unsignedInt">
      <xs:minInclusive value="1" />
      <xs:maxInclusive value="99999" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="ZipCode">
    <xs:annotation>
      <xs:documentation>Validierung der Postleitzahl</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:string">
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="CountryShortCode">
    <xs:annotation>
      <xs:documentation>Validierung des Länderkürzels bspw. CH</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:NMTOKEN">
      <xs:whiteSpace value="collapse"/>
      <xs:pattern value="([A-X]{2})" />
      <xs:minLength value="2"/>
      <xs:maxLength value="2"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="Key">
    <xs:annotation>
      <xs:documentation>Validierung Key ohne Leerzeichen und min. einem Zeichen</xs:documentation>
    </xs:annotation>
    <xs:restriction base="xs:NMTOKEN">
      <xs:whiteSpace value="collapse"/>
      <xs:minLength value="1"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="Date">
    <xs:annotation>
      <xs:documentation>Validierung korrektes Datumsformat</xs:documentation>
    </xs:annotation>
    <xs:union memberTypes="xs:dateTime xs:date empty-string"/>
  </xs:simpleType>
  <xs:simpleType name="empty-string">
    <xs:restriction base="xs:string">
      <xs:enumeration value=""/>
    </xs:restriction>
  </xs:simpleType>
  <!-- undefinierte Inhalte -->
  <xs:complexType name="AnyTextOrXMLData" mixed="true">
    <xs:sequence>
      <xs:any processContents="skip" minOccurs="0" maxOccurs="unbounded"/>
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="AnyXMLData">
    <xs:sequence>
      <xs:any processContents="skip" minOccurs="0" maxOccurs="unbounded"/>
    </xs:sequence>
  </xs:complexType>
</xs:schema>
```
