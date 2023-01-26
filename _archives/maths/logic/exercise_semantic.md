# Semantic proof

[Go back](..)

## Exercise

Let's consider the following clauses :
* If Diego is angry then Jonathan's father dies.
* If Diego poisons Jonathan's father then Jonathan's father dies.
* Diego poisons Jonathan's father or Jonathan investigates.
* If Jonathan investigates then Diego is angry.

Prove that whatever happens Jonathan's father dies.

<blockquote class="spoiler">

$p$, $i$, $a$ and $d$ are propositional variable meaning respectively:

* Diego poisons Jonathan's father
* Jonathan investigates
* Diego is angry
* Jonathan's father dies

So the clauses are represented by the following formulas :
<p>
	<ul>
		<li>\[(1) \quad a \Rightarrow d\]</li>
		<li>\[(2)\quad p \Rightarrow d\]</li>
		<li>\[(3)\quad p \vee i\]</li>
		<li>\[(4)\quad i \Rightarrow a\]</li>
	</ul>
</p>
	
So we want to prove that $\\{(1),(2),(3),(4)\\} \models d$
</br>
We call $I$ an interpretation satisfying $\\{(1),(2),(3),(4)\\}$

**First case : If $I \models i$**

Then with $(4)$, $I \models a$ : Indeed (cf. the truth table of the implication), 
</br>
$I(i \Rightarrow a)=1$ that is $I(i) \Rightarrow I(a)=1$
</br>
But we assume that $I(i)=1$, then necessarily $I(a)=1$

In the same way, with $(1)$, $I \models d$

**Second case : If $I \not\models i$**

Then with $(3)$, $I \models p$ (cf. the truth table of the logical disjunction),
</br>
$I(p \vee i)=1$ that is $I(p) \vee I(i)=1$
</br>
But we assume that $I(i)=0$, then necessarily $I(p)=1$

And with $(2)$, $I \models d$

**In conclusion, no matter what, Jonathan's father will die.**
</br>
I hope you enjoy this one!

</blockquote>
