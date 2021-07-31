# Terminology

[Go back](..#scheduling-problem)

**Note 31/07/2021** - I didn't manage to found the english keywords
so the translations may not be accurate.

We are considering

* start_min = the earlier date for starting a task
* start_max = the latest date for starting a task

<table class="table table-bordered table-striped table-dark">
<tr><th>optimal cost/duration</th></tr>
<tr><td>

Also called ``durée optimale``/`coût optimal`, this
is a least number of day the project will last.
</td></tr></table>

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