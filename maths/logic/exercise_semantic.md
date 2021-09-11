# Semantic proof

[Go back](..)

## Exercise

Let's consider the following clauses :
<p>
    <ul>
        <li>If Diego is angry then Jonathan's father dies</li>
        <li>If Diego poisons Jonathan's father then Jonathan's father dies</li>
        <li>Diego poisons Jonathan's father or Jonathan investigates</li>
        <li>If Jonathan investigates then Diego is angry</li>
    </ul>
</p>

Prove that whatever happens Jonathan's father dies

<blockquote class="spoiler">

$p$, $i$, $a$ and $d$ are propositional variable meaning respectively:

<ul>
    <li>Diego poisons Jonathan's father</li>
    <li>Jonathan investigates</li>
    <li>Diego is angry</li>
    <li>Jonathan's father dies</li>
</ul>

<p>
So the clauses are represented by the following formulas :

<ul>
    <li>\[a \Rightarrow d\] (1)</li>
    <li>\[p \Rightarrow d\] (2)</li>
    <li>\[p \vee i\] (3)</li>
    <li>\[i \Rightarrow a\] (4)</li>
</ul>

So we want to prove that $\{(1),(2),(3),(4)\} \models d$

$I$ an interpretation satisfying $\{(1),(2),(3),(4)\}$

**First case : If $I \models i$**

Then with $(4)$, $I \models a$ : Indeed (cf. the truth table of the implication), 

$I(i \Rightarrow a)=1$ that is $I(i) \Rightarrow I(a)=1$

But we assume that $I(i)=1$, then necessarily $I(a)=1$

In the same way, with $(1)$, $I \models d$

**Second case : If $I \not\models i$**

Then with $(3)$, $I \models p$ (cf. the truth table of the logical disjunction),

$I(p \vee i)=1$ that is $I(p) \vee I(i)=1$

But we assume that $I(i)=0$, then necessarily $I(p)=1$

And with $(2)$, $I \models d$

In conclusion, no matter what, Jonathan's father will die.
I hope you enjoy this one!

</blockquote>
