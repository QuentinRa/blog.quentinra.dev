# Agile Scrum

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

Agile methodologies are based on **12 principles** and **4 values** ([principles and values (fr)](https://manifesteagile.fr/index.html), [principles (en)](https://agilemanifesto.org/principles.html) and [values (en)](https://agilemanifesto.org/)). My summary is

* to do everything to make your client happy 😊
* allow changing the specifications  ✍️
* frequently deliver a working software 💻
* make sure that users and devs are working together 😏
* interact face-to-face 🗣️
* have a stable development speed 🧐
* always strive to do better 👌

<hr class="sr">

## Roles

Scrum is involving **3 roles** in a team

### Product Owner (PO)

The client with interact with the **Product owner**. He must understand the business/market requirement, and organize the tasks so that the client get what he/she wanted.

He will redact (and update) the **product backlog**, which is almost like a specification (`cahier des charges`). He may not be the only one creating entries in the backlog, but others should ask him/her before, as he/she should know everything inside the backlog.

<hr>

### Scrum master (SM)

The **Scrum master** is **making sure that the developers** <small>(the product owner, and the company)</small> **are only focusing on the their job**, and not on applying Scrum. He should **organize (or sometimes facilitate) meetings**, **support the team**, **manage the tools**, do **reporting**, **deal with blockers**, and **"timeboxing"** <small>(a meeting shouldn't not last more that it was supposed to)</small>  so that the project is going smoothly.

The Scrum master is an expert of scrum, and he/she must **ensure that Scrum is used properly**, but if the team agree on changing something, he/she must be **open for changes** (as he/she follows the principles and values of Scrum).

> (1) Do not ask the intern to grab some cakes, or some coffee, that's the Scrum master's job 🤩 (joke, but he/she may). <br>
> (2) The Scrum master may be a member of the dev team, and it may rotates through the team. <br>
> (3) The Scrum master is not a project manager (`chef de projet`). The project manager is overseeing/controlling the project, while the Scrum master is actively working on improving the workflow of the project, as someone of the team.

<hr>

### Development team (Dev. team)

They are the people doing the work. This is usually a team of 3 to 9 persons, but some are adapting Scrum for more. **Notice** that is is **Development**, not **Developers**. You can have **graphics/UX designers**, **sound engineers**, **artists**, or **testers**, along with the developers. We are considering all of them **developers**.

<hr class="sl">

## Scrum

The development is made of iterations, a repetition of cycles, called **sprints** (=**iteration**). The result of your sprint is usually called **increment**. A sprint is made of **4 ceremonies** (`rituels`).

1. **Sprint Planning**: when starting a sprint
2. **Daily Scrum**: meeting everyday
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

Check the **progress**. What each one did **yesterday**, what are they planning to do **today**. Identify **blockers** and **challenges**. The purpose is **informative**, a sort of coffee break 🍵 (`pause café`). If you don't drink coffee, maybe chatting while playing a game might be a new way of approaching this (ball ⚾, cards 🃏, etc.). Everyone is supposed to standup (`rester debout`) 👍.

> **As a Scrum master**: Try to relay as much as possible information in your group. It may be a good idea to have one-to-one talk with everyone, once a day. This may help them think of new way of doing something, help them writing documentation/thinking a new tests, and broaden their horizons (and yours too).

<hr class="sr">

### 3. Sprint review

* **Involves**: PO, SM, Dev. team, the client/users
* **Duration**: up to 4 hours/4 weeks

At the end, you must **demonstrate** to the client (and your team sometimes) **what you did**, the items you completed (also talk about what you planed, but didn't made). Take note of what the client wants to **review** in **the product backlog**.

Each developer may **demonstrate** what they did (and why?), but do not make it too long, like 5 minutes per person. Do not forget to talk about **key metrics**: you are making a software/website/... for customers, check that it is usable/...

> Some organizations are making weekly demo with the team, so that everyone know what the others are doing, understand a bit more what they need to do, and keep track of what the client wants.

<hr class="sl">

### 4. Sprint retrospective

* **Involves**: PO, SM, Dev. team
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

## Sources

* [Agile Manifesto](https://agilemanifesto.org/)
* [Agile Manifesto (fr)](https://manifesteagile.fr/index.html)
* [Agile model](http://tryqa.com/what-is-agile-model-advantages-disadvantages-and-when-to-use-it/)
* [Agile Scrum - Atlassian](https://www.atlassian.com/agile/scrum/)