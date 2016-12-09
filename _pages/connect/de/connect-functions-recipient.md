---
layout: page
title: "Function: Recipient"
subtitle: Kontaktinformationen als Empfängeradressen hinterlegen
permalink: "connect/de/functions/recipient/"
---
Dem Addressprovider können ein oder mehrere Empfängerdaten übergeben werden. Das Schema für ContactList bzw. ContactItem ist nicht Bestandteil dieser Spezifikation.

```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <OneOffixxConnectBatch xmlns="http://schema.oneoffixx.com/OneOffixxConnectBatch/1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    	<Entries>
    		<OneOffixxConnect>
    			<Arguments>
    				<TemplateId>6bb49520-1ebd-4f68-bb5f-02f46a9e1ec8</TemplateId>
    				<LanguageLcid>2055</LanguageLcid>
    			</Arguments>
    	        <Function name="Recipient" id="b9e8ec94-bec0-418a-b985-c565ac3bec23">
    	        	<Settings>
    	        		<Value key="ShowDialog">false</Value>
    	        	</Settings>
    	        	<!-- Die Übergabe der eigentlichen Werte finden innerhalb des Tags Arguments statt -->
    	        	<Arguments>
    	        		<!-- Liste aller Empfänger -->
    	        		<ContactList>
    	        			<!-- Einzelner Empfänger -->
    	        			<ContactItem Selected="true" id="123456789">
    	        				<!--	Adressart resp. Inhalt der Adresse
    	        				CompanyData => reine Firmenadresse (juristische Person) ohne Ansprechpartner (geschäftlicher Kontakt)
    	        				PersonData => reine Personenadresse (natürliche Person) ohne Firmenangaben (privater Kontakt)
    	        				CompanyAndPersonData => Firmenadresse inkl. Ansprechpartner (private und geschäftliche Daten vorhanden)  -->
    	        				<AddressType>CompanyAndPersonData</AddressType>
    	        				<!-- Geschäftsdaten -->
    	        				<Company>
    	        					<CompanyName>
    	        						<Line>Sevitec AG</Line>
    	        					</CompanyName>
    	        					<Supplement>Software-Lösungen nach Mass</Supplement>
    	        					<Department>Abteilung</Department>
    	        					<Address>
    	        						<Street>Bahnhofstrasse 4</Street>
    	        						<CareOf>c/o</CareOf>
    	        						<Apartment>Apartment</Apartment>
    	        						<Floor>Floor</Floor>
    	        						<City ZipCode="8360">Eschlikon TG</City>
    	        						<PostOfficeBox>PostOfficeBox</PostOfficeBox>
    	        						<PostOfficeBoxCity/>
    	        						<Country ShortCode="CH">Schweiz</Country>
    	        					</Address>
    	        					<!-- geschäftliche Kommunikationsdaten -->
    	        					<Communication Type="Language" Prefered="false">Deutsch</Communication>
    	        					<Communication Type="Mobile" Prefered="false">0041715110511</Communication>
    	        					<Communication Type="Email_direct" Prefered="false">info@oneoffixx.com</Communication>
    	        					<Communication Type="Email_central" Prefered="false"/>
    	        					<Communication Type="Phone_direct" Prefered="false">0041715110511</Communication>
    	        					<Communication Type="Phone_central" Prefered="false">0041715110511</Communication>
    	        					<Communication Type="Fax_central" Prefered="false">0041715110512</Communication>
    	        					<Communication Type="Homepage" Prefered="false">www.oneoffixx.ch</Communication>
    	        				</Company>
    	        				<!-- Persönliche Daten -->
    	        				<Person>
    	        					<Title>Titel</Title>
    	        					<LastName>Müller</LastName>
    	        					<FirstName>Max</FirstName>
    	        					<SecondName>Zweitname</SecondName>
    	        					<NickName>Spitzname</NickName>
    	        					<BirthDate>1995-12-10</BirthDate>
    	        					<Profession>Beruf</Profession>
    	        					<Position>Position</Position>
    	        					<Initials>MM</Initials>
    	        					<SalutationShort>Herr</SalutationShort>
    	        					<Salutation>Sehr geehrter Herr</Salutation>
    	        					<Greeting>Freundliche Grüsse</Greeting>
    	        					<Address>
    	        						<Street>Bahnhofstrasse 4</Street>
    	        						<CareOf>c/o</CareOf>
    	        						<Apartment>Apartment</Apartment>
    	        						<Floor>Floor</Floor>
    	        						<City ZipCode="8360">Eschlikon TG</City>
    	        						<PostOfficeBox>PostOfficeBox</PostOfficeBox>
    	        						<PostOfficeBoxCity/>
    	        						<Country ShortCode="CH">Schweiz</Country>
    	        					</Address>
    	        					<!-- private Kommunikationsdaten -->
    	        					<Communication Type="Language" Prefered="false">Deutsch</Communication>
    	        					<Communication Type="Email_direct" Prefered="false">m.mueller@gmail.com</Communication>
    	        					<Communication Type="Phone_direct" Prefered="false">0041712449005</Communication>
    	        				</Person>
    	        				<!-- Informationen des Adresslieferanten -->
    	        				<AddressProviderData Id="urn:uuid:b4f420fda52419f2">
    	        					<ProviderName>tel.search.ch</ProviderName>
    	        					<Label Type="text">Müller, Max/nBeispielstrasse 1a/n8360 Eschlikon/TG/n*071 511 05 12</Label>
    	        					<Links>
    	        						<Link Type="WebPage">tel.search.ch</Link>
    	        					</Links>
    	        				</AddressProviderData>
    	        				<!-- Informationen zur Übermittlung -->
    	        				<Transmission Text="Eingeschrieben">
    	        					<DocumentLanguage>Deutsch</DocumentLanguage>
    	        					<TypeOfDistribution>Eingeschrieben</TypeOfDistribution>
    	        				</Transmission>
						<ExtendentFields>
							<Item Key="Dynamic.Test">Feld für interne Daten</Item>
						</ExtendentFields>
						
    	        				<!-- Einstellungen zur Darstellung der Adresseierung
                                     SelectedAddress  	=> Steuerung ob die geschäftliche oder private Adressierung verwendet wird (erlaubte Werte:"Business"|"Private")
                                     AddressingType		=> Steuerung ob der Empfänger das Dokument direkt oder als Kopie erhält (erlaubte Werte:"An"|"Cc"|"Bcc")
                                     ShowProviderLayout	=> Steuerung ob das Layout der Adressierung von OneOffixx erstellt wird oder ob jenes des Adresslieferanten verwendet wird (erlaubte Werte:"true"|"false")
                                     PersonOverFirm		=> Steuerung ob der Name des Ansprechpartners oberhalb der Firmenbezeichnung in der Adressierung angezeigt wird - für eine persönliche / vertrauliche Adressierung (erlaubte Werte:"true"|"false")
                                     CountryView		=> Steuerung ob das Land in der Adressierung angezeigt wird (erlaubte Werte:"true"|"false")
                                     CountryCodeView	=> Steuerung ob das Länderkurzzeichen in der Adressierung angezeigt wird (erlaubte Werte:"true"|"false")
                                     SalutationView		=> Steuerung ob die Anrede in der Adressierung angezeigt wird (erlaubte Werte:"true"|"false")
                                     SalutationSeparatetLine => Steuerung ob die Anrede auf einer separaten Zeile angezeigt wird (erlaubte Werte:"true"|"false")
                                     SecondNameView	=> Steuerung ob der Zweitname angezeigt wird (erlaubte Werte:"true"|"false")
                                     PositionView		=> Steuerung ob die Position resp. Funktion der Person angezeigt wird (erlaubte Werte:"true"|"false") 
									 -->
    	        			<ContactViewOptions  SelectedAddress="Business" AddressingType="An" ShowProviderLayout="false" PersonOverFirm="true" CountryView="true" CountryCodeView="true" SalutationView="true" SalutationSeparatetLine="false" SecondNameView="false" PositionView="true"/>
    	        			</ContactItem>
    	        		</ContactList>
    	        	</Arguments>
    	        </Function>
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
```
