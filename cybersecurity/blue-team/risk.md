# Risk management

<div class="row row-cols-md-2"><div>

Risk management is the process of identifying, assessing, and prioritizing risks. The organization will try to 

* reduce a risk under an acceptable level
* completely mitigate a risk

➡️ If the losses aren't significant enough, or the loss is lower than the cost to mitigate the risk, the organization may choose to ignore a risk.
</div><div>

There are many types of risks <small>(financial losses, disasters, security breaches, operational issues, legal liabilities...)</small> such as:

* 🔥 Misfunction/outage of the Domain Controller <small>(Active Directory)</small>
* 🙅‍♀️ Accidental removal of data/accounts
* 🔐 Unauthorized access/... to sensible/critical data
* 💰 Improper/illegal use of data <small>(ex: use of a client's credit card)</small>
* 🔫 Infections, DDoS, hacking, data leak...
* 🧑‍💻 Communication/passwords being intercepted/compromised
* 🗃️ See also [data governance risks](/cybersecurity/blue-team/data.md#security-risks-and-business-needs)
</div></div>

<hr class="sep-both">

## Risk assessment

<div class="row row-cols-md-2"><div>

There are many ways to assess the impact of a risk on the organization, which will help to prioritize them or to request a budget.

**Quantitative risk assessment**: we assign a financial value to a risk. The main problem is that is it hard to find the numerical values.

1. Find the Asset Value <small>(AV)</small>
2. Find the Exposure Factor to the risk <small>(EF)</small>
3. Find the loss per event <small>(SLE=SingleLossExpected=AV*EF)</small>
4. Find the annual rate occurrence <small>(ARO)</small>
5. Find the annual loss expected <small>(ALE=ARO*SLE)</small>

<details class="details-s mb-3">
<summary>Example</summary>

The AV is 45 millions. Two out of three times we can mitigate the risk, it means that the risk occurs 1 out of 3 times, so `EF=1/3`. The loss per event is `SLE=45M*(1/3)=15M`. The risk occur two times per year, so `ARO=2` and `ALE=15M*2=30M`. It means that we won't pay insurance or means to mitigate the risk greater than 30 millions.
</details>

**Qualitative risk assessment**: we gather a group of experts on each asset, and ask them to make a judgment based on likelihood, occurrence, impact, and the cost to mitigate the risk. A risk matrix is often used to visualize the ranking of assessed risks.

</div><div>

**Risk matrix**: a matrix in which we put risks in cells based on likelihood and severity. We usually add colors to cells like grey, yellow, orange, and red, to indicate their importance.

**Vulnerability assessments**: [...]

**Threat modeling**: identify and assess potential threats and vulnerabilities to develop an effective strategy against them.

**Business impact analysis**: [...]

**Role-based risk assessment**: a qualitative risk assessment. We identify risks associated to each role <small>(ex: CEO, CTO...)</small> of the company <small>(meaning their job, duties, responsibilities...)</small>. We could use a table with 

* rows 💰: assets broken down into smaller parts <small>(ex: customer data)</small>
* columns 🧑: business units broken down into roles <small>(marketing in ...)</small>

Cells are the operation <small>(ex: create)</small>, and the level of criticality <small>(how much is this asset required to perform the task?)</small>. You could use levels live 1 to 5.
</div></div>

<hr class="sep-both">

## Risk mitigation

<div class="row row-cols-md-2 mt-3"><div>

Common strategies are:

* ➡️ **Avoidance**: change your way of doing things
* ➡️ **Mitigation**: use/do something to prevent the risk
* ➡️ **Monitor and react**: make it so that you are able to react in a fast and appropriate way when the risk occurs
* ➡️ **Transfer**: transfer the risk to an external entity/someone else
* ➡️ **Acceptation**: accept the risk and don't do anything
</div><div>

</div></div>