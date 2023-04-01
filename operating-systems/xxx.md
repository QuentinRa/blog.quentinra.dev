# XXX

<div class="row row-cols-md-2"><div>

App

* Presentation
* Core
* Storage

Monolithic: 3 in one process.

Centralized storage: 2 in one process and a centralized storage.

Client-server: only presentation, and a centralized storage/core.

Distributed: one machine for each.

* variants: some calculations near the database
* variants: some pre-computation of the presentation near the core

Between app and storage: ODBC, JDBC, ADO, Java beans...
</div><div>
Sync/Async. Async: with a bus and its database. Each actor ask the bus, but the bus isn't the one initiating the request.

Sync on event: X send data to bus, bus store it. Y and Z subscribe to the bus for events. X trigger an event. The bus notify subscribers. If offline, the bus keep the message until subscriber notify the bus that they are back. Producer-consumer subscriber?

Messages: binaries. Fixed-size format. csv. xml. json. OAS (swagger OpenAPI).

Service Oriented Architecture. SOAP/WSDL (services), Rest (resources), OData (Open Data). micro-services.

Between companies: Point-to-point > EDI standard > API.
</div></div>

<hr class="sep-both">

## XXX

<div class="row row-cols-md-2"><div>

DBMS

* Data lake/warehouse? Depot for analysis. No update, only add. ETL tools to transfer from the database to the lake, in a format more easily manipulated. DBMSR? Cubes?
  * ACID
* Big data: VVV (NoSQL)
  * BASE

Software dev

* Understand the exigences (why do we need it...)
* Design a model/mockup
* Development
* Validate (quality control, tests..;)
* Release and upgrades
</div><div>

Order

* Waterfall
* Spiral
* Incremental
* Agile

Env

* Formation
* Prod
* Pre-prod (test with prod data)
* integration (with other software/...)
* quality control (functional)
* dev (continuous integration=>send your work=>tests=>deploy to envs=>continuous deployment)

Different kind of software (SCM, ITSS...). ERP = all in one. BI = vision on all information. MDM.

Quality criteria.
</div></div>

<hr class="sep-both">

## XXX

<div class="row row-cols-md-2"><div>

Secure software: protect the information while allowing the company to operate.

* Security must be documented
* Security varies according to the context (adapted, technology, reglementations)
* The cost must be proportional to the security control
* Security controls must be testable/proovable
* See metrics

XXX

* Who's the target? What's the data manipulated (s/c)? What's the access control rules? risks? norms? audits?
* Microsoft Security Development Lifecycle (helper)
* OWASP SAMM (helper)
* BSIMM (metric tool)
* IDaaS (OpenID), based on SAML
</div><div>

* Need to know
* Segregation of duties

ZZZ

* XACML
* Authorization creep (remove previous roles/lifecycle)
</div></div>

<hr class="sep-both">

## XXX

<div class="row row-cols-md-2"><div>

* SIEM (SIM+SEM)
* SIM=Security Information Management=collect, monitor, analyze logs
* SEM=Security Event Management=real-time analysis, alerts
* Configuration come at a cost, logs may still have to be checked manually if not correctly configured
* Data Loss Prevention (DLP): deny access to sensitive data

Endpoint Protection

* antivirus
* anti-malware
* intrusion prevention
</div><div>

CMDB

* Configuration Managment Database
* inventory software/hardware/... basically every asset?
* auto-discovery?

XXX

* DCP (how much downtime allowed?)
* Test backing servers/downtimes/... and loading backups
* 99%/... (maintenance in? we must check. sometimes, we can balance update to not have any downtimes)

IR

* Document who is responsible of what
* 3 phases: notify, restore & recuperation, monitoring
* lansweeper
</div></div>


<hr class="sep-both">

## XXX

<div class="row row-cols-md-2"><div>

* VIP (virtual IP?)
* AllSigned (and others modes|Get-ExecutionPolicy)
* Get-Service -name spooler
* Stop-Service -name spooler
* Start-Service -name spooler
* ISE
* SAML (samltool.com)
</div><div>

...
</div></div>