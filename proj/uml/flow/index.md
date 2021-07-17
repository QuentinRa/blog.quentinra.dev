# Flow chart diagram

[Go back](../index.md)

Also called
automate or ``diagramme d’activités`` or
``diagramme d’état-transitions``, the flow chart diagram
is representing all the states of the program and
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



