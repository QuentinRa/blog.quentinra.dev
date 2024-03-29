# Data governance

<div class="row row-cols-lg-2"><div>

Data governance is usually involved in the early stages of security architecture, focusing on the data.

Data governance starts by considering data as a critical asset of the company. It's a new way of thinking/doing.

* 🥡 Define how data is accessed/shared
* 🗃️ Define how data is stored
* 💰 Define how data is used/processed
* 🐸 Define how data is managed <small>(quality, retained, deleted...)</small>
* ...

And, define how 🔑 data is protected at every step.
</div><div>

We need to identify the **needs**, **requirements**, and the **risks** related to the data, as defined in [Risk management](/cybersecurity/blue-team/topics/risk.md), to reduce risks under an acceptable level. Some risks related to data are:

* 💰 Fines due to non-compliance with legal requirements <small>(GDPR...)</small>
* 🔥 Reputation loss <small>(data breaches usually cause distrust)</small>
* 💥 Invasion of privacy <small>(leak of data that harm clients)</small>
* 🔫 Industrial espionage <small>(a company access our private/confidential data)</small>
* 🍃 Lack of quality <small>(duplicates, loss of time/efficiency, errors...)</small>
* ...

Data is needed by the company, so we can't "lock it" 🔐. This is a challenge of data governance: **Protect to enable** <small>(Malcolm W. Harkins)</small>.
</div></div>

<hr class="sep-both">

## Data governance program

<div class="row row-cols-lg-2"><div class="align-self-center">

