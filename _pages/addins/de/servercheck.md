---
layout: page
title: ServerCheck
permalink: "addins/de/servercheck/"
---


Das ServerCheck AddIn überprüft die Erreichbarkeit von Servern. Es pingt alle konfigurierten Server an und versendet das Ergebnis in einem E-Mail.

## Merkmale

{:.table .table-striped}
| --- | --- |
| AddIn Type | Logic / Event &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Schnittstellen |  |
| Transaktionen | 1 pro nicht erreichtem Server |
| Ereignisse | &lt;Instanz&gt;.Done (Parameter = OneMessage)|


## Parameter

{:.table .table-striped}
| --- | --- |
| servers | Kommaseprarierte Liste der zu überwachenden Server. Akzeptiert werden Servernamen oder IP der Server |
| subject | Betreff der E-Mail, welche nach der Überprüfung versendet wird. (Hinweis: Empfänger werden im Mail AddIn definiert) |
| endpoint | Name des Endpunktes der in der Transaktion verwendet wird (Optional, Default = "") |


## Anwendungsbeispiele

Mit dem ServerCheck AddIn werden kritische Server sowohl innerhalb der Firma als auch extern, täglich (oder stündlich/minütlich) überprüft.<br />Der Ausfall eines Servers wird schnell erkannt und die nötigen Schritte eingeleitet.

