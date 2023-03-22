# XXX

<div class="row row-cols-md-2"><div>

CPU

* Registers
* Cache
* Control unit (core functions, assembly functions)
* Calcul unit (ALU)

Bus to share data (3 chanel: send instructions, address, information)

Memory

* RAW (volatile)
  * DRAM => SDRAM, EDO DRAM, BEDO DRAM, DDR SDRAM
  * Static (SRAM)
  * Cache
* ROW (not volatile)
  * ROM => PROM, EPROM, EEPROM
  * Flash (USB...)

Memory leaks: missing free... Overflow
=> program add the return address to the stack, then the parameters. The procedure, read all, generate and put the result. Then the program read the result, and unstack the return address. With overflow, a parameter overflow and replace the return address.

Controllers I/O

* USB
* Network
* Video
* Storage
* Keyboard/mouse
</div><div>

Registers

* MAR
* MDR
* CIR
* AC0
* AC1

Operating system

* kernel (system services: pilotes...)
* user services
* an application can't access another one in memory? but we can create a zone in which two can access? Swap: store on the disk.
</div></div>

<hr class="sep-both">

## XXX

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

Between presentation and app: Sockets, RPC, TCP/UDP, HTML/SHTML...
</div><div>

Point to Point. N systems directly linked to n others. If we change one, we need to change xxx connections too.

Bus: everyone only interact with a bus. Only two connections to handle.

Sync/Async. Async: with a bus and its database. Each actor ask the bus, but the bus isn't the one initiating the request.

Sync on event: X send data to bus, bus store it. Y and Z subscribe to the bus for events. X trigger an event. The bus notify subscribers. If offline, the bus keep the message until subscriber notify the bus that they are back. Producer-consumer subscriber?

Messages: binaries. Fixed-size format. csv. xml. json. OAS (swagger OpenAPI).

Service Oriented Architecture. SOAP/WSDL (services), Rest (resources), OData (Open Data). micro-services.

Between companies: Point-to-point > EDI standard > API.
</div></div>

<hr class="sep-both">

## W

<div class="row row-cols-md-2"><div>

OSI

* session: between apps
* transport: between computers
* 1024 to 49151: reserved
* dynamic ports
</div><div>

...
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

Languages

* machine
* assembly
* procedural and object (non machine dependant)
* declarative (describe the result)

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

* Passive attacks (monitor)
* Active attacks
* CIS (cyber-defense, hardening kits - build kit content)
  * two levels

SSL certificates (SSL deprecated, TLS more secure, SSL/TLS)

* Authentication
* Encryption
* SSLLabs
* Expired/Renew/Monitoring
* CA = assert of the identify of someone (CSR)
* Web/Let's encrypt? (DV)
* Validation levels
  * EV (extended)
  * OV (organization)
  * DV (domain)
* Unique domain (all), wildcard (DV/OV), multi-domains (DV, OV, EV)
</div><div>

...
</div></div>

<hr class="sep-both">

## XXX

<div class="row row-cols-md-2"><div>

* Between two companies
* Between an employee and the company
* ...
* Layer 3 - IPsec VPN
* Remote-Site VPN
* Site-à-Site VPN (client with no knowledge, connect to a VPN device)
</div><div>

* `nmap *.*.*.*`
* `nmap *.*.*.* --exclude x.x.x.x`
* `nmap -sA x.x.x.x` (filtered/unfiltered)
* `nmap -p T:443` (TCP/443)
* `nmap -p U:53` (UDP/53)
* `nmap --log-errors`

XXX

* ARP, no auth, poisoning
* DHCP, hacker answer before DHCP server
* DNS poisoning
* Cain and abel
* Ettercap
* pfsense > snort package
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

...
</div></div>