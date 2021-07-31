# Terminology

[Go back](..#scheduling-problem)

<table class="table table-bordered table-striped table-dark">
<tr><th>optimal cost/duration</th></tr>
<tr><td>

Also called ``durée optimale``/`coût optimal`, this
is a least number of day the project will last. This is the
last task (usually called END)
early start time.
</td></tr></table>

<table class="table table-bordered table-striped table-dark">
<tr><td style="min-width: 150px;">early start time</td><td>

In French it's called ``date au plus tôt``. For the first
task this is 0 (since we do not had a task before) but for
the following tasks, it's the maximum
of the successors early start + the successors cost.
</td></tr>
<tr><td>last start time</td><td>

In French it's called ``date au plus tard``. We are starting
from the end, and the last start value is the same as
the early start value. For the predecessors, this
is the minimum of the early start date minus the cost.
</td></tr>
</table>

<table class="table table-bordered table-striped table-dark">
<tr><th colspan="2">margin</th></tr>
<tr><td>total</td><td>

Also called ``marge totale``. This is the maximum
delay that we can take for a task without
affecting the optimal cost.

**Operation**: start_max - start_min
</td></tr>
<tr><td>free</td><td>

Also called ``marge libre``. Same as the total margin
but without changing the next task starting date.

**Operation**: for each vertex, we are increasing the
starting date while starting_date+cost is inferior
to the start_min of the next tasks.
</td></tr>
<tr><td>certain</td><td>

Also called ``marge certaine``. Same as the free margin
but considering that every tasks started with the maximum
delay.

**Operation**: $a$ is the certain margin value of
the task $i$ if for all predecessors $p$ of $i$,
$\text{start_max}\_i - 
(\text{start_max}\_p + cost\_p) \ge a \gt 0$
</td></tr>
</table>

Instead of margin, you can use

* optimistic time estimate instead of total margin
* normal time estimate instead of free margin
* pessimistic time estimate instead of certain margin

<hr class="sr">

## Example

![](images/terminology.svg)

The **early start time** for C is

<div>
\[
\text{early start for C} 
= \max \sum_\text{i predecessor of C} \text{early_start}_i + cost(i \to C)
\]
</div>

If you got a task C that can only be
done after the task A and the tasks B, then simply check
what's the task that you will have to wait for (=maximum),
and the "wait value" is the "cost=duration + the start".

The **last start time** for C, it's the same
as the early start time because C seems to be the last task.

The **last start time** for A, it's 

<div>
\[
\text{last start for A} 
= \min \sum_\text{i successor of A}
\text{last_start}_i - cost(A \to i)
= min( 30 - 30 ) = 0 
\]
</div>

The **last start time** for B, it's

<div>
\[
\text{last start for B} 
= \min \sum_\text{i successor of B}
\text{last_start}_i - cost(B \to i)
= min( 30 - 20 ) = 10 
\]
</div>

The **optimal cost/duration** is simply the last
task early start + cost. Since we don't have
a cost for C, we can assume that the optimal duration
is $30$. C task's name should have been END.