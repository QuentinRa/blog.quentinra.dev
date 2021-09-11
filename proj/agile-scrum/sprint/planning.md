# Sprint Planning

[Go back](../index.md#whats-scrum)

The main goal of the **Sprint Planning** is to decide your **Sprint goal**. Your **Sprint goal** is what you want to make at the end of the sprint (=**iteration**). The result of your sprint is usually called **increment**.

Usually, a sprint lasts **2 to 4 weeks**. Once you picked a duration, you shouldn't change it (unless you got a good reason).

<hr class="sl">

## Sprint backlog

You had a lot of functionalities in the **Product backlog**, and in the **Sprint backlog**, you must pick the functionalities that you will do in this sprint, according to your sprint goal. The **product owner** will propose some tasks. Then, you need to **split each functionality in a list of small tasks** (taking a few hours, up to one day).

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

<details class="details-e">
<summary>This is usually a board like this:</summary>

![Source: scrum.org](images/SprintBacklog.png)

We will have three columns

* **Todo**: what have to be done
* **In-progress**: working on it
* **Done**: done

Your goal is to move all of your cards in **Done**. You should add on each card the person that will do each task. 
</details>

**You may do it online**, and if you do, we are mainly using one of these tools (all free)

* [Trello](https://trello.com/)
* [GitHub](https://github.com/features/project-management)
* [YouTrack (JetBrains)](https://www.jetbrains.com/youtrack/)

<hr class="sl">

## Scrum release planning

A **release plan** is summarizing a lot of information about a sprint, so you may use one too. This is also providing information for every sprint, the **roadmap** of your project.

* duration of a sprint
* deadlines
* budget
* sprint goal
* what's the definition of done (tests? doc? etc.)