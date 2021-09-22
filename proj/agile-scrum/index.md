# Agile Scrum

[![download slides PDF](https://img.shields.io/badge/feature-download%20slides-blue)](https://raw.githubusercontent.com/lgs-games/memorize/master/proj/agile-scrum/output/slides.pdf)

Agile **Scrum** (`Mêlée au rugby`) is one of the most used **Agile methodologies** (`méthodes agiles`). This is a kind of incremental method ([wiki](https://en.wikipedia.org/wiki/Incremental_build_model)) that is repeating small cycles (**iterations**). A long time ago, the **V-Model** (`Cycle en V`) model <small>(an extension of the Waterfall model)</small> was the most used methodology. But, it **wasn't flexible**, the client often had to **wait a long time**, and the product **may not have been what he wanted**, so a lot of companies are moving to Agile methodologies.

As this is an incremental method, you will add functionalities incrementally. When your iteration ended, the client will check what you did, give you feedback, so that you know what to do in the next iteration.

> **Other Agile methodologies**: XP (Extreme programming), Kanban. <br>
> **The Agile manifesto (`Manifeste Agile`), signed in 2001, is defining the guidelines for Agile project**: [Agile Manifesto](https://agilemanifesto.org/)

<hr class="sl">

## Values and principles

> Everyone is teaching you these, because being **Agile** is a **mindset** (`état d'esprit`) 🤓, and **Scrum** a framework (`cadre de travail`~=methodology) 🛠. You need to learn both 🚀.

Agile-Scrum is based on **3 pillars** (transparency, inspection, adaptation), and **5 values**

* **Courage**: face your problems, and do what must be done, **don't hide bugs under the carpet** (`pas de 🐛 sous le tapis`)
* **Focus**: concentrate on the sprint goal
* **Commitment**: be committed to your work
* **Respect**: be respectful to others
* **Openness**: be open to changes or evolutions

Agile methodologies are based on **12 principles** and **4 values** ([principles and values (FR)](https://manifesteagile.fr/index.html), [principles (EN)](https://agilemanifesto.org/principles.html) and [values (EN)](https://agilemanifesto.org/)). My summary is

* to do everything to make your client happy 😊
* allow changing the specifications  ✍️
* frequently deliver a working software 💻
* make sure that users and devs are working together 😏
* always strive to do better 🧐
* have a stable development speed 👌
* interact face-to-face 🗣️

<hr class="sr">

## Roles

Scrum is involving **3 roles** in a team

### Product Owner (PO)

The client interacts with the **Product owner**. He must understand the business/market requirements, and organize the tasks so that the client gets what he/she wanted.

He will redact (and update) the **Product backlog**. He may not be the only one creating entries in the backlog, but others should ask him/her before, as he/she should know everything inside the backlog.

<hr>

### Scrum master (SM)

The **Scrum master** is **making sure that the developers** <small>(the product owner, and the company too)</small> **are only focusing on their job**, and not on applying Scrum. He should **organize (or sometimes facilitate) meetings**, **support the team**, **manage the tools**, do **reporting**, **deal with blockers**, and **"timeboxing"** <small>(a meeting shouldn't last more than it was supposed to)</small>  so that the project is going smoothly.

The Scrum Master is an expert of Scrum, and he/she must **ensure that Scrum is used properly**, but if the team agree on changing something, he/she must be **open for changes** (as he/she follows the principles and values of Scrum).

> (1) Do not ask the intern to grab some cakes, or some coffee, that's the Scrum master's job 🤩 (joke, but he/she may). <br>
> (2) The Scrum master may be a member of the dev team, and it may rotate through the team. <br>
> (3) The Scrum master is not a project manager (`chef de projet`). The project manager is overseeing/controlling the project, while the Scrum master is actively working on improving the workflow of the project, as someone of the team.

<hr>

### Development team (Dev. team)

They are the people doing the work. This is usually a team of 3 to 9 persons, but some are adapting Scrum for bigger teams. **Notice** that is **Development**, **not Developers**. You can have **graphics/UX designers**, **sound engineers**, **artists**, or **testers**, along with the developers. Anyway, we are considering all of them as **developers** in the end, so you can use both.

<hr class="sl">

## Scrum

The development is made of iterations, a repetition of cycles, called **sprints** (=**iteration**). The result of your sprint is usually called **increment**. A sprint is made of **4 ceremonies** (`rituels`).

1. **Sprint Planning**: when starting a sprint
2. **Daily Scrum**: daily meeting
3. **Sprint review**: at the end, demonstration to the client
4. **Sprint retrospective**: usually at the end, look for improvements

Usually, a sprint lasts **2 to 4 weeks**. Once you picked a duration, you shouldn't change it (unless you got a good reason).

A sprint is considered as a project as a whole, so you have to write tests and the documentation during the sprint. You will do the same as you are doing for the project and add functionalities one after another until you reach your goal.

<hr class="sr">

## 1. Sprint Planning

The main goal of the **Sprint Planning** is to decide your **Sprint goal**. Your **Sprint goal** is what you want to make at the end of the sprint.

* **Involves**: PO, SM, Dev. team
* **Duration**: up to 4 hours/4 weeks

The Product Owner is **proposing a goal**, and the **items** of the **product backlog** that you may do.  The dev team is picking items (=>value for the client, effort), explicitly defining when they are considered to be "done" (doc? tests?), in the **sprint backlog**. You need to have a clear idea of **what makes the sprint successful**, and how you will achieve the **sprint goal**.

You will make **two of Scrum's artifacts**

* [Product backlog](artifacts/product-backlog.md)
* [Sprint backlog](artifacts/sprint-backlog.md)

<hr class="sl">

## 2. Daily Scrum or standup/stand-up

* **Involves**: SM, Dev. team, PO?
* **Duration**: up to **15 minutes**

Check the **progress**. What each one did **yesterday**, what are they planning to do **today**. Identify **blockers** and **challenges**. The purpose is **informative**, a sort of coffee break 🍵 (`pause café`). If you don't drink coffee, maybe chatting while playing a game might be a new way of approaching this (ball ⚾, cards 🃏, etc.). Everyone is supposed to stand up (`rester debout`) 👍.

* You can use **Round Robin**: everyone is answering three questions (yesterday? today? blockers?)
* You can use the **Board-based** method (**walking the board**): simply ask easy one about their task, starting from the **right** to the left
* Some are using a token to the one talking (ex: ball ⚾), the person talking will throw the ball to the next person (not a neighbor)

> **As a Scrum master**: Try to relay as much as possible information in your group. It may be a good idea to have a **one-to-one talk** with each member, once a day. This may help them think of new ways of doing something, help them writing documentation/thinking of new tests, and broaden their horizons (and yours too).

<hr class="sr">

### 3. Sprint review

* **Involves**: PO, SM, Dev. team, the client/users
* **Duration**: up to 4 hours/4 weeks

At the end, you must **demonstrate** to the client (and your team sometimes) **what you did**, the items you completed (also talk about what you planned, but didn't made). Take note of what the client wants to **review** in **the product backlog**.

Each developer may **demonstrate** what they did (and why?), but do not make it too long, like 5 minutes per person. Do not forget to talk about **key metrics**: you are making a software/website/... for customers, check that it is usable/...

> Some organizations are making weekly demo with the team, so that everyone knows what the others are doing, understand a bit more what they need to do, and keep track of what the client wants.

<hr class="sl">

### 4. Sprint retrospective

* **Involves**: PO <small>(may not be here)</small>, SM, Dev. team
* **Duration**: up to 3 hours/4 weeks

At the end, identify the areas of improvement. Find **what didn't work well** and of course **what worked well**.

* tools (`outils/logiciels`)
* peoples
* directives (`règles: écriture du code, comportement, etc.`)
* processes (`organisation`)
* ...

At the end, you must select **one thing** and focus on it. Focusing on one is making sure that I least one thing will improve per sprint. You might write an **action plan** of what to do.

**Note**: You can do this retrospective in the middle of a sprint.

<hr class="sl">

## Sprint 0

This is the first sprint, but it's labeled as **Sprint 0**, because this is not a real sprint and this is before the first sprint. You will set up everything during this sprint, and create the workflow of the application. It means, you **have to**

* create the folders <small>(ex: src, headers, etc.)</small>
* create files such as README.md, LICENSE, CONTRIBUTING.md, etc.
* write your guidelines/style guide/... <small>(if you got one)</small>
* pick your tools <small>(ex: git, trello, ...)</small>, set them up <small>(ex: create repository, master/main?)</small>
* set up the rules <small>(ex: when are branches created? main => version1.0 => feature xxx)</small>
* ...

And **write some code**, but only **the bare minimum** so that everyone can start their task without meddling with/stopping everyone else (ex: create the Main file, maybe create the data-related files, so that all of you know what data is manipulated, etc.).

<hr class="sr">

## Metrics

They are the way of checking what progress, or the key indicators of your project.

* **R.O.T.I** (Return of time invested)

Ask your team, how much a meeting was useful (`5`: excellent, `4`: above average/good, `3`: average/ok, `2`: useful, `1`: useless)

* **Velocity**

The velocity is the capacity of your team. This is not a value comparable with other teams/projects. This is the **sum of the complexity of the tasks your team took**. You should use it to not take too many stories <small>(both per person and per group)</small>. This value will converge after some iterations. You should usually keep a 10% margin (meetings,technical debt, quality, etc.).

You may use a **Burndown chart** (or the **Burnup chart**) to represent this graphically.

<hr class="sr">

## Sources

* [Agile Manifesto](https://agilemanifesto.org/)
* [Agile Manifesto (FR)](https://manifesteagile.fr/index.html)
* [Agile model](http://tryqa.com/what-is-agile-model-advantages-disadvantages-and-when-to-use-it/)
* [Agile Scrum - Atlassian](https://www.atlassian.com/agile/scrum/)
* [Agile roadmap - French](https://blog.trello.com/fr/roadmap-agile)