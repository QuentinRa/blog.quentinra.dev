# Product Owner

[Go back](../index.md#whats-scrum)

The **Product Owner** is the only one talking to the client. He will redact a product backlog, which is almost like a specification (`cahier des charges`). He will lead the demonstration, and overview that the developers are correctly doing what the client wanted.

<hr class="sl">

## Product Backlog

This is a list of what the client wants. Some are representing it as a list, but a table is the best way.

<table class="table table-striped table-bordered border-dark">
<thead>
<tr><th>ID</th><th>Task</th><th>Priority</th><th>Which sprint?</th></tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>Make the Home page</td>
<td>M</td>
<td></td>
</tr>
</tbody>
</table>

Some notes

<details class="details-e">
<summary>Priority</summary>

You must filter the tasks by priorities, most likely using the **MoSCoW** notation.

* **M**: Must have this
* **S**: Should have this
* **C**: Could have this
* **W**: Would have this

You may ask the client about the priority and/or deduct it by yourself, since some tasks that the client wants may be too hard/useless if done in the first increment. You must take into account **the value for the client** and **how much it will cost** (time, persons, etc.).
</details>

<details class="details-e">
<summary>Which sprint?</summary>

You may add the sprint in which this functionality was added. This is like a checklist with added/not yet. But, by adding the sprint, you are telling "when", so that's better than a boolean.
</details>

<hr class="sl">

## Using User Stories (XP)

Some are using user stories to describe functionalities/tasks. This is something quite similar to another extreme programming method called **Behavior-driven development** (BDD). You are completing a small template (up to you) for each functionality such as this one

* As a <Kind of user/Role>,
* I want <To do something> <small>(goal)</small>,
* So that <Get something/benefit> <small>(benefit)</small>.

You got **technical user stories** too, such as writing tests. **Be careful**, the user story should always explain **why** we did an action (benefit). For instance, "log in" isn't a user story, but "log in to access his profile (=goal) because he want to see his profile page (benefit)" is a user story.