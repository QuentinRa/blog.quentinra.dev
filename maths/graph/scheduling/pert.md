# P.E.R.T. method

[Go back](..#scheduling-problem)

In a pert diagram,

* we got nodes like 1, 2, 3, ... that are the states of our project (1 may not be before 2)
* they have properties
  * early start time
  * last start time
  * free margin (optional)
  * total margin (optional)
* we have a node START
* we have a node END

From one state of your project (START), you may do some tasks 
like A and B. In P.E.R.T., this is 2 states (2 and 3) and 
the edges (from $START \to 2$ and $START \to 3$)
will be associated

* the name of the task
* the cost of the task

But, if a task C is dependant on A and B, this
is like being dependant of state 2 and state 3. What we
do is adding a directed dotted line
$A \to B$ (or $B \to A$) with the duration $0$. Then
we start the edge with $C(cost)$ from $A$ (resp. $B$, up to the one
you picked).