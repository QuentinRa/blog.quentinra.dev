# Conjunctive normal form (FNC)

* A **literal** is a propositional variable or its negation
    * $p, \neg q$ are literals
    * $\neg \neg p, p \vee p$ are not literals
* A **clause** is a disjunction of literals
    * $p, \neg p, p \vee \neg q$ are clauses
    * $\neg(p \vee q), p \wedge q, (\neg \neg p) \vee q$ are not clauses
* A **conjunctive normal form** is a conjunction of clauses
    * $p, \neg p, p \vee \neg q, \neg p \wedge q, (p \vee q) \wedge r \wedge (p \vee r)$ are FNC
    * $\neg (p \wedge q), (\neg \neg p) \wedge q$ are not FNC

You can write any formula in FNC.
> But be careful. You have, in order, to: 
> * remove all $\bot$ using for example the equivalent $p \wedge \neg p$
> * replace all implications with its equivalent.
> * place directly all negations in variables using the equivalents: 
>   * $\neg \neg F \equiv F$
>   * $\neg (F\wedge G) \equiv \neg F \vee \neg G$
>   * $\neg (F\vee G) \equiv \neg F \wedge \neg G$
> * place all conjunction in first using the equivalent $F \vee (G \wedge H) \equiv (F \vee G) \wedge (F \vee H)$

There is also DNF which stands for disjunctive normal form: instead of putting the conjunction in first, you place the disjunctions. So a DNF is a disjunction of conjunction of literals. Yet, DNF is not much employed.
