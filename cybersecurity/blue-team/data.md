# Data governance

<div class="row row-cols-md-2"><div>

Data governance is usually involved in the early stages of security architecture, focusing on the data.

Data governance starts by considering data as a critical asset of the company. It's a new way of thinking/doing.

* 🥡 Define how data is accessed/shared
* 🗃️ Define how data is stored
* 💰 Define how data is used/processed
* 🐸 Define how data is managed <small>(quality, retained, deleted...)</small>
* ...

And, define how 🔑 data is protected at every step.
</div><div>

We need to identify the **needs**, **requirements**, and the **risks** related to the data, as defined in [Risk management](/cybersecurity/blue-team/risk.md), to reduce risks under an acceptable level. Some risks related to data are:

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

<div class="row row-cols-md-2"><div class="align-self-center">

While the goal of the [Security Program](/cybersecurity/blue-team/architecture.md#security-program) is to ensure that the organization IT architecture is safe, including data, the goal of the data governance program is to ensure the **efficient usage, management, and protection of data to drive business value** 🚀.
</div><div>

👉 According to the DAMA framework, we start by identifying the regulations, then we define policies, then standards/directives and guides, then we evaluate the risks and setup procedures.

👉 According to ISO 27001, we first define the scope of the program, the assets, their critical level, their value (impact/loss). Then, we identify the threats, and set up controls and monitoring.
</div></div>

<hr class="sep-both">

## Inventory data assets

<div class="row row-cols-md-2"><div>

The first step is to identify the current state of the organization to find problems or elements needing improvement along their causes.

* 🔑 Identify access control and management of accesses
* 💰 Identify how data is used, identify patterns...
* 🔐 Identify who is responsible, who are the stakeholders
* 🍃 Identify data flows, lifecycle, and environment
* 🔥 Identify a lack of quality <small>(does it fit its purpose?)</small>

➡️ You can ask representatives from each business unit.

#### Identify environments

For environments, data <small>(both virtual and physical)</small> can be found in:

* **Storage** <small>(databases, cloud, mobiles, devices...)</small>: encryption, backup, access control, physical measures...
* **Transit**: encryption & secure protocols (TLS), VPN, MPLS...
* **Utilization**: encryption, access control, monitoring...
</div><div>

#### Data valuation

...
</div></div>

<hr class="sep-both">

## Structuring the program I

<div class="row row-cols-md-2"><div>

The second step is to define and structure the governance program.

* 👑 Define the roles and responsibilities of those involved

* 🛣️ Define a data governance framework **tailored for the organization** with guidelines for management, security, privacy, quality, compliance, improvements...

#### Data classification

A common classification of data could be:

* **Public**: information that won't harm the company
* **Sensitive**: information that should be closely monitored but won't harm much the company if disclosed <small>(ex: upcoming news disclosed)</small>
* **Private**: information that will impact users or the company if disclosed <small>(ex: browser history)</small>
* **Confidential**: information that will harm users or the company if disclosed <small>(ex: credit card data)</small>

👉 Elements are in the same class if they share the same controls.

➡️ Clearly define what information is in which level. It's usually based on the valuation. You should not have more than 7.
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

A glossary of terms is used to describe every term <small>(ex: Client)</small>

* A description of what the term is, descriptive, unambiguous, with hyperlink to other terms <small>(see ISO-11179)</small>
* Add abbreviations, acronyms, synonyms, translations...
* Add any relation between terms
* Add management information <small>(When was this term added? By who? Who approved it? ...)</small>
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

<div class="row row-cols-md-2"><div>

#### Data quality

...
</div><div>

...
</div></div>

<hr class="sep-both">

## Structuring the program III

<div class="row row-cols-md-2"><div>

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