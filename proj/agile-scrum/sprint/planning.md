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

<hr class="sl">

<details class="details-e">
<summary>Splitting a task</summary>

The functionality is to show the main page of a desktop application

* make the frame without any content (close, minimize, etc.)
* make the toolbar
* write the code to display the content of the main page
* deal with the translations
* make the app responsive (your app is adapting itself to the size of the screen)
* ...
</details>

<details class="details-e">
<summary>You need to evaluate how much time they will take, this is called <b>grooming</b>.</summary>

You may ask everyone to write on a paper **how much complicated** they think a task is. This is easier than giving a duration, as they are comparing tasks. The average/median value may be used as an answer.

If you got outliers (`valeurs abérantes`) such as (almost) everyone gave "10", one gave "5", and one gave "20", then it would be a good idea to ask them **why** they gave this value (maybe they got trough of someone other didn't).

Usually, the list of values is fixed, and it looks like this: `0, 1/2, 1, 2, 3, 5, 8, 13, 20, 40, 100, ?, inf.`. You may also use the previous sprint as a reference.

> You should use this to calculate the **velocity**
> 
> * to know how much your team can do (=sum of the complexity of each task)
> * to know how much a person can do (=sum of the complexity of someone's tasks)
</details>

<hr class="sl">

## Scrum release planning

A **release plan** is summarizing a lot of information about a sprint, so you may use one too. This is also providing information for every sprint, the **roadmap** of your project.

* duration of a sprint
* deadlines
* budget
* sprint goal
* what's the definition of done (tests? doc? etc.)