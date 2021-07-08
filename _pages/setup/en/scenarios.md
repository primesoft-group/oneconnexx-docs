---
layout: page
title: Installation scenarios
permalink: "setup/en/scenarios/"
language: en
---

### Minimal installation without database
A minimal installation consists of the OneConnexx Windows service and the Internet Information Server with the web application for administration.

![x]({{ site.baseurl }}/assets/content-images/setup/de/scenario1.png "Szenario 1")


### Standard installation with an existing database server
The standard installation is an extension of the minimal installation by a database, which is installed on an existing database server. 
The standard installation with the distribution on two servers guarantees the best performance.

![x]({{ site.baseurl }}/assets/content-images/setup/de/scenario2.png "Szenario 2")

### Everything new on a server installation
If no database server is available and statistical data is still required, a Microsoft SQL Server database can also be installed on the OneConnexx server. 
However, this variant can lead to a loss of performance in high-performance transactions and complex evaluations.

![x]({{ site.baseurl }}/assets/content-images/setup/de/scenario3.png "Szenario 3")
