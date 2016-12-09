---
layout: page
title: "Functions: ProfileData"
subtitle: Profildaten aus Fachapplikation übernehmen
permalink: "connect/de/functions/profiledata/"
---

Wie bereits unter ["Connect Arguments: ProfileId"]({{ site.baseurl }}/connect/de/connect-arguments#profileid) vermerkt, nutzt OneOffixx ohne Angabe das aktuelle Profil. Das Profil kann dabei über die Profil-ID bzw. den Profilnamen explizit genannt werden.

Bei allen Varianten kann man über diese Dokumentfunktionen Profil-Felder übersteuern. Dabei werden Felder mit dem selektierten Profile gemerged. Bilder können Base64 kodiert ebenfalls übergeben werden.

__Aktuelles Profil, mit überschriebenen Feldern:__ 

Ohne Angabe eines expliziten Profiles wird das aktuelle Profiles vom OneOffixx Client genommen. Dazu können noch einzelne Profil-Felder überschrieben werden.

```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <OneOffixxConnectBatch xmlns="http://schema.oneoffixx.com/OneOffixxConnectBatch/1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    	<Entries>
    		<OneOffixxConnect>
    			<Arguments>
    				<TemplateId>6bb49520-1ebd-4f68-bb5f-02f46a9e1ec8</TemplateId>
    				<LanguageLcid>2055</LanguageLcid>
    			</Arguments>
    		    <Function name="ProfileData" id="5C8B5321-E02D-4A1C-80E3-627D40AEABAF">
    				<Arguments>
    					<Value key="Profile.User.FirstName">Max</Value>
    					<Value key="Profile.User.LastName">Musterman</Value>
    				</Arguments>
    		    </Function>
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
```

__Profilwahl über Profil-ID:__

Ein Profil kann auch über die ID ausgewählt werden, dies ist mit oder ohne überschriebenen Feldern möglich.

```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <OneOffixxConnectBatch xmlns="http://schema.oneoffixx.com/OneOffixxConnectBatch/1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    	<Entries>
    		<OneOffixxConnect>
    			<Arguments>
    				<TemplateId>6bb49520-1ebd-4f68-bb5f-02f46a9e1ec8</TemplateId>
    				<ProfileId>25558547-a6fb-4fad-908b-63118dcee5c9</ProfileId>
    				<LanguageLcid>2055</LanguageLcid>
    			</Arguments>			
    		    <Function name="ProfileData" id="5C8B5321-E02D-4A1C-80E3-627D40AEABAF">
    				<Arguments>
    					<Value key="Profile.User.FirstName">Max</Value>
    					<Value key="Profile.User.LastName">Musterman</Value>
    				</Arguments>
    		    </Function>
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
```

__Profilwahl über Name:__

Ein Profil kann auch über dessen Name ausgewählt werden, dies ist mit oder ohne überschriebenen Feldern möglich. 

```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <OneOffixxConnectBatch xmlns="http://schema.oneoffixx.com/OneOffixxConnectBatch/1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    	<Entries>
    		<OneOffixxConnect>
    			<Arguments>
    				<TemplateId>6bb49520-1ebd-4f68-bb5f-02f46a9e1ec8</TemplateId>
    				<ProfileId>Profile Name</ProfileId>
    				<LanguageLcid>2055</LanguageLcid>
    			</Arguments>			
    		    <Function name="ProfileData" id="5C8B5321-E02D-4A1C-80E3-627D40AEABAF">
    				<Arguments>
    					<Value key="Profile.User.FirstName">Max</Value>
    					<Value key="Profile.User.LastName">Musterman</Value>
    				</Arguments>
    		    </Function>
    		</OneOffixxConnect>
    	</Entries>
    </OneOffixxConnectBatch>
```

Hinweis zu den Signern (Unterschreibenden):
Bei allen Profilen steht nur die Signer zur Verfügung die dem Profil auch angehängt sind. Bei einem anonymen Profil werden 10 leere Signer automatisch erzeugt.