While the goal of the [Security Program](/cybersecurity/blue-team/architecture/architecture.md#security-program) is to ensure that the organization IT architecture is safe, including data, the goal of the data governance program is to ensure the **efficient usage, management, and protection of data to drive business value** 🚀.

➡️ Some categories of controls: access, privacy, quality, security...
</div><div>

👉 According to the [DAMA framework](/cybersecurity/blue-team/architecture/frameworks/dama.md), we start by identifying the regulations, then we define policies, then standards/directives and guides, then we evaluate the risks and setup procedures.

👉 According to ISO 27001, we first define the scope of the program, the assets, their critical level, their value (impact/loss). Then, we identify the threats, and set up controls and monitoring.

👉 See also the DMBOK framework <small>(Data Management Body of Knowledge)</small> which, unlike the high-level DAMA, is a framework detailing each area of data management.
</div></div>

<hr class="sep-both">

## Inventory data assets

<div class="row row-cols-lg-2"><div>

The first step is to inventory data assets, and find problems or elements needing improvement, along with their causes.

* 🔑 Identify access control and management of accesses
* 💰 Identify how data is used, identify patterns...
* 🔐 Identify who is responsible, who are the stakeholders
* 🍃 Identify data flows, lifecycle, and environment
* 🔥 Identify a lack of quality <small>(does it fit its purpose?)</small>

➡️ You can ask representatives from each business unit.

#### Data life-cycle

It's important to understand or define how data is created, used, stored, archived, and deleted over time, to implement good controls.

1. **Planning** 🗺️: use laws, directives, requirement, risks to determine what information is needed and for which purpose.
2. **Design and Implementation** ⚖️: Define standards, policies, use cases, responsibilities, tests, audits... defining how and where the data will be structured, stored...
3. **Creation/Acquisition** 🪓: collecting, importing, validating data...
4. **Storage and Maintenance** 🗃️: store data in a maintainable, secure, and accessible location. Do, test, and secure backups...
5. **Usage** 💸: in operations, in decision-making...
6. **Enhancement** 💰: add/update/refine data... to make it more relevant to the business needs.

➡️ At some point, data will be destroyed, most likely before storage.

</div><div>

#### Identify environments

For environments, data <small>(both virtual and physical)</small> can be found in:

* **Storage** <small>(databases, cloud, mobiles, devices, archives...)</small> 📦: encryption, backup, access control, physical measures...
* **Transit** ✈️: encryption & secure protocols (TLS), VPN, MPLS...
* **Utilization** 💰: encryption, access control, monitoring...

#### Data valuation

Data valuation means giving a value to a data. This value is used to prioritize and classify data, and apply the appropriate controls.

* 💵 How much did it cost to acquire this data?
* ☠️ How much will it cost if we damaged/lost this data?
* 🔥 What's the impact if this data isn't available?
* 💰 How important is it for business operations/decision-making?
* 💎 What's the revenue generated using this data?
* 🛡️ What's the cost to protect this data? <small>(regulations, fines...)</small>
* 🥷 How much would the competitors pay for this data?
* ⏳ Is this data new? Old? <small>(newer data are more valuable)</small>
* ...

👉 The DIKW model <small>(Data, Information, Knowledge, Wisdom)</small> is a pyramid-shaped model that represent how "data" is transformed to "wisdom". The goal is to show understand how raw data can be transformed in useful information that drive business value 💵.

Example: Raw data <small>(ex: 1984)</small> is transformed to information by adding a context <small>(ex: Los Angeles summer olympics)</small>. By interpreting the information, it becomes knowledge <small>(ex: it occurs every 4 years)</small>. And trough reflexion, it become wisdom <small>(ex: the next one will be in 2024)</small>.
</div></div>

<hr class="sep-both">

## Structuring the program I

<div class="row row-cols-lg-2"><div>

The second step is to define and structure the governance program.

* 👑 Define the roles and responsibilities of those involved

* 🛣️ Define a data governance framework **tailored for the organization** with guidelines for management, security, privacy, quality, compliance, improvements...

<br>

#### Monitoring and improvements

The program must be continuously monitored and improved.

➡️ See the "Plan - Correct - Monitor - React" (PCMR) framework

<br>

#### Data security

See the [ISO 27002](/cybersecurity/blue-team/architecture/frameworks/iso-27002.md) standard.
</div><div>

#### Metadata management

Metadata are information about each data helping users to understand how each data fits the into the ecosystem.

* 🍛 the description of the data
* 🔠 the concept the data represent <small>(ex: a Person, an Address...)</small>.
* 🍃 the relation between data and concepts
* 🧬 how the data is used, stored, retained, and destroyed
* 🐣 the transformations <small>(ex: derived attributes in SQL)</small>
* 👮 the validations/quality checks <small>(ex: constraints in SQL)</small>
* 🔑 how much is the data important/needed for the company
* 👑 who is the owner, the responsible/attendants
* 🪦 what's the origin of the data
* 🦗 who can access this data, and what they can do with it

⚠️ It must be clear where are Metadata stored and what's inside.

<details class="details-n">
<summary>Glossary of terms</summary>

A **glossary of terms** is used to describe every term <small>(ex: Client)</small>

* A description of what the term is, descriptive, unambiguous, with hyperlink to other terms <small>(see ISO-11179)</small>
* Add abbreviations, acronyms, synonyms, translations...
* Add any relation between terms
* Add management information <small>(When was this term added? By who? Who approved it? ...)</small>

Usually, we use a **taxonomy** to classify terms <small>(function, product category, business unit/process...)</small>.

* **Governance terms** 👑: for instance, "deprecated" or "retired" that could be used to indicate the state of semantic terms.
* **Semantic terms** 💵: business terms such as "customer", "invoice", "product"... Each term is often categorized into entities and properties. For example, the "customer" entity might have properties such as "name", and "address".

👉 Entities can be divided in: things, activities, and actors. Properties can be divided in: identifiers, attributes, and conditions.
</details>

<details class="details-n">
<summary>Data models</summary>

Data models are used to explain in a standardized way something. According to the target, the model will have more or less details

* conceptual models: high-level concepts
* logical models: relationship between data elements
* physical models: how the data is stored <small>(ex: UML diagrams)</small>
</details>
</div></div>

<hr class="sep-both">

## Structuring the program II

<div class="row row-cols-lg-2"><div>

#### Data classification

Elements are in the same class if they share the same controls. A common classification of data could be:

* **Public**: information that won't harm the company
* **Sensitive**: information that should be closely monitored but won't harm much the company if disclosed <small>(ex: upcoming news disclosed)</small>
* **Private**: information that will impact users or the company if disclosed <small>(ex: browser history)</small>
* **Confidential**: information that will harm users or the company if disclosed <small>(ex: credit card data)</small>

➡️ Clearly define what information is in which level. It's usually based on the valuation. You should not have more than 7.

🔥 An organization may add a class or a subclass in every class called **Critical data** for data essential for the organization to operate. They are usually identified when performing a [risk assessment](/cybersecurity/blue-team/topics/risk.md#risk-assessment).

🧨 An organization may also add a class or a subclass in every class called **Sensitive data** for data that may harm users or the organization if disclosed/accessed by unauthorized individuals..
</div><div>

💣 Beware that using **inference**, non-confidential information such as birthdate, postal code, and gender can allow us to find someone.

An additional classification or subclassification could be the one below. At the top, the semantic is the most important as it will impact the quality of the element below. Problems at the top will impact a lot the business. The more we go down, the more we have data.

1. 📝 **Metadata**: describe what kind of data we have
2. 🗝️ **Reference data**: data used as a reference for other data, such as a list of countries, ranks for customers <small>(iron, gold, diamond)</small>...
3. 💰 **Structural data**: data about external entities <small>(ex: providers, clients...)</small> and the data related to the service/product <small>(ex: price...)</small>
4. 🏢 **Organizational data**: data about the company <small>(ex: employees, sales inventory, departments, hierarchies...)</small>
5. 💵 **Operational data**: data generated by the activity of the company <small>(ex: orders, invoices...)</small>
6. 🪨 **Audit data**: logs of every change of the data

We call **Master data** the structural, organizational, and operational data altogether. This is the core and critical data of the company which is considered the single source of truth.
</div></div>

<hr class="sep-both">

## Structuring the program III

<div class="row row-cols-lg-2"><div>

#### Data quality

Data is of quality if it **fits it purpose**. It means that even incomplete data could pass this test, as long as it fits what the organization need.

1. 👉 **Accurate**: represent the truth (in real life)
2. 🥡 **Complete**: every entity and required properties are present
3. 🪞 **Consistent**: uniform between datasources
4. 🍃 **Referential integrity**: elements are correctly linked
5. ⚡ **Up-to-date**: promptly updated
6. 🧬 **Unique**: no duplicates
7. ✅ **Valid**: within the expected range...
8. 💰 **Relevant**: useful for the organization
9. 👮 **Trustworthy**: the source is known
10. ✈️ **Available**: those who need it can access it
11. 🔒 **Protected**: only those allowed can access it
12. 🙋 **Understandable**: the definition is both shared and clear
</div><div>

Usually, data quality must be ensured when creating, storing, and using the data. It's important to investigate the cause of low quality data 🪲, and to prioritize problems to mitigate.

A lack of quality may result in

* 🦥 delays <small>(due to duplicates, incorrect, and incomplete data)</small>
* 🐛 errors  <small>(due to duplicates, incorrect, and incomplete data)</small>
* 💳 financial losses <small>(cost to fix, loss of clients due to delays/errors)</small>

A few techniques to detect a lack of quality are:

* 🧐 detect outliers/extremums
* 🧞 ask the ones using the data

You may have to design validation/verification processes, and will have to design processes to monitor data quality over time.

➡️ Data cleansing, deduplication, normalization...
</div></div>

<hr class="sep-both">

## Structuring the program IV

<div class="row row-cols-lg-2"><div>

#### Data Anonymization Policy

Anonymization may be performed in many scenarios

* 📬 when sharing information with partners/third-party vendors
* 📚 when conducting a research <small>(statistics...)</small>
* 📈 when conducting a market analysis <small>(trend...)</small>
* 📝 to comply with regulations
* 🏗️ to create a test dataset
* 🌍 to generate and share open data
* ...

Most personally identifiable information (PII) or information such as firstname, lastname, address, phone number, official documents/identifiers, birthdate, gender, race... is anonymized.

➡️ Basically, any sensitive data that can be used to identify someone.
</div><div>

There are many techniques that are usually combined:

* 🌍 **Generalization**: group value in groups <small>(ex: age ranges)</small>
* 🚽 **Suppression**: remove a record <small>(line)</small> or an attribute <small>(column)</small>
* 🎬 **Data swapping**: swap some data between records
* 🫥 **Data masking**: partially obscuring data <small>(ex: 1976-XX-XX)</small>
* 🤏 **Data minimization**: reduce as possible the dataset length
* 🥂 **Caviar**: replace data with a "caviar" term <small>(ex: John Doe)</small>
* 🎭 **Pseudo-anonymization**: replace a PII with a random string that usually matches the format, but it's the real one
* 📍 **Adjustment**: apply a modification to group values <small>(round off...)</small>
* 🖨️ **Aggregation**: provide computed data <small>(mean of salaries...)</small>
* 🔑 **Hashing**: hash emails, passwords, IPs, ids...

There are also: **Noise addition** 🔊, **Perturbation** 🥞, and **Differential privacy** 👣 which are adding noise to data in different way, to prevent any form of identification.
</div></div>

<hr class="sep-both">

## Structuring the program V

<div class="row row-cols-lg-2"><div>

#### Data Retention Policy

Each data should have a retention policy describing

* 🔐 how long they are retained
* 🏦 where <small>(location, based on classification?, chronologically?)</small>
* 📚 how <small>(format, media)</small>
* 👷 who will archive/manage it
* 🧑‍🏭 who will ensure it's destroyed
* ...

These choices are mainly based on legal requirements.
</div><div>

#### Data Destruction Policy

The destruction policy describes

* 📝 what data should be destroyed <small>(both physical and virtual)</small>
* 🐣 when data should be destroyed <small>(ex: frequency)</small>
* 💥 how data should be destroyed <small>(based on classification...)</small>
* 🧑‍🏭 who will destroy it

It's important to ensure that data is erased beyond recovery 🔐. For instance, emptying the recycle bin in NOT enough. The disk should be defragmented or destroyed. Same for databases...

</div></div>

<hr class="sep-both">

## Data management

<div class="row row-cols-lg-2"><div>

One of the goal of data governance by defining data quality policies, metadata management policies... to ensure an efficient data management. There are five levels of data management:

1. **Ad hoc** 🐒: individuals manage data in their own way, there is no structure nor consistence.
2. **Repeatable** 📝: departments establish basic policies/procedures such as formats, backups policies...
3. **Defined** 🧐: the organization start formalizing data management, this include data quality policies, roles, responsabilities...
4. **Managed** ⚖️: data is actively monitored and inventoried
5. **Optimized** 💰💵: data management is implicit in all business processes, and continuously improved
</div><div>

The goal is to move from the lower levels to the higher levels, where data is managed effectively and driving business value.

👉 Gartner released a research report provides guidelines for improving data management called "Generally Accepted Information Principles for Improved Information Asset Management".

➡️ Rules and standards are usually define in these

* Principles: high-level guidance <small>(why do we need this data?)</small>
* Policies: more specific rules <small>(what do we need?)</small>
* Guidelines: recommendations and best practices <small>(how?)</small>
* Standards: technical specifications <small>(quality...)</small>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Retention policy, a business continuity plan <small>(step 4 of data life-cycle)</small>
* Data Stewardship
* Test data
* Information architecture triangle
* minimize data redundancy to ensure that data is accurate, consistent, and secure
* misused or mishandled
</div><div>

Data breaches

* The company must find, and patch the vulnerability
* The company must inform the clients
* The company will have to pay fines
* The company will lose reputation

To prevent data breaches, the company after identifying, classifying, and prioritizing data, should find why data is likely to be targeted along the risks, and define required protections.

* data recovery plans
* Data Loss Prevention (DLP)
* communication plans
* data breach notification laws
</div></div>