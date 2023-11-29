# Blue team

[![careersincyber](../../_badges/thmp/careersincyber.svg)](https://tryhackme.com/room/careersincyber)
[![securityoperations](../../_badges/thmp/securityoperations.svg)](https://tryhackme.com/room/securityoperations)
[![defensivesecurity](../../_badges/thmp/defensivesecurity.svg)](https://tryhackme.com/room/defensivesecurity)
[![principlesofsecurity](../../_badges/thm/principlesofsecurity.svg)](https://tryhackme.com/room/principlesofsecurity)

<div class="row row-cols-lg-2"><div>

The blue team is specialized in defense, which involves protecting the systems, whether proactively or not.

* 🛡️ Secure the system/business activities <small>(and document them)</small>
* 🔎 Monitor logs <small>(traffic, user activity...)</small>
* 👮 Detect and stop attacks <small>(as fast as possible)</small>
* 🚓 Do digital forensics
* 🐬 Track down hackers
* 🖋️ Do security awareness training
* 🔁 Ensure their measures/systems/... are still up-to-date
</div><div>

Some jobs in the blue team are:

* **Security Architect** 👷‍♂️: plan the security of activities and systems in accordance with the business needs and requirements.
* **Security Analyst** 📝: analyze and remediate issues. Develop security plans to keep the company safe, and implement them.
* **Incident responder** 🧑‍🚒: handle and remediate incidents
* **Digital Forensics** 🔎: investigate attacks and policy violations.
* **Malware Analyst**/**Reverse-engineer** 💥: analyze/detect malware, statically <small>(read the code)</small>, and dynamically <small>(see what it does)</small>.
* **Security researcher** 🔓: research on Linux, hashing algorithms...
</div></div>

<hr class="sep-both">

## Pillars & Foundations

[![adventofcyber4](../../_badges/thm/adventofcyber4/day22.svg)](https://tryhackme.com/room/adventofcyber4)
[![adventofcyber4](../../_badges/thm/adventofcyber4/day23.svg)](https://tryhackme.com/room/adventofcyber4)
[![securityprinciples](../../_badges/thmp/securityprinciples.svg)](https://tryhackme.com/room/securityprinciples)

<div class="row row-cols-lg-2"><div>

**The security triad (CIA)** is a famous principle used everywhere in security. The opposite is DAD <small>(Disclosure, Alteration, and Destruction)</small>.

* 🔒 **Confidentiality**: only those allowed can access resources
* 🔎 **Integrity**: only allowed modifications can modify resources
* 📂 **Availability**: resources are available when needed

The French "DICAI" model extends the CIA principle with:

* 🔑 Authentication and Identification: verify the identity of users
* ⌛ Irrevocability: once performed, it cannot be undone

See also: [Parkerian Hexad](https://en.wikipedia.org/wiki/Parkerian_Hexad) (6 layers).

<br>

**Reduce the attack surface** 🏄‍♂️: avoid unused software, plugins, solutions/... that are potential attack vectors.
</div><div>

**Defense-in-depth**/Multi-Level Security 🕸️: use of multiple layers of security, along with various tactics, to slow down/stop an intruder

**Triple-A principles** 🔒: Authentication <small>(verify the identity)</small>, Authorization <small>(determine the permissions)</small>, and Accounting <small>(logs)</small>.

**Zero trust** 🔎: a concept. No blind trust, verify everything, assume everyone is a threat, and continuously monitor resources.

**Trust but verify** 📇: trust security measures/..., but still log and verify that there is nothing unexpected/not allowed.

**Principle of the least privilege** 👮: everyone, regardless of their role in the company <small>(CEO...)</small>, should have the least privilege that they require to do their job.

**Sweet spot** 🍭: find the right balance between security and productivity. Don't burden users too much.
</div></div>

<hr class="sep-both">

## Activities and tools 🤵

<div class="row row-cols-lg-2"><div>

#### Architecture

Designing the architecture involves multiple aspects:

* [Security Architecture](../architecture/architecture.md): plan your organization security
* [Data governance](../architecture/data.md): how to handle data from creation to destruction
* ...

#### Security models (conceptual)

[![securityprinciples](../../_badges/thmp/securityprinciples.svg)](https://tryhackme.com/room/securityprinciples)

* Bell-LaPadula Model <small>(focus on confidentiality)</small>
* Biba Model <small>(focus on integrity)</small>
* Clark-Wilson Model <small>(focus on data integrity)</small>

#### Security frameworks (practical)

[![adventofcyber4](../../_badges/thm/adventofcyber4/day1.svg)](https://tryhackme.com/room/adventofcyber4)
[![redteamfundamentals](../../_badges/thm/redteamfundamentals.svg)](https://tryhackme.com/room/redteamfundamentals)

* Cybersecurity Framework (CSF) by NIST
* ISO/IEC 27000 series
* MITRE ATT&CK Framework <small>(TTP=Tactics, Techniques and Procedures)</small>
</div><div>

#### Cyber Threat Intelligence (CTI)

[![defensivesecurityhq](../../_badges/thm/defensivesecurityhq.svg)](https://tryhackme.com/room/defensivesecurityhq)

Threat intelligence is a process during which a company collects information about potential threats and prepares for them.

* **Platforms** ☕: [Cisco Talos Intelligence](https://talosintelligence.com/), [Open Threat Exchange](https://otx.alienvault.com/), [cyware](https://cyware.com/), [pulsedive](https://pulsedive.com/)
* **Alerts** 📢: [secalerts](https://secalerts.co/), [stack.watch](https://stack.watch/)
* **IP analysis** 🌍: [AbuseIPDB](https://www.abuseipdb.com/) <small>(malicious IPs)</small>, [IPinfo](https://ipinfo.io/) <small>(location)</small>
* **Malware analysis** 💣: [VirusTotal](https://www.virustotal.com), [Hybrid Analysis](https://www.hybrid-analysis.com/), [joesandbox](https://www.joesandbox.com/#windows)
* **Others** 🎹: Threatmap, ShadowServer...

➡️ **See also**: Threat hunting <small>(hunt down a suspicious movement)</small>, Threat modeling <small>(review, and improve the security measure, see STRIDE, PASTA)</small>.
</div></div>

<hr class="sep-both">

## Security Operation Center (SOC)

[![defensivesecurityhq](../../_badges/thm/defensivesecurityhq.svg)](https://tryhackme.com/room/defensivesecurityhq)

<div class="row row-cols-lg-2"><div>

A security operation center is a war room where security professionals work 24/7. They are:

* Detecting unusual activity
* Detecting intrusions or violations
* Monitoring vulnerabilities
* Training or raising awareness
* ...
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

Stuff

* The five "As" in security

Learn

* [THM/mitre](https://tryhackme.com/room/mitre)
</div><div>

Tools/methods/...

* [Security Control Framework](https://securecontrolsframework.com/)
* Endpoint Detection and Response (EDS)
    * antivirus
    * anti-malware
    * intrusion prevention
* Deceptive security

</div></div>