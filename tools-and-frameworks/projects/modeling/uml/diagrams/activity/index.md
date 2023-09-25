# Activity Diagram

<div class="row row-cols-md-2"><div>

Activity diagrams <small>(UML)</small> are often confused with Flowchart diagrams <small>(not UML nor specific to programming)</small> as they are similar 🗺️.

It represents every **state** 📍 of the program and how we **transit** ✈️ from one state to another.

For instance, in a game menu, we may have some states such as:

* MainMenu
* Load Game
* Select Character
* QuitGame

The transitions are the option we select to navigate between them.
</div><div>

![Activity Diagram Example](_uml/example.svg)
</div></div>

<hr class="sep-both">

## States

<div class="row row-cols-md-2"><div>

A state is literally a state of the program. There are 3 kinds of states:

* ⚽ Initial States
* 🧑 Intermediary States
* 🥅 Final States

When a program is starting, we are moving from one of the initial states to one of its linked intermediary states. We are moving between intermediary states until we reach a final state.

<div class="row"><div class="col-md-3">

![Basic Diagram](_uml/basic.svg)
</div><div class="col-md-9 align-self-center">

The initial state is represented as a solid black circle filled with black. The final state is represented as an empty black circle with a solid black circle filled with black inside.
</div></div>
</div><div>

Each state may contain some methods:

* `entry/action`: where `action` is executed when entering this state
* `exit/action` where `action` is executed when exiting this state

<div class="text-center">

![Entry-Exit for States](_uml/entry_exit.svg)
</div>
</div></div>

<hr class="sep-both">

## Transitions

<div class="row row-cols-md-2"><div>

Transitions are the arrows linking a state with another. On each, you may add one of these:

* A trigger/event that we are waiting for

![Transitions Trigger](_uml/transitions.svg)

* An action that we are triggering and waiting for its end

![Transitions Action](_uml/transitions_001.svg)

* A condition such as `[money > 10€]`

![Transitions Condition](_uml/transitions_002.svg)
</div><div>

#### Branching

Both syntaxes are used to use represent a branching. You can have as many branches and conditions as you want.

![UML If Syntax 1](_uml/if.svg)
![UML If Syntax 2](_uml/if_001.svg)

The most fitting condition if the one that will be used. You may add a note to ensure there is no doubt about it. A better approach is to only use `True` and `False` and chain them.

<br>

#### Synchronization bar

The synchronization bar is used when we want to do parallelism. The first indicates that the states below are executed in parallel (`fork`) and the second one indicate that we wait for all forks to terminate (`join`).

![Fork](_uml/fork.svg)
</div></div>