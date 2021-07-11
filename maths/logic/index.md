# First-order logic

In this course, ...

...

<hr class="sr">

## Introduction

...

## Natural deduction

### ??? ("séquents prouvables" in French)

let F, G, H some propositions, \(\Gamma\) a set of propositions . 
<p>
	\( \frac{}{\Gamma, F \vdash F} (ax) \) <br/>
	\( \frac{\Gamma, F \vdash F}{\Gamma, G \vdash F} (aff) \) <br/>
	\( \frac{\Gamma, F \vdash G}{\Gamma \vdash F \Rightarrow G} (\Rightarrow_i)  \) <br/>
	\( \frac{\Gamma \vdash F \Rightarrow G \quad \Gamma \vdash F}{\Gamma \vdash G} (\Rightarrow_e)  \) <br/>
	\( \frac{\Gamma \vdash F \quad \Gamma \vdash G}{\Gamma \vdash F \wedge G} (\wedge_i)  \) <br/>
	\( \frac{\Gamma \vdash F \wedge G}{\Gamma \vdash F} (\wedge_e^l)  \) <br/>
	\( \frac{\Gamma \vdash F \wedge G}{\Gamma \vdash G} (\wedge_e^r) \) <br/>
	\( \frac{\Gamma \vdash F}{\Gamma \vdash F \vee G} (\vee_i^l)  \) <br/>
	\( \frac{\Gamma \vdash G}{\Gamma \vdash F \vee G} (\vee_i^r)  \) <br/>
	\( \frac{\Gamma \vdash F \vee G \quad \Gamma, F \vdash H \quad \Gamma, G \vdash H}{\Gamma \vdash H} (\vee_e)  \) <br/>
	\( \frac{\Gamma, F \vdash \perp}{\Gamma \vdash \neg F} (\neg_i)  \) <br/>
	\( \frac{\Gamma \vdash \neg F \quad \Gamma \vdash F}{\Gamma \vdash \perp} (\neg_e)  \) <br/>
	\( \frac{\Gamma, \neg F \vdash \perp}{\Gamma \vdash F} (\perp_c)  \)
</p>

#### How to read that ?

<p>
	\( \frac{Assumptions}{Conclusion} \) <br/>
	<!-- \( Hypothesis  \vdash ??? \) <br/> -->
	\( _i, _e \) : Introduction, Elimination (of the symbol) <br/>
	\( ^l, ^r \) : Left, Right <br/>
</p>