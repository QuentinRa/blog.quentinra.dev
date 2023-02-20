# Risk management

<div class="row row-cols-md-2"><div>

The risk management evaluates the probability of something occurring <small>(natural risks, malicious actors...)</small>.

* **Quantitatively**: we assign a numerical value to the risk
* **Qualitatively**: we assign a level to the risk

The risk could be speculative (gain or loss) or non-speculative (loss). The goal is to reduce risks under an acceptable level.

➡️ Risks should be prioritized based on how critical they are <small>(legal requirements, big impact on the business...)</small>. Mitigations should be taken in accordance to the level of the risk.
</div><div>

There are many types of risks: financial, legal, operational, or IT security risks such as:

* Misfunction/outage of the Domain Controller <small>(Active Directory)</small>
* Accidental removal of data/accounts
* Unauthorized access/... to sensible/critical data
* Improper/illegal use of data <small>ex: clients financial data)</small>
* Infections, DDoS, hacking...
* Communication/passwords being intercepted/compromised
* See [Data governance risks](/cybersecurity/blue-team/data.md#security-risks-and-business-needs)

</div></div>

<hr class="sep-both">

## Risk assessment

<div class="row row-cols-md-2"><div>

#### Quantitatively

<p></p>

1. Find the Asset Value <small>(AV)</small>
2. Find the Exposure Factor to the risk <small>(EF)</small>
3. Find the loss per event <small>(SLE=SingleLossExpected=AV*EF)</small>
4. Find the annual rate occurrence <small>(ARO)</small>
5. Find the annual loss expected <small>(ALE=ARO*SLE)</small>

This approach is quite simple, if the AV is 50 millions, and two out of three times we can mitigate the risk $EF=\frac{1}{3}$, then the loss per event is $SLE=50000000 * \frac{1}{3}=15\text{ millions}$. If this risk occurs 2 times per year, then we will have $ARO=2$, and $ALE=30\text{ millions}$.
</div><div>

➡️ The main problems with this approach is that it is hard to identify every risk or to determine the value of every asset, the factors, or the occurrence rate.

#### Qualitatively

This is the most used approach. We gather a group of experts on each asset within the company, and ask them to evaluate the risk based on a consensus.

We will usually group risks in a family of risks, and place them in a risk matrix, were the risks the most important and likely to occur are dealt with first.
</div></div>

<hr class="sep-both">

## Risk mitigation strategies

<div class="row row-cols-md-2 mt-3"><div>

* ➡️ **Avoidance**: change your way of doing things
* ➡️ **Mitigation**: use/do something to prevent the risk
* ➡️ **Monitor and react**: make it so that you are able to react fast when the risk occurs
* ➡️ **Transfer**: transfer the risk to an external entity/someone else
* ➡️ **Acceptation**: accept the risk and don't do anything
</div><div>

</div></div>