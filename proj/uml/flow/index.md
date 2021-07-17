# Flow chart diagram

[Go back](../index.md)

Also called

* automate
*``diagramme d’activités`` / ``diagramme d’état-transitions``, 
* state diagram

It's representing all the states of the program and
the condition allowing the program to move from one
state to another.

<hr class="sr">

## States

We got 3 kind of states

* initial state(s)
* intermediary state(s)
* and final state(s)

Here an example with all of them

![](images/u-HqA2v9B2efpStXukBarD3ILD3LjLDG0WgMf2e1HQ0ii2XG5gJ88JKl1QWU0000.png)

When the program is starting, we are moving from one of the
initial states to another state. Then we are moving
from one state to another until one of the final states.

Inside "State", you could add attributes like

* ``entry/action`` where action is executed when entering
  this state
* ``exit/action`` where action is executed when exiting
  this state

![](images/SoWkIImgAStDuUAArefLqDMrKmWkIIn9DUI2K60He0oCQwMGcbTILAcVcPTPufIVM9I2956HMQAVabfSKfHV2P7YSaZDIm6P3G00.png)

<hr class="sl">

## Transitions

The transitions are the arrows linking a state to another. You
may add on the arrow

* a trigger name (like what triggered us moving from one state to another)

![](images/trans1.png)

* a condition (same as a trigger but a condition)

![](images/trans2.png)

* an action (executed when moving)

![](images/trans3.png)

<hr class="sr">

## Conditional branching

This is how you can do a conditional branching.

![](images/JOqn3e0W34NdSegcavfu1O9dS2GE99P8WWnGxczXSljzVVaVm3K9LVgR3S2ohRZl5kaSZ8oY594E56v2A0yNHQ2Abzhvcg8mgZHkqYVdnjEnFWRDVsU2APKxnT7kDEdq1m00.png)

Note that instead of using
"A test" and true/false, you could use the same symbol but
writing a condition instead of true/false. You could have
more than 2 state branched by using that, and the automate
will always take the most fitting condition like

* x = 5
* cond1: x < 5
* cond2: x > 0
* cond3: x == 5
* then the branch we will take is the one 
  having the condition cond3

Since not anyone may follows this rule, you may add
a note saying how your automate is choosing.

<hr class="sr">

## Synchro bar

A synchro bar may be used if you want to both run
State1 and State2 at the same time.

![](images/u-HqA2v9B2efpStXukBarD3ILD3LjLEmjRLrCWGIG24GLocu9B4aLS5G2SY7IIaWIHWfWJGxfEQb0Cq10000.png)