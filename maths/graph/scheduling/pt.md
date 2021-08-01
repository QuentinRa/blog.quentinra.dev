# Metra potential method

[Go back](..#scheduling-problem)

The Metra potential method (`méthode potentiel-tâche`)
is what I think is the English name
of the `méthode potentiel-tâche`.

* first create a graph of all of your tasks
* the tasks are linked with edges having a weight which
is the duration of the task
* We are usually starting at a node called START, ending at node called END

The task (nodes) will have properties

* early start time
* last start time
* free margin (optional)
* total margin (optional)

**Note**: You may have some cases of **redundancy** like
C is dependant on A, and D is dependant on C and A. You must
remove $A \to D$ because we got by transitivity
since we have $A \to C \to D$.