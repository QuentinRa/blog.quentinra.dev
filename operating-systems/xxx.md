# XXX

<div class="row row-cols-md-2"><div>

* 2^10 = 1024 = Ko (kilo) = kibi
* 2^20 = 1 048 576 = Mo (méga) = mebi
* (new norm because confusing)
</div><div>

Dates

* Value relative to a date
* `x.6875` in excel = 16h30, `x,500`=12h...

No data

* NULL (4+NULL = NULL)
* NaN = 1/0
</div></div>

<hr class="sep-both">

## XXX

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

Quality/Debit=freq to select UDP/TCP.

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

## AD

<div class="row row-cols-md-2"><div>

* replication
* GIA
* delegate the administrator perms to another account (+disable it)
* icon when disabled
* do not name your server after its function
* do not name workstation after its unit
* no .local, use intranet
* Azure AD (SAML, OAuth, OpenID connect, WS-federation) vs On-premise (local network)
* [a](https://www.varonis.com/fr/blog/meilleures-pratiques-de-nommage-de-domaines-active-directory?hsLang=fr)
* [b](https://social.technet.microsoft.com/wiki/contents/articles/34981.active-directory-best-practices-for-internal-domain-and-network-names.aspx)
* linux active directory
* OpenLDAP/FreeIPA for full-linux
* hard to guess username (like not firstname.lastname, not random)
* security principals = SID = Secure identifier. Store in the SAM if not connected to the domain? = sysprep
* Distribution groups (mailing lists?)
* Groups: domain, global, universal
* DFS/DFSR (drivemaps? redunduncy, "serveur de relève?", load balancing?, new alternatives)
* the least services on the root domain (IIS, WSUS...)
* priority: the parent rule them all, unless with allow override (??? no sure)
* `gpupdate /force`
* gpedit (local)

WSUS

* Windows Workstation
* 3rd party
* GPO
* centalized (download once, and deploy, bandwidth--)
* constraints before deploying because it takes resources, priorities like exposed to the outside or not...

XXX

* Redhat sattelite/capsules?
* Ansible or AWX

Federation?

* OpenID
* SAML
* OAuth
</div><div>

XXX

* Identify and Access manamgent (IAM/GIA)
* Lifecycle

Clouds

* IIS - automatically mounted with WSUS? - not on the DC
  * Only install required modules
* "reduce attack surface"
* AWS, AZURE, Google
* SaaS, IaaS, DaaS, FaaS, PaaS, STaaS...
* Notes about how to select a cloud solution
* Cloud FW/SASE

Network

* E/W = between two apps
* N/S = with the internet
* Firewall => NGFW AMP Duo Email ISE Umbrella Enpoint Web Workload Services

Zero Trust

* a concept
* segmentation, firewall...
* principles: no blind trust, least privilege, always check
* don't burden users / security vs productivity "sweet spot"

XXX

* threatmap
* backups
* updates
* prevent access to dangerous websites
* training and culture/"cyber hygiène"
* EDR/SOC
* ShadowServer

Migrate

* cost/value (performance=cost, security, cloud, traffic)
* formation
* incompatibility
* WDS: deploy images
* hyper-v
* bitlocker
* bios/uefi (secure boot, rootkit, bootkit)
* device guard
* applocker
* Hiren's bootcd
</div></div>