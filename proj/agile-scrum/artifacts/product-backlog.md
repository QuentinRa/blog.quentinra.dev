# Product backlog

[Go back](../index.md#1-sprint-planning)

The **Product backlog**, is a sort of project specification (`cahier des charges`). This is a list of tasks. You must add the features (~=**user stories**) that the client requested.

* Usually, they are **prioritized** (MoSCoW)
* Usually, they are sorted by **importance** (most important to less important)
* Usually, you must add the dependencies between tasks

> **Note**: The entries of the product backlog are also called **items**.<br>
> **Note**: Sometimes, the backlog may become too big, so you may remove the less important tasks, and label them as **"out of scope"** (such as the Could/Would, or tasks that do not impact the sprint goal if they are removed).<br>
> **Note**: reviewing the backlog is sometimes called backlog **grooming** (or refinement) <br>
> **Note**: Usually, the Product Owner and the Scrum Master are preparing the Product backlog **before** the meeting.

<hr class="sl">

## User Stories and Epics

An **Epic** is a group of **(user) stories** that are "similar" <small>(ex: all stories related to the user management)</small>. A User Story is a text describing a task from the point of view of a user. You got stories about

* **features** (functional)
* **bugs** (technical)
* **tests** (technical)
* **technical debt** (technical): this is what you have to do before starting to improve the code (refactor/create constants/normalize things/...)
* **actions** (technical): changing your way of doing things (=from a retrospective)

A user story is supposed to provide content about the task, so that you are "working with" the one that actually needs it. We must know the **reason**, the **goal**, the **value**, and an **estimation** of the cost/value for the person needing this task to be done.

The usual template is `"As a <type of user>, I <want to do something/goal>, so that <a reason/benefit>."`.

> **Note**: to add a technical story, you need to explain and persuade the product owner that this will help<br>
> **Note**: you will usually deliver the stories when the epic is done.<br>
> **Tip**: give colors to your stories according to their kind (ie: feature, bugs, etc.). <br>
> **Note**: You can see an epic as the result of a succession of stories, and a group of epics is making an initiative (omitted).

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

You need to evaluate how much **complex** a task is (or how much **effort** it will require). We are not evaluating the duration like in non-agile projects. 

* You may **compare tasks** and sort them by difficulty.
* You can give a value among a fixed list (`0, 1/2, 1, 2, 3, 5, 8, 13, 20, 40, 100, ?, inf.`) to each task. The average/median value may be used as an answer.

If you got outliers (`valeurs abérantes`) such as (almost) everyone gave "10", one gave "5", and one gave "20", then it would be a good idea to ask them **why** they gave this value (maybe they thought of something others didn't).

* The [T-Shirt Size Estimation](https://explainagile.com/blog/t-shirt-size-estimation/)

> You should learn from your previous estimates. You may pick a previous task and use it as a reference.

<hr class="sr">

## The backlog itself

You may create a table, in which each row is a story. You may group them by epics if you want. As for the columns, here are some ideas

* \# or **ID**: ID of the story
* **Title** or Title+**Description**: the story
* The **priority**
* The **importance**, estimated with
  * An estimation of the **complexity**
  * An estimation of the **value for the client**
* Some **notes**
* **The Sprint**: the one in which you completed this story (empty if you didn't)
* **The Epic**: if this story belongs to an epic
* The dependencies
* How will the Product Owner (or ...) test that the feature is working (**acceptance tests**)