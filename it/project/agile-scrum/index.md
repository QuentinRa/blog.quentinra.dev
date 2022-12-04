# Agile Scrum 🚀

<div class="row row-cols-md-2"><div>

Agile **Scrum** (`Mêlée au rugby`) is one of the most used **Agile methodologies** (`méthodes agiles`). This is a kind of incremental method ([wiki](https://en.wikipedia.org/wiki/Incremental_build_model)) that is repeating small cycles (**iterations**).

A long time ago, the **V-Model** (`Cycle en V`) model <small>(an extension of the Waterfall model)</small> was the most used methodology. But, it **wasn't flexible**, the client often had to **wait a long time**, and the product **may not have been what he wanted**, so a lot of companies are moving to Agile methodologies.
</div><div>

As this is an incremental method, you will add functionalities incrementally. When your iteration ended, the client will check what you did, and give you feedback, so that you know what to do in the next iteration.

Other Agile methodologies: XP (Extreme programming), Kanban.
 
The Agile manifesto (`Manifeste Agile`), signed in 2001, is defining the guidelines for Agile projects: [Agile Manifesto](https://agilemanifesto.org/)
</div></div>

<hr class="sep-both">

## 💪 Values and principles 💪

**Agile** is a **mindset** (`état d'esprit`) 🤓, and **Scrum** a framework (`cadre de travail`~=methodology) 🛠. You need to learn both 🚀.

<div class="row row-cols-md-2"><div>

Agile-Scrum is based on **3 pillars** (transparency, inspection, adaptation), and **5 values**

* **Courage**: face your problems, and do what must be done, **don't hide bugs under the carpet** (`pas de 🐛 sous le tapis`)
* **Focus**: concentrate on the sprint goal
* **Commitment**: be committed to your work
* **Respect**: be respectful to others
* **Openness**: be open to changes or evolutions
</div><div>

Agile methodologies are based on **12 principles** and **4 values** ([principles and values (FR)](https://manifesteagile.fr/index.html), [principles (EN)](https://agilemanifesto.org/principles.html) and [values (EN)](https://agilemanifesto.org/)). My summary is

* to do everything to make your client happy 😊
* allow changing the specifications  ✍️
* frequently deliver a working software 💻
* make sure that users and devs are working together 😏
* always strive to do better 🧐
* have a stable development speed 👌
* interact face-to-face 🗣️
</div></div>

<hr class="sep-both">

## Roles

Scrum is involving **3 roles** in a team

<div class="row row-cols-md-2"><div>

#### 👑 Product Owner (PO)

The client interacts with the **Product owner**. He must understand the business/market requirements, and organize the tasks so that the client gets what he/she wanted.

He will redact (and update) the **Product backlog**. He may not be the only one creating entries in the backlog, but others should ask him/her before, as he/she should know everything inside the backlog.

<br>

#### 🤵 Development team (Dev. team)

They are the people doing the work. This is usually a team of 3 to 9 persons, but some are adapting Scrum for bigger teams. **Notice** that is **Development**, **not Developers**. You can have **graphics/UX designers**, **sound engineers**, **artists**, or **testers**, along with the developers. Anyway, we are considering all of them as **developers** in the end, so you can use both.
</div><div>

#### 🌠 Scrum master (SM)

The **Scrum master** is **making sure that the developers** <small>(the product owner, and the company too)</small> **are only focusing on their job**, and not on applying Scrum. He should **organize (or sometimes facilitate) meetings**, **support the team**, **manage the tools**, do **reporting**, **deal with blockers**, and **"timeboxing"** <small>(a meeting shouldn't last more than it was supposed to)</small>  so that the project is going smoothly.

The Scrum Master is an expert in Scrum, and he/she must **ensure that Scrum is used properly**, but if the team agrees on changing something, he/she must be **open for changes** (as he/she follows the principles and values of Scrum).

<details class="details-e">
<summary>Random notes</summary>

(1) Do not ask the intern to grab some cakes, or some coffee, that's the Scrum master's job 🤩 <small>(joke aside, he/she may)</small>.

(2) The Scrum master may be a member of the dev team, and it may rotate through the team.

(3) The Scrum master is not a project manager/leader (`chef de projet`). The project manager is overseeing/controlling the project, while the Scrum master is actively working on improving the workflow of the project.
</details>
</div></div>

<hr class="sep-both">

## 📜 Scrum 📜

<div class="row row-cols-md-2"><div>

The development is made of iterations, a repetition of cycles, called **sprints** (=**iteration**). The result of your sprint is usually called **increment**. A sprint is made of **4 ceremonies** (`rituels`).

1. **Sprint Planning**: when starting a sprint
2. **Daily Scrum**: daily meeting
3. **Sprint review**: at the end, demonstration to the client
4. **Sprint retrospective**: usually at the end, look for improvements
</div><div>

Usually, a sprint lasts **2 to 4 weeks**. Once you picked a duration, you shouldn't change it (unless you got a good reason).

A sprint is considered as a project as a whole, so you have to write tests and the documentation during the sprint. You will do the same as you are doing for the project and add functionalities one after another until you reach your goal.
</div></div>

<hr class="sep-both">

## Sprint 0

<div class="row row-cols-md-2"><div>

This is the first sprint, but it's labeled as **Sprint 0**, because this is not a real sprint and this is before the first sprint. You will set up everything during this sprint, and create the workflow of the application. It means, you **have to**

* create the folders <small>(ex: sep-bothc, headers, etc.)</small>
* create files such as README.md, LICENSE, etc.
* write your guidelines/style guide/... <small>(if you got one)</small>
* pick your tools <small>(ex: git, trello, ...)</small>
* set up your tools <small>(ex: create repository, master/main?)</small>
* set up the rules <small>(ex: branches/...)</small>
* ...
</div><div>

And **write some code**, but only **the bare minimum** so that everyone can start their task without meddling with/stopping everyone else (ex: create the Main file, maybe create the data-related files, so that all of you know what data is manipulated, etc.).
</div></div>

<hr class="sep-both">

## 1. Sprint Planning

<div class="row row-cols-md-2"><div>

The main goal of the **Sprint Planning** is to decide your **Sprint goal**. Your **Sprint goal** is what you want to make at the end of the sprint.

</div><div>

* **Involves**: PO, SM, Dev. team
* **Duration**: up to 4 hours/4 weeks
</div></div>

The Product Owner is **proposing a goal**, and the **items** of the **product backlog** that you may do.  The dev team is picking items (=>value for the client, effort), explicitly defining when they are considered to be "done" (doc? tests?), in the **sprint backlog**. You need to have a clear idea of **what makes the sprint successful**, and how you will achieve the **sprint goal**. He/She will redact **two of Scrum's artifacts**:

<div class="row row-cols-md-2"><div>

#### 🪀️  Product backlog

The **Product backlog**, is a sort of project specification (`cahier des charges`). This is a list of tasks. You must add features that the client requested in a specific format, called **User Stories** or **US** for short.

<details class="details-e">
<summary>User Stories and Epics</summary>

A **User Story** (**US**) is a text describing a task from the point of view of a user. Ideally, we would only have user stories, but there are always some other stories (technical/...) that are popping up. An **Epic** is a group of **stories** <small>(mostly US)</small> that are "similar" <small>(ex: all stories related to the user management)</small>. You got stories about

* **features** (functional)
* **bugs** (technical)
* **tests** (technical)
* **technical debt** (technical): this is what you have to do before starting to improve the code <small>(refactor, use constants...)</small>
* **actions** (technical): changing your way of doing things <small>(=usually a reflection from a retrospective)</small>

In a user story, we must know the **reason**, the **goal**, the **value**, and an **estimation** of the cost/value for the person needing this task to be done. Ex:

Example (template): `"As a <type of user>, I <want to do something/goal>, so that <a reason/benefit>."`.

> **Note**: to add a technical story, you need to explain and persuade the product owner that this will help<br>
> 
> **Note**: you will usually deliver the stories when the epic is done.<br>
> 
> **Tip**: give colors to your stories according to their kind (ie: feature, bugs, etc.). <br>
> 
> **Note**: You can see an epic as the result of a succession of stories, and a group of epics is making what we call an **initiative**.

</details>

<details class="details-e">
<summary>Prioritizing using MoSCoW</summary>

You will most likely using the **MoSCoW** notation to prioritize US.

* **M**: Must have this US <small>(mandatory)</small>
* **S**: Should have this US <small>(expected)</small>
* **C**: Could have this US <small>(ideally)</small>
* **W**: Would have this US <small>(out of scope)</small>

You should ask the client about priorities and suggest priorities too, since some tasks may be too hard/useless if done in the first increment. You must take into account **the value for the client**.
</details>

<details class="details-e">
<summary>Estimation of the complexity</summary>

You need to evaluate how much **complex** a task is (or how much **effort** it will require). We are not evaluating the duration like in non-agile projects.

* You may **compare tasks** and sort them by difficulty.
* You can give a value among a fixed list (`0, 1/2, 1, 2, 3, 5, 8, 13, 20, 40, 100, ?, inf.`) to each task. The average/median value may be used as an answer.

If you got outliers (`valeurs abérantes`) such as (almost) everyone gave "10", one gave "5", and one gave "20", then it would be a good idea to ask them **why** they gave this value (maybe they thought of something others didn't).

> You should learn from your previous estimates. You may pick a previous task and use it as a reference.
</details>

<details class="details-e">
<summary>Example of Product Backlog as a table</summary>

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
* The **dependencies** between US/Epics
* **Acceptance tests**: how will the Product Owner <small>(or ...)</small> test that the feature is working
</details>

<details class="details-e">
<summary>Notes</summary>

* Entries of the product backlog are also called **items**.

* Sometimes, the backlog may become too big, so you may remove the less important tasks, and label them as **"out of scope"** <small>(such as Could/Would, or tasks that do not impact the sprint goal if they are removed)</small>

* Reviewing the backlog is sometimes called backlog **grooming** (or refinement)

* Usually, the Product Owner and the Scrum Master are preparing the Product backlog **before** the meeting.
</details>
</div><div>

#### 🏢  Sprint backlog

The **Sprint backlog** is a list of tasks that the **dev team** took from the product backlog. These are the **tasks that they are planning to do during the sprint**. Tasks are split into smaller tasks, each ideally taking a few hours and up to one day to be marked as "done".

Each developer is taking tasks according to their **capacity**. This is the sum of the **complexity** of tasks they picked in the previous sprint.

<details class="details-e">
<summary>Whiteboard</summary>

We are using the famous **whiteboard**, with the following columns

* **To-do** (`À faire`): what has to be done
* **In-progress** (`En cours`): working on it
* **Done** (`Terminé/Fini`): done

Your goal is to move all of your cards in **Done**. You should add on each card the person that will do the task.

![Source: scrum.org](_images/SprintBacklog.png)

You may have a few more columns before "Done"

* **Review** (`Revue/Relecture`): someone else is checking your task
* **Tests** (`Tests`): testing the feature
* **Documented** (`Documentation`): working on the documentation
* **Canceled/Blocked** (`Annulée`): you won't/can't continue a task
</details>

<details class="details-e">
<summary>Whiteboard (Online)</summary>

Here are some free tools

* [Trello](https://trello.com/) (Atlassian/Jira)
* [GitHub](https://github.com/features/project-management) (Microsoft)
* [YouTrack](https://www.jetbrains.com/youtrack/) (JetBrains)
</details>

<details class="details-e">
<summary>How to split tasks into smaller tasks?</summary>

Here is an example with the main page of a desktop application

* make the frame without any content <small>(close, minimize, etc.)</small>
* make the toolbar
* display the main content
* deal with the translations
* make the app responsive <small>(=adapting itself to the size of the screen)</small>
* ...
</details>
</div></div>

<hr class="sep-both">

## 2. Daily Scrum or standup/stand-up

<div class="row row-cols-md-2 mt-3"><div>

Check the **progress**. What each one did **yesterday**, what are they planning to do **today**. Identify **blockers** and **challenges**. The purpose is **informative**, a sort of coffee break 🍵 (`pause café`). If you don't drink coffee, maybe chatting while playing a game might be a new way of approaching this (ball ⚾, cards 🃏, etc.). Everyone is supposed to stand up (`rester debout`) 👍 as this shouldn't last long.

* You can use **Round Robin**: everyone is answering three questions (yesterday? today? blockers?)

* You can use the **Board-based** method (**walking the board**): from the **right** to the left, ask for each task info about it

* Some are using a token to the one talking (ex: ball ⚾), the person talking will throw the ball to the next person with the constraint of the next one not being their neighbor in the circle.
</div><div>

* **Involves**: SM, Dev. team, PO?
* **Duration**: up to **15 minutes**

<br>
<p class="text-center">🪙 My two cents 🪙</p>

**As a Scrum master**, try to relay as much as possible information in your group. It may be a good idea to have a **one-to-one talk** with each member, once a day/[...]. This may help them think of new ways of doing something, improve their documentation/comments, think of new tests, and hopefully broaden both your and their horizons.
</div></div>

<hr class="sep-both">

## 3. Sprint review

<div class="row row-cols-md-2"><div>

At the end, you must **demonstrate** to the client (and your team sometimes) **what you did**, the items you completed (also talk about what you planned, but didn't make). Take note of what the client wants to **review** in **the product backlog**.

Each developer may **demonstrate** what they did (and why?), but do not make it too long, like 5 minutes per person. Do not forget to talk about **key metrics**: you are making a software/website/... for customers, check that it is usable/...
</div><div class="align-self-center">

* **Involves**: PO, SM, Dev. team, the client/users
* **Duration**: up to 4 hours/4 weeks

Some organizations are making a weekly demo with the team, so that everyone knows what the others are doing, understand a bit more what they need to do, and keep track of what the client wants.
</div></div>

<hr class="sep-both">

## 4. Sprint retrospective

<div class="row row-cols-md-2"><div>

At the end, identify the areas of improvement. Find **what didn't work well** and of course **what worked well**.

* tools (`outils/logiciels`)
* peoples
* directives (`règles: écriture du code, comportement, etc.`)
* processes (`organisation`)
* ...
</div><div>

* **Involves**: PO <small>(may not be here)</small>, SM, Dev. team
* **Duration**: up to 3 hours/4 weeks

At the end, you must select **one thing** and focus on it. Focusing on one is making sure that I least one thing will improve per sprint. You might write an **action plan** of what to do.

**Note**: You can do this retrospective in the middle of a sprint.
</div></div>

<hr class="sep-both">

## Metrics

<div class="row row-cols-md-2"><div>

The following are ways used to check the progress, or the key indicators of your project.

* **R.O.T.I** (Return of time invested)

Ask your team, how much a meeting was useful 

* `5`: excellent
* `4`: above average/good
* `3`: average/ok
* `2`: useful
* `1`: useless
</div><div>

* **Velocity**

The velocity is the capacity of your team. This is not a value comparable with other teams/projects. This is the **sum of the complexity of the tasks your team took**. You should use it to not take too many stories <small>(both per person and per group)</small>. This value will converge after some iterations. You should usually keep a 10% margin <small>(meetings, technical debt, quality, etc.)</small>.

You may use a **Burndown chart** (or the **Burnup chart**) to represent this graphically.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

Concepts

* Initiatives
* Themes
* T-Shirt Size Estimation
* Scrum release planning
* DevOps
* Delegation Poker
* Vision Statement
* Volere Requirements
* Product roadmap
* Product requirements documents (PRD)
</div><div>

Websites

* [atlassian.com](https://www.atlassian.com/agile/scrum) and [atlassian.com (plays)](https://www.atlassian.com/team-playbook/plays)
* [scrum.org](https://www.scrum.org/)
* [scrumguides.org](https://scrumguides.org/index.html)
* [knowledgehut.com](https://www.knowledgehut.com/tutorials/scrum-tutorial)
* [visual-paradigm.com](https://www.visual-paradigm.com/scrum/)
* [management30](https://management30.com/)
* [plan.io](https://plan.io/blog/what-is-agile-project-management/)
* [scrum-institute](https://www.scrum-institute.org/)
* [explainagile.com](https://explainagile.com/)
* [romanpichler](https://www.romanpichler.com/)
* [hymnsofagile.com](https://hymnsofagile.com/blog/)
</div></div>