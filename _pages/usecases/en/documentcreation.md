---
layout: page
title: Anwendungsbeispiele
permalink: "usecases/en/documentcreation/"
language: en
---

## Document service 

In the document creation service area, OneConnexx offers some interesting functions.

![x]({{ site.baseurl }}/assets/content-images/usecases/de/documentationservice.png "Dokumentendienst")



1. Any application / system transmits the "Create document" event to OneConnexx with information such as template number and language.
2. An add-in in OneConnexx has subscribed to this event and creates a corresponding document via the OneOffixx interface. Note: Document templates are managed in OneOffixx. The content of the documents can be static and / or dynamic. The dynamic data is transferred from the calling application / system when it is called.
3. Possible additions:
  * If desired, the address can be supplemented with a WebStamp or PP via the Swiss Post web service.
  * If desired, a unique identifier can be printed, on the one hand, to control a packaging machine and, on the other hand, to recognize and classify the returns that are recorded in the scanner (5.).
4. The created document can be
  * saved as Word or PDF
  * printed out on paper or sent as an attachment in an e-mail
5. Answers are scanned and identified by the unique matrix and classified in the system
