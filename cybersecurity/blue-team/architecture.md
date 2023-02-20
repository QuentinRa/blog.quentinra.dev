# Security Architecture

<div class="row row-cols-md-2"><div>

Security architecture is the process of designing and oversee the implementation of security controls within an organization's IT infrastructure to protect IT assets for harmful actions such as unauthorized access modification or deletion, data disclosure...

Cybersecurity architects are responsible for identifying potential security risks and recommending measures <small>(software, hardware, peoples...)</small> to strengthen the security architecture of the IT infrastructure, **and align with the organization strategy goals and objectives** ✅.

Frameworks like [SABSA](frameworks/sabsa.md), TOGAF, or OSA are methodologies to implement security architecture. 

Additionally, some controls may be enforced:

* 👉 Regulations according to the activity <small>(ex: PCI DSS or HIPAA)</small>
* 👉 Guidelines or industry standards
  * ISO
  * NIST, NSA
  * CIS Security
  * SANS <small>(see: critical security controls...)</small>
  * Providers <small>(ex: Cisco...)</small>
</div><div>

<div class="text-center">

Pillars & Foundations
</div>

👉 **The security triad (CIA)** is a famous principle used everywhere in security. The opposite is DAD <small>(Disclosure, Alternation, and Destruction)</small>.

* Confidentiality: only those allowed can access resources
* Integrity: only allowed modification can modify resources 
* Availability: resources are available when needed

There is also the french "DICAI" model that extends CIA with Authentication and Identification <small>(verify the identity of users)</small>, and Irrevocability <small>(once performed, cannot be undone)</small>.

👉 **Defense-in-depth** 🕸️: use of multiple layers of security, along with various tactics, to slow down/stop an intruder

👉 **Triple-A principles** 🔒: Authentication <small>(verify the identity)</small>, Authorization <small>(determine the permissions)</small>, and Accounting <small>(logs)</small>.

👉 **Zero trust** 🔎: do not trust anyone/anything, verify everything, assume everyone is a threat, and continuously monitor resources.

👉 **Principle of least privilege** 👮: everyone, regardless of their role in the company <small>(CEO...)</small>, should have the least privilege that they require to do their job.
</div></div>

<hr class="sep-both">

## Mindset

<div class="row row-cols-md-2 mt-3"><div>

It's important that before thinking about "security" or what makes something "secure", a security architect must think what values it has for the company.

This is done by identifying [risks](/cybersecurity/blue-team/risk.md), prioritizing them, and evaluating their impact along the cost to mitigate them under an acceptable level of risk. Based on these, the security architect will implement more or less security controls as long as "it is worth it".

* The losses are significant
* The losses are not lower than the cost to set up controls
</div><div>

👉 You should view security as a way to enable business, and not preventing it.

👉 Security give a competitive value to product. For instance, by providing a secure way for customers to do purchases on their smartphone, they can increase its value on the market.

👉 Security is essential for cooperation between business. For instance, a company must trust another company that the data they share with them is properly secured/managed.
</div></div>

<hr class="sep-both">

## Security controls

<div class="row row-cols-md-2"><div>

Security controls are security measures to reduce/prevent risks.

👉 Examples: Firewalls, IDS/IPS, Access control...

The security architect need to have a broad view of the organization as they will interact with everyone, not only the IT service. They will have to understand the security needs of the organization, and **create** principles, policies, guidelines, and standards to **design** and **implement** the necessary security controls.

Security controls can be technical or administrative, physical or digital, and should include the cloud and IoT devices.
</div><div>

❌️ Following a checklist is unlikely to meet the business needs or provide real benefits. A security architect mustn't only rely on it, as they need to more sophisticated approach balancing the needs and requirements, risks, and technologies with the security. ✅ Solutions should be selected according to the needs/goals of the organization.

➡️ See COBIT framework.
</div></div>

<hr class="sep-both">

## Model for business architecture

<div class="row row-cols-md-2"><div>

A company architecture is made up of smaller sub-architectures. A good security architecture should take each needs and risks into account. For instance, one sub-architecture may have access-control, another recovery plans...

This a pyramid where the top is supported by lower level architectures, and higher level are developed in architectures levels below.
</div><div>

**1. Business Architecture**: define how the business is structured <small>(processes, functions, strategies, policies...)</small>.

➡️ Identify Business requirements and Business drivers.

**2. Information Architecture**: define how information and data is designed and organized <small>(databases, data sources...)</small>.

➡️ See [Data governance](/cybersecurity/blue-team/data.md) to efficiently exploit/manage/protect data...

**3. Applications Architecture**: define the design and organization of applications <small>(interfaces, interactions, ecosystems...)</small>.

👉 Main objective: support business processes

**4. Infrastructure Architecture**: define the physical and virtual resources  <small>(hardware, software, network...)</small>.
</div></div>

<hr class="sep-both">

## Systems approach to security architecture

<div class="row row-cols-md-2"><div>

A systems approach is a structured way to think about the security of a system, as they are becoming more complex <small>(cloud...)</small>. It ensures that:

* every aspect is considered to bring the most benefits
* that decisions are rational, goals are met
* systems are efficiently exploiting the company environment

We break down the system using a top-down approach, into less complex sub-systems and components. Each is seen as a black-box in which we only know the I/O. Using "logical flow analysis", we analyze and ensure that all aspects of the system are considered.

</div><div>

👉 Everything (ideas, needs, decisions) is documented. Decisions should be rational and traceable <small>(ex: use peer review...)</small>. You could use a scoring system to evaluate options and explain the selection of one.

👉 Start from business needs to design the system. Take into account the environment <small>(see PESTEL, SWOT matrix)</small>.

👉 We must be able to tell how the system perform, to ensure its efficiently used <small>(metrics; KPI; control, measurement, and decision)</small>.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

</div><div>

</div></div>