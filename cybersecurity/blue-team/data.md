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
</div><div>

#### Identify environments

For environments, data <small>(both virtual and physical)</small> can be found in:

* **Storage** <small>(databases, cloud, mobiles, devices...)</small>: encryption, backup, access control, physical measures...
* **Transit**: encryption & secure protocols (TLS), VPN, MPLS...
* **Utilization**: encryption, access control, monitoring...
</div></div>

<hr class="sep-both">

## Structuring the program I

<div class="row row-cols-md-2"><div>

The second step is to define and structure the governance program.

* 👑 Define the roles and responsibilities of those involved

* 🛣️ Define a data governance framework **tailored for the organization** with guidelines for management, security, privacy, quality, compliance, improvements...

#### Data classification

...
</div><div>

#### Data quality

...

#### Metadata management

...
</div></div>

<hr class="sep-both">

## Structuring the program II

<div class="row row-cols-md-2"><div>

#### Data Retention Policy

...
</div><div>

#### Data Destruction Policy

...
</div></div>