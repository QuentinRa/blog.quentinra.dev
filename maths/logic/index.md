# First-order logic

...

<hr class="sr">

## Introduction

...

<hr class="sr">

## Natural deduction

Your go is to demonstrate that something is
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