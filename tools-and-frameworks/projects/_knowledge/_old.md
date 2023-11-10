# Specifications

You will need to write a document called specifications (``Cahier des charges CDC``), summarizing everything that you have to do.

* **present the company**  : name, logo?, background
* **present the project** : client, what we want, ...
* **present the public** : who will use the product(language, age, IT knowledge, ...)
* **the team** : organization, roles, ...
* **graphic chard** : if you have one

Then, start digging into the real stuff

* [Functional specifications](cdc/fs.md)
* [Technical specifications](cdc/ts.md)
* [Risks](cdc/risks.md)

<hr class="sr">

## Organize your project

You would usually write a Gantt project to organize your tasks, even in an Agile-project (though it may have less content).

You need to create a Gantt with your tasks, their time, their cost, who will do it, ... So we need to do some diagrams beforehand.

* [Work breakdown structure](tools/wbs.md) (WBS)
* [P.E.R.T.](tools/pert.md)
* [GanTT](tools/gantt.md)

Then work on the project and don't forget

* to update your Gantt
* to communicate with your team
* to (properly) organize some meetings
* to do some **tests**
* to write some **documentation**

And please take note that

> **YOU MUST ALWAYS HAVE A WORKING VERSION OF YOUR SOFTWARE**. At any time of the development, the software can be run and, the client or whoever can test it. That's the key to the success so don't forget that 🧐.

<hr class="sl">

## Meetings and reporting

There are usually two kinds of meetings

* **periodic meetings**: with the rest of the team, to summarize what's done and what's need to be done
* **steering meeting** (``réunion de pilotage``): with the client, usually, each month to check what you are doing.
  
For a meeting, you will usually have to write (or read) the minutes of meeting (``Compte Rendu``) which may look like this in French

![minutes of meeting in French](tools/images/cr.png)

The daily order/schedule (``ordre du jour/agenda``) is listing who will talk in the meeting, along with how much time and the subject. We have a time set for each participant.

<hr class="sr">

## Bugs

If you are on a small project, you can use a file to store information about your bugs. You can make an Excel table with 1 line per bug.

* give each bug an ID
* a description of how we can reproduce the bug
* a description of what was expected
* a description of what you got
* notes like the software version/tool version/...
* a priority
* an assignee/some reviewers
* a boolean with true/false if solved

But, a lot of tools/websites exist, so you might as well use them. Enter "issues tacker" on a search engine, and you might find what you want. 

* ex: GitHub issues (for IT projects with version control)
* ex: [YouTrack](https://www.jetbrains.com/youtrack/) (an issues' tracker made by JetBrains)
* ex: Jira (Atlassian)

<hr class="sl">

## Sources

* <https://www.codeur.com/blog/gestion-de-projet-diagramme-pert/>
* <https://en.wikipedia.org/wiki/Project_management>