# Replacement & Equivalences

## Replacement

In semantic proofs, you have the right to replace a propositional variable with any formula. More precisely :

* $p[p:=G]=G$
* $q[p:=G]=G$ with $p \neq q$
* $(F_1\diamond F_2[p:=G])=(F_1[p:=G])\diamond (F_2[p:=G])$ with $\diamond \in \{\wedge, \vee, \Rightarrow\}$
* $(\neg F)[p:=G]=\neg(F[p:=G])$
  
From there, you have some additionnal rules (including all the equivalences presented in the bottom) :

* If $\models F$ then $\models F[p:=G]$
* If $F\equiv F'$ then $F[p:=G] \equiv F'[p:=G]$
* If $G\equiv G'$ then $F[p:=G] \equiv F[p:=G']$

<hr class="sl">

## Equivalences

<table class="table table-bordered table-striped border-dark table-dark">
    <tr>
        <td>@F \wedge F \equiv F@</td>
        <td>@F \vee F \equiv F@</td>    </tr>
    <tr>
        <td>@F \wedge G \equiv G \wedge F@</td>
        <td>@F \vee G \equiv G \vee F@</td>    </tr>
    <tr>
        <td>@F \wedge (G \wedge H) \equiv (F \wedge G) \wedge H@</td>
        <td>@F \vee (G \vee H) \equiv (F \vee G) \vee H@</td>    </tr>
    <tr>
        <td>@F \wedge (G \vee H) \equiv (F \wedge G) \vee (F \wedge H)@</td>
        <td>@F \vee (G \wedge H) \equiv (F \vee G) \wedge (F \vee H)@</td>    </tr>
    <tr>
        <td>@\neg (F \wedge G) \equiv \neg F \vee \neg G@</td>
        <td>@\neg (F \vee G) \equiv \neg F \wedge \neg G@</td>    </tr>    
    <tr>
        <td>@F \Rightarrow G \equiv \neg F \vee G@</td>
        <td>@\neg (F \Rightarrow G) \equiv F \wedge \neg G@</td>    </tr>
    <tr>
        <td>@\bot \wedge F \equiv \bot@</td>
        <td>@\bot \vee F \equiv F@</td>    </tr>
    <tr>
        <td>@\neg \neg F \equiv F@</td>    </tr>
</table>
