# Flow chart diagram

[Go back](../index.md)

This is a diagram representing all the states of the program and the conditions/triggers allowing the program to move from one state to another.

<hr class="sr">

## States

When the program is starting, we are moving from one of the initial states to another state. Then we are moving from one state to another until one of the final states.

![begin-end](images/u-HqA2v9B2efpStXukBarD3ILD3LjLDG0WgMf2e1HQ0ii2XG5gJ88JKl1QWU0000.png)

Inside "State", you could add attributes like

* ``entry/action`` where ``action`` is executed when entering this state
* ``exit/action`` where ``action`` is executed when exiting this state

![states](images/SoWkIImgAStDuUAArefLqDMrKmWkIIn9DUI2K60He0oCQwMGcbTILAcVcPTPufIVM9I2956HMQAVabfSKfHV2P7YSaZDIm6P3G00.png)

<hr class="sl">

## Transitions

Transitions are the arrows linking a state with another. You may add on the arrow,

* a trigger name (=event)

![trigger](images/trans1.png)

* a condition

![condition](images/trans2.png)

* an action (executed when moving)

![action](images/trans3.png)

<hr class="sr">

## Conditional branching

This is how you can do conditional branching.

![branching](images/JOqn3e0W34NdSegcavfu1O9dS2GE99P8WWnGxczXSljzVVaVm3K9LVgR3S2ohRZl5kaSZ8oY594E56v2A0yNHQ2Abzhvcg8mgZHkqYVdnjEnFWRDVsU2APKxnT7kDEdq1m00.png)

You could write a condition instead of true/false. And, you can have more than 2 states branched by using that. The automaton will always take the most fitting condition like

* let x = 5
* cond1: x < 5
* cond2: x > 0
* cond3: x == 5
* then the branch we will take is the one having the condition cond3

Since not anyone may follow this rule, you may add a note saying how your automaton is picking a branch.

<hr class="sr">

## Synchro bar

A synchro bar may be used if you want to both run State1 and State2 at the same time.

![synchro bar](images/u-HqA2v9B2efpStXukBarD3ILD3LjLEmjRLrCWGIG24GLocu9B4aLS5G2SY7IIaWIHWfWJGxfEQb0Cq10000.png)