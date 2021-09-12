# Product backlog

[Go back](../index.md#1-sprint-planning)

The **Product backlog**, is a sort of project specification (`cahier des charges`). This is a list of tasks. You must add the features (~=**user stories**) that the client requested.

* Usually, they are **prioritized** (MoSCoW)
* Usually, they are sorted by **importance** (most important to less important)
* Usually, you must add the dependencies between tasks

⚠️this page is long and complex. You may skip the two optional parts.

> **Note**: The entries of the product backlog are also called **items**.<br>
> **Note**: Sometimes, the backlog may become too big, so you may remove the less important tasks, and label them as **"out of scope"** (such as the Could/Would, or tasks that do not impact the sprint goal if they are removed).<br>
> **Note**: reviewing the backlog is sometimes called backlog **grooming** (or refinement)

<hr class="sl">

## Product roadmap (optional)

This is a long-term vision of the product. The product owner is giving the goals and the results we are expecting, rather than the the timeline/functionalities. This is something explaining **what** you are planning to do.

* you might set the current goals
* you might set the near-term goals
* you might set the long-term goals

Each of them are a list, ordered by decreasing priority.

Even in Agile projects, **having a long-term vision is very important**, and **this is a myth that you should only have a near-term vision**. This will help to make near-term decision that do not go against the overall vision of the project.

<hr class="sr">

## Product requirements documents - PRD (optional)

They were used a lot in the Waterfall model, but now they are starting to be used in Agile projects. These are requirements that the Product Owner write with the team, and that the client agreed upon. This is mainly used as a strong confirmation of what you have to do

* goals, objectives, strategy
* features (user stories)
* behavior (user design, interactions, )

You will find a lot of **templates** and the Web. We usually have **the name of every person involved**, the **goals**, **why you added this requirement**, the **mockups** (`maquettes`), **the topics the team must thing about** (Question/Outcome), and **what they shouldn't work on**.

<hr class="sl">

## User Stories and Epics

An **Epic** is a group of **(user) stories** that are "similar" <small>(ex: all stories related to the user management)</small>. A User story is text describing a task (~= requirement) from the point of view of a user. You got stories about

* **features** (functional)
* **bugs** (technical)
* **tests** (technical)
* **technical debt** (technical): this is what you have to do before starting to improve the code (refactor/create constants/normalize things/...)
* **actions** (technical): changing your way of doing things (=from a retrospective)

A user story is supposed to provide content about the task, so that you are "working with" the one that actually need it. We must know the **reason**, the **goal**, the **value**, and an **estimation** of the cost/value for the person needing this task to be done.

The usual template is `"As a <type of user>, I <want to do something/goal>, so that <a reason/benefit>."`.

> **TIP**: give colors according to the kind of stories. Or, you may give colors to epics and symbols to stories. <br>
> **Note**: You can see an epic as the result of a succession of stories, and a bunch of epics are making an initiative (omitted).

<hr class="sr">

## Priority

You must filter the tasks by priorities, most likely using the **MoSCoW** notation.

* **M**: Must have this
* **S**: Should have this
* **C**: Could have this
* **W**: Would have this

You may ask the client about the priority and/or deduct it by yourself, since some tasks that the client wants may be too hard/useless if done in the first increment. You must take into account **the value for the client**.

<hr class="sl">

## Estimation

You need to evaluate how much **complex** a task his (or how much **efforts** it will require). We are not evaluating the duration like in non-agile projects. 

* You may **compare the task** and sort them by difficulty.
* You can give a value among a fixed list (`0, 1/2, 1, 2, 3, 5, 8, 13, 20, 40, 100, ?, inf.`) to each task. The average/median value may be used as an answer.

If you got outliers (`valeurs abérantes`) such as (almost) everyone gave "10", one gave "5", and one gave "20", then it would be a good idea to ask them **why** they gave this value (maybe they got trough of someone other didn't).

* The [T-Shirt Size Estimation](https://explainagile.com/blog/t-shirt-size-estimation/)

> You should learn from your previous estimates. You may pick a previous task and use it as a reference.

<hr class="sr">

## The backlog itself

You may create a table, in which each row is a story. You may group them by epics if you want. As for the columns, here are some ideas

* \# or ID: ID of the story
* Title or Title+Description: the story
* The priority
* The importance, estimated with
  * An estimation of the complexity
  * An estimation of the value for the client
* Some notes
* The Sprint: when did you completed this story (empty if you didn't)
* The Epic: if this story belong to an epic
* The dependencies