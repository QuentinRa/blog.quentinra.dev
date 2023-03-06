# Security Architecture

<div class="row row-cols-md-2"><div>

Security architecture is the process of designing and oversee the implementation of security controls within an organization's IT infrastructure to protect IT assets for harmful actions such as unauthorized access modification or deletion, data disclosure...

➡️ Security Architecture is Enterprise Architecture applied to IT.

Security architects are responsible for identify the organization needs, and designing the appropriate security controls **that are tailored with the organization strategy, goals, and objectives** ✅.

They will identify risks and plan security controls to reduce or mitigate them under an acceptable level, all by focusing on what the company need, so all risks may not be mitigated/handled.

🎯 This is a continuous process, controls must be continually reviewed and updated to ensure that they are effective and appropriate. 
</div><div>

Frameworks like [SABSA](frameworks/sabsa.md), TOGAF, or OSA are methodologies to implement security architecture.

Additionally, some security controls may be enforced:

* Regulations according to the activity <small>(ex: PCI DSS or HIPAA)</small>
* Guidelines or industry standards
  * ISO
  * NIST, NSA
  * CIS Security
  * SANS <small>(see: critical security controls...)</small>
  * Providers <small>(ex: Cisco...)</small>
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

## Pillars & Foundations

<div class="row row-cols-md-2 mt-3"><div>

**The security triad (CIA)** is a famous principle used everywhere in security. The opposite is DAD <small>(Disclosure, Alteration, and Destruction)</small>.

* 🔒 Confidentiality: only those allowed can access resources
* 🔎 Integrity: only allowed modification can modify resources
* 📂 Availability: resources are available when needed

There is also the french "DICAI" model that extends CIA with 

* 🔑 Authentication and Identification: verify the identity of users
* ⌛ Irrevocability: once performed, cannot be undone
</div><div>

**Defense-in-depth** 🕸️: use of multiple layers of security, along with various tactics, to slow down/stop an intruder

**Triple-A principles** 🔒: Authentication <small>(verify the identity)</small>, Authorization <small>(determine the permissions)</small>, and Accounting <small>(logs)</small>.

**Zero trust** 🔎: do not trust anyone/anything, verify everything, assume everyone is a threat, and continuously monitor resources.

**Principle of the least privilege** 👮: everyone, regardless of their role in the company <small>(CEO...)</small>, should have the least privilege that they require to do their job.
</div></div>

<hr class="sep-both">

## Security controls

<div class="row row-cols-md-2"><div>

Security controls are security measures to reduce/prevent risks.

👉 Examples: Firewalls, IDS/IPS, Access control, [Updates management](/cybersecurity/blue-team/updates.md), [Logging and monitoring](/cybersecurity/blue-team/logs.md)...

👉 There are 3 types of controls: Preventive, Detective, and Corrective.

The security architect need to have a broad view of the organization as they will interact with everyone, not only the IT service. They will have to understand the security needs of the organization, and **create** principles, policies, guidelines, and standards to **design** and **implement** the necessary security controls.

Security controls can be technical or administrative, physical or digital, and should include the cloud and IoT devices.
</div><div>

❌️ Following a checklist is unlikely to meet the business needs or provide real benefits. A security architect mustn't only rely on it, as they need to more sophisticated approach balancing the needs and requirements, risks, and technologies with the security. ✅ Solutions should be selected according to the needs/goals of the organization.

➡️ See the COBIT framework.

➡️ A security control system is important to ensure security controls are effective, and to improve them. They employs a feedback loop with three sub-systems: control <small>(ex: monitoring, detect issues)</small>, measurement <small>(mesure performance, analyze impacts)</small>, and decision <small>(ex: determine a course of action)</small>.
</div></div>

<hr class="sep-both">

## Model for business architecture

<div class="row row-cols-md-2"><div>

A company architecture is made up of smaller sub-architectures. By following this model, it ensures that security architects find both risks and security controls for each level.

For instance, one sub-architecture may have access-control, another recovery plans...

This a pyramid where the top is supported by lower level architectures, and higher level are developed in architectures levels below.

It important that everyone involved in security architecture understand each layer to ensure that security controls are properly implemented.
</div><div>

**1. Business Architecture**: define how the business is structured <small>(processes, functions, strategies, policies...)</small>.

📚 Identify Business requirements and Business drivers...

**2. Information Architecture**: define how information and data is designed and organized <small>(databases, data sources...)</small>.

📚  See [Data governance](/cybersecurity/blue-team/data.md) to efficiently exploit/manage/protect data...

**3. Applications Architecture**: define the design and organization of applications <small>(interfaces, interactions, ecosystems...)</small>.

📚 Identify required access control, secure coding practices...

**4. Infrastructure Architecture**: define the physical and logical resources  <small>(hardware, software, network, storage, cloud...)</small>.

📚 Identify required security elements to secure resources
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

## Security Program

<div class="row row-cols-md-2 mt-3"><div>

A security program must be public, realist, simple, accurate, and adapted to the business of the company.

Setting up a program show the intention of the company to comply with legal regulations.

* ⚖️ If not followed, it will be used to punish the company
* 🫅 It must be supported by the executives
* ⛪ It must be taken in consideration in every decision
* 🐸 It must be proactively applied <small>(formations...)</small>
* 🎤 It's important to document the security program

These are usually based on industry best practices and standards.

* ISO 27001
* SP 800-53
</div><div>

##### 🖨️ Policies <small>(based on legal requirements and business principles)</small> 🖨️

* **Corporate security policy**: the company approach/strategy to security, in accordance to the business objectives
* **Specific security policies**: based on the corporate security policy, more detailed <small>(ex: emails, incidents...)</small>

➡️ Objectives, principles, scope, obligations and sanctions...

##### ⚖️ Directives/Standards ⚖️

* **Security element directives**: define how security controls are implemented and maintained based on policies

➡️ Objectives, principles, scope, obligations and sanctions...

##### 📚 Guides/Guidelines 📚

* **Security guidelines**: advices and best practices to apply directives/policies, based on directives and policies

##### 🚧 Procedures/Controls 🚧

* **Security procedures**: instructions to perform security-related tasks based on guides and directives
</div></div>

<hr class="sep-both">

## Roles and responsibilities

<div class="row row-cols-md-2"><div>

For a program to be successful, it's important to define roles and responsibilities of each stakeholder, so that they are aware of what they should do to make the security program successful.

* **Responsible** <small>(owner)</small> 👑: approve, enforce, modify, revoke
* **Participate** <small>(has an expertise)</small> 🏢: draft, contribute, review
* **Is consulted** <small>(has an understanding)</small> ⚒️: feedback, implementation 
* **Is informed** <small>(has to comply)</small> 📦: they are contributing to the document, but they need to know about it to do their work

➡️ Usually, each role is responsible for ensuring that their area of responsibility is addressed in policies, procedures, and guidelines.
</div><div>


</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Security Control Framework](https://securecontrolsframework.com/)
</div><div>


</div></div>