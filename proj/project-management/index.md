# What's in this course

Honestly, this is a boring yet interesting theoretical
course. You will learn a lot of things, but there is
a lot of vocabulary. I will try to present it to you in a
useful way so that you will enjoy the course.
You will learn

* Projects' vocabulary and structure
* How you can write specifications (``CDC``)
* How reporting works
* How you can deal with bugs/issues

<hr class="sl">

## Vocabulary

* **Nature of the project**/**Need** (``Besoin``): what the client wants
* **Deliverables** (``Livrables``): what you will give to the client
* **Milestones** (``Jalons``): important dates of your project
* **Scope** (``Périmètre``): tasks, deliverables, budget, ... everything
  related to the project.
* **Man-days** (`Homme-Jour HJ`): an indicator of how many resources
  a task will require
* **Engineer**/**Architect** (``Maitre d’ouvrage``): interactions with the client, planned the project
* **General contractor** (``Maitre d’oeuvre``): interactions with programmers/technical staff, work on the project

<hr class="sr">

## Project Structure

Usually,

* a **build-team**/**project-team** is formed to create a version (ex: 1.0)
* then a **run-team**/**exploitation-team** will keep the project
  running, make updates, fix bugs ...

It's usually looks like this.

![lifecycle](lifecycle.svg)

Personal, I saw often the usage of the word
"maintainer" to talk about the ones that keep
maintaining the project, at least in IT projects.

<hr class="sl">

## Specifications

You will need to write a document 
(``Cahier des charges CDC``),
summarizing everything that you have to do.

**Functional Specifications**

Make a list of all tasks. You need for each task

* amount of time (HJ) and money
* a priority, see [MoSCoW](tools/moscow.md)
* maybe a mockup so that you can help
the devs know exactly what they need to do
* write some sentences about what each task
will involve (ex: register means sending a mail...
but we may not see that on the mockup so write
it). Still do not write too much, we don't like boring
stuff.
* you can make a group of tasks to sort them
* you should write the POC (proof of concept)
meaning you should check if something can be done!
sometimes your client will request something that can't
be done either because of time, knowledge, technology,
manpower or costs.

**Technical specifications**

* methods : Agile-Scrum, Kanban, ... ?
* tools
    * software: mariadb ? mysql ? postgresql ? java ? C++ ? ...
    * os: on which OS the project should be working on ?
    * version (that may be important)
* language
* what's used to store the data ? (database ? file ?)
* restrictions ?
* additional software/tools/components/... required ?

> You can find the full version [here](cdc/index.md).

**AND** that's something a lot of people are forgetting
but you need a part about the [risks](cdc/risks.md)!

<hr class="sr">

## Organize your project

You would usually write a Gantt project to organize your tasks,
even in an Agile-project (though it will have less content).

* [Writing your Gantt for Specs](tools/gantt.md)

Then work on the project and don't forget

* update your Gantt
* communicate with your team
* do some meetings, properly
* some **tests**
* and maybe some **documentation**

And please take not of **that**

> YOU MUST ALWAYS HAVE A WORKING VERSION
> OF YOUR SOFTWARE. At any time of the development,
> the software can be run and, the client or whoever
> can test it.

<hr class="sl">

## Reporting

There are usually

* periodic meetings: with the rest of the team,
  to summarize what's done and what's need to be done
* steering meeting (réunion de pilotage) : with the client,
usually, each month to check what you are doing.
  
For a meeting, you will usually have to write or read
a CR (Compte Rendu or report) looking like this.

![cr](tools/cr.png)

The "Ordre du jour" (agenda) is who will talk in the meeting,
and we have a time set for each one.

<hr class="sr">

## Bugs

If you are on a small project, you can use
a file to store information about your bugs.
You can make an excel table with 1 ligne per bug.

* give each bug an ID
* a description of how we can reproduce the bug
* a description of what was expected
* a description of what you got
* notes like the software version/tool version/...
* a priority
* an assignee/some reviewers
* a boolean with true/false if solved

But, a lot of tools/websites exists so you
might as well use them. Enter "issues tacker"
on a search engine and you might find what you
want. 

* ex: GitHub issues (for IT projects with version control)
* ex: [YouTrack](https://www.jetbrains.com/youtrack/) (issues tracker made by Jetbrains)
* ex: Jira (Atlassian)

<hr class="sl">

## Sources

* <https://www.codeur.com/blog/gestion-de-projet-diagramme-pert/>
* <https://en.wikipedia.org/wiki/Project_management>