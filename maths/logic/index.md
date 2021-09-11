# Logic

Mathematical logic is useful in many ways. First of all, it led to globalize theory: in several disciplines linked to mathematics or IT, if you want to prove an hypothesis or develop it, you (have to) use logic.

In our case, it enables to verify propositions or algorithms.
By the way, logic is well-known through automated theorem proving, expert system or proof assistant. For instance, the four color theorem (cf graph) which states that only four colors are needed to color the regions of any map so that no two adjacent (nearby) regions have the same color was proved by a computer.

<hr class="sl">

## Introduction

You will start with basic knowledge as Structural induction (``induction``), Semantics of logic (Boolean algebra, Truth table, ...) and a simple version of natural deduction. Then, you'll head for the centrepiece: First-order logic.

<hr class="sr">

## Structural induction

$\mathcal{B}$ is a set of constant symbols (``ensemble de bases``)
$\mathcal{K}$ is a set of function symbols (``ensemble d'opérations``)

So <$\mathcal{B},\mathcal{K}$> is a set created by induction, the smallest set E satisfying the following criteria:
* $\mathcal{B} \subset E$
* $f$ an $n_{f}$-ary function symbol and $x_{1}, \cdots, x_{n_{f}} \in E$, then $f(x_{1}, \cdots, x_{n_{f}}) \in E$ too

**Proof by induction**: Let's consider an hypothesis $P$. To demonstrate that all the elements of <$\mathcal{B},\mathcal{K}$> satisfy $P$, you have just to verify that:
* $\forall x \in \mathcal{B}$, $P(x)$ is satisfied
* $\forall f \in \mathcal{K}$ with arity $n_{f}$ and $\forall x_{1}, \cdots, x_{n_{f}} \in E$ so that $P(x_{1}), \cdots, P(x_{n_{f}})$ are satisfied, $P(x_{1}, \cdots, x_{n_{f}})$ is also satisfied.

A simple example of structural induction is mathematical induction (``raisonnement par récurrence``). 
Indeed, if you take $\mathcal{B}=\{0\}$ and $\mathcal{K}=\{succ\}$ such as $\forall n \in \mathbb{N}$, $succ(n)=n+1$, then $\mathbb{N}=$<$\mathcal{B},\mathcal{K}$>.
So, mathematical induction is just a proof by induction in $\mathbb{N}$=<$\{0\},\{succ\}$>. 

<hr class="sl">

## Semantics of logic

### Boolean algebra

Here is given the truth table of basic operations :
* $\wedge$ stands for **AND** (=conjunction)
* $\vee$ for **OR** (=disjunction)
* $\Rightarrow$ for **IMPLIES** (=implication)
* $\neg$ for **NOT** (=negation)

$x$ and $y$ are propositional variable of whom you give values $\in \{0,1\}$. Improperly, $0$ stands for **FALSE** and $1$ for **TRUE**. So, as you can see, the truth table indicates the value of each basic operations according to the values of $x$ and $y$.

<table class="table">
    <tr><td>@x@</td>
        <td>@y@</td>
        <td>@x \vee y@</td>
		<td>@x \wedge y@</td>
		<td>@x \Rightarrow y@</td>
		<td>@\neg y@</td></tr>
	<tr><td>@0@</td>
        <td>@0@</td>
        <td>@0@</td>
		<td>@0@</td>
		<td>@1@</td>
		<td>@1@</td></tr>
	<tr><td>@0@</td>
        <td>@1@</td>
        <td>@1@</td>
		<td>@0@</td>
		<td>@1@</td>
		<td>@0@</td></tr>
	<tr><td>@1@</td>
        <td>@0@</td>
        <td>@1@</td>
		<td>@0@</td>
		<td>@0@</td></tr>
	<tr><td>@1@</td>
        <td>@1@</td>
        <td>@1@</td>
		<td>@1@</td>
		<td>@1@</td></tr>
</table>

### Propositional calculus

$X=\{x_1, \cdots, x_n\}$ is an infinite set of propositional variable.
The set of formulas $\mathcal{F}$ is inductively defined:
* Any propositional variable is a formula
* $\perp$ is a formula
* If $F$ is a formula, then $\neg F$ too
* If $F$ and $G$ are formulas, then $F \wedge G$, $F \vee G$ and $F \Rightarrow G$ are also formulas

Remark: Notice that $F \Leftrightarrow G$ has the same signification than ($F \Rightarrow G$) $\wedge$ ($G \Rightarrow F$).

Abusively, an interpretation $I$ is a function which gives the value of a formula.
Furthermore, interpretations have some interesting rules:
* $I(\perp)=0$
* If $F$ is a formula, then $I(\neg F)=\neg I(F)$
* If $F$ and $G$ are formulas, then $I(F \wedge G)=I(F) \wedge I(G)$
* If $F$ and $G$ are formulas, then $I(F \vee G)=I(F) \vee I(G)$
* If $F$ and $G$ are formulas, then $I(F \Rightarrow G)=I(F) \Rightarrow I(G)$

> To be precise, the objective of interpretation is to give meaning to the formal language we've previously defined (the propositional variable and the basic operations also named logical connective). 

Here are some vocabulary or other rules :

* If $I(F)=1$ then $F$ is satisfied by $I$ (``I satisfait F``), represented by $I \models F$
* $\Sigma$ a set a formulas, if $\forall F \in \Sigma$, $I(F)=1$ then $\Sigma$ is satisfied by $I$, represented by $I \models \Sigma$
* If $\forall$ interpretation $I$, $I(F)=1$ then $F$ is a tautology (``F est une tautologie``)
* Likewise, if $\forall$ interpretation $I$, $I(F)=0$ then $F$ is a contradiction (``F est une contradiction``)
* $\Sigma$ semantically satisfies $F$ (``Sigma déduit sémantiquement F``), if $\forall$ interpretation $I$ satisfying $\Sigma$, $I$ also satisfies $F$
* $F$ and $G$ are semantically equivalent (``F et G sont semantiquement équivalents``), represented by $F \equiv G$, if $\{F\} \models G$ and $\{G\} \models F$
* $\Sigma \models F \Rightarrow G$ if and only if $\Sigma,F \models G$
* $\Sigma \models F$ if and only if $\Sigma, \neg F$ is a contradiction

[Exercise: semantic proof](exercise_semantic.md)

... (FNC, Resolution) later

<hr class="sr">

## Natural deduction

Your goal is to demonstrate that something is
true. You will start from the conclusion=what you
think is true and using Sequent calculus / ``Séquents prouvables``,
you will aim to split your conclusion into axioms / ``axiomes``
(=something always true).

We are defining F, G, H as propositions and $\Gamma$ 
a set of propositions. We will use the notation

@\frac{Assumptions}{Conclusion}@

Everything at the left of $\vdash$ is true, 
at first, you got nothing here, and your expression
at the right of $\vdash$
but your goal will be to move as many propositions
as possible inside Gamma using the sequent calculus
then when you can, you need to try to get axioms
(the sequent ax) for each expression with a $\vdash$.

<table class="table">
    <tr>
        <td>@\frac{}{\Gamma, F \vdash F} (ax)@</td>
        <td>@\frac{\Gamma, F \vdash F}{\Gamma, G \vdash F} (aff)@</td>
        <td>@\frac{\Gamma, F \vdash G}{\Gamma \vdash F \Rightarrow G} (\Rightarrow_i)@</td>    </tr>
    <tr>
        <td>@\frac{\Gamma \vdash F \Rightarrow G \quad \Gamma \vdash F}{\Gamma \vdash G} (\Rightarrow_e)@</td>
        <td>@\frac{\Gamma \vdash F \quad \Gamma \vdash G}{\Gamma \vdash F \wedge G} (\wedge_i)@</td>
        <td>@\frac{\Gamma \vdash F \wedge G}{\Gamma \vdash F} (\wedge_e^l)@</td>
    </tr>
    <tr>
        <td>@\frac{\Gamma \vdash F \wedge G}{\Gamma \vdash G} (\wedge_e^r)@</td>
        <td>@\frac{\Gamma \vdash F}{\Gamma \vdash F \vee G} (\vee_i^l)@</td>
        <td>@\frac{\Gamma \vdash G}{\Gamma \vdash F \vee G} (\vee_i^r)@</td>
    </tr>
    <tr>
        <td>@\frac{\Gamma \vdash F \vee G \quad \Gamma, F \vdash H \quad \Gamma, G \vdash H}{\Gamma \vdash H} (\vee_e)@</td>
        <td>@\frac{\Gamma, F \vdash \perp}{\Gamma \vdash \neg F} (\neg_i)@</td>
        <td>@\frac{\Gamma \vdash \neg F \quad \Gamma \vdash F}{\Gamma \vdash \perp} (\neg_e)@</td>
    </tr>
    <tr>
        <td>@\frac{\Gamma, \neg F \vdash \perp}{\Gamma \vdash F} (\perp_c)@</td>
    </tr>
</table>

You must write the letters at the right of a sequent each time you are using it. 
Just so you know

* ``i`` means introduction (of a new variable)
* ``e`` means Elimination (of a variable)
* ``l`` means left
* ``r`` means right

<hr class="sl">

## First-order logic

...

<hr class="sr">


## Sources

This is a list of all Wikipedia pages that you may
want to check
* https://en.wikipedia.org/wiki/Mathematical_logic
* https://en.wikipedia.org/wiki/Structural_induction
* https://en.wikipedia.org/wiki/Mathematical_induction
* https://en.wikipedia.org/wiki/Truth_table
* https://en.wikipedia.org/wiki/Semantics_of_logic
* https://en.wikipedia.org/wiki/Well-formed_formula
* https://en.wikipedia.org/wiki/Interpretation_(logic)

Other stuff
* https://en.wikipedia.org/wiki/Four_color_theorem
