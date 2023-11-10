# Project Management

<div class="row row-cols-lg-2"><div>

In a nutshell, a project involves:

* **Objectives** 🛣️: decipher and address client needs.
* **Deliverables** 📬: what you'll deliver to clients
* **Milestones** 📌: Key dates throughout your project timeline
* **Scope** 💵: Tasks, budget, and project-related elements
* **Resource Management** 📊: effort required for tasks (Man-days?)
</div><div>

A project usually involves two different teams:

* **Development Team** 🧑‍🔬: This is the initial group responsible for designing, coding, and implementing the project. They usually leave or move to another project after project completion.

* **Maintenance and Support Team** 🚵: This group takes over to ensure the project continued functionality, fix any issues that arise, and implement updates or improvements.

➡️ See also: Operational Maintenance and Security Maintenance.
</div></div>

<hr class="sep-both">

## Specifications Document

<div class="row row-cols-lg-2"><div>

It outlines the specifications that a project must meet. 

#### Overview

A simple specification document may include:

* **Introduce the company**: name, logo, background, etc.
* **Introduce the project**: client, needs, etc.
* **Introduce the target audience**: age, knowledge, etc.
* **Introduce the team**: members, roles, etc.
* **Introduce the graphic chart**: if you have one

#### Functional Specifications

This section focuses on the functionalities of the product. It could be a table with basic information about each task, along their priority.

| N°| Task name | Duration (days) | Man-days | Priority |
| ------ | ------ | ------ | ------ | ------ |
|   | Phase1 | 20 | 85 | M |
| A | Task1	 | 8 | 25 | M |
| B | Task2 | 12 | 60 | C |

We often use MosCOW to determine the priority of each task:

* <kbd>M</kbd>: Must have this
* <kbd>S</kbd>: Should have this
* <kbd>C</kbd>: Could have this
* <kbd>W</kbd>: Would have this
</div><div>

You will have to further develop each task, by describing as much as possible, what must be done.

* You could design a mockup
* Don't forget error messages, events, animations/colors such as when a button is pressed, etc.
* Describe the task from the point of a view of a user
* Define UML diagrams to formally define the task
* ...

#### Technical Specifications

The technical specifications define which languages, tools, and which technical constraints the development team will have.

* **Methods**: Agile-Scrum, Kanban, etc.
* **Technologies**
    * name (MariaDB? MySQL? Java? PHP? Etc.)
    * version (at least? Up to? Exact value?)
* **Platforms**: target platform(s)
* **Language**: French, English, etc.
* **Storage**: How do we manage persistence? (Database? File?)
* **Restrictions**: other restrictions, such as forbidding cookies.
* **Hardware**: are additional devices/components/... required?
* **Others**: version control, team communications, etc.

#### Risk Evaluation

You must evaluate the risks that may occur and determine how to handle them. It could be a person/tool/... that is not available, a task complexity that was incorrectly evaluated, a required dependency whose delivery was delayed, etc.

📚 See also: [Probabilistic risk assessment](https://en.wikipedia.org/wiki/Probabilistic_risk_assessment) and [Risk Matrix](https://en.wikipedia.org/wiki/Risk_matrix).
</div></div>

<hr class="sep-both">

## Project Scheduling

<div class="row row-cols-lg-2"><div>

#### Work Breakdown Structure (WBS)

WBS is a hierarchical decomposition of the tasks.  It's a breakdown of a project into smaller and more manageable components.

For each component, we usually add a duration, a cost, and optionally the result expected or the resources needed.

![WBS Example](_uml/wbs.svg)

#### Scheduling Problems

...

#### Metra potential method

* first, create a graph of all of your tasks
* the tasks are linked with edges having a weight which is the duration of the task
* We are usually starting at a node called START, and ending at a node called END

The task (nodes) will have properties

* early start time
* last start time
* free margin (optional)
* total margin (optional)

**Note**: You may have some cases of **redundancy** like C is dependent on A, and D is dependent on C and A. You must remove $A \to D$ because we got by transitivity since we have $A \to C \to D$.
</div><div>

#### P.E.R.T.

In the P.E.R.T. method, the vertices aren't the tasks anymore, they are the states of our project. When you're doing a task, you're moving your project in another state. A task that needs other tasks, will now be depending on the state of the project where the do tasks got tackled.

* we got nodes like 1, 2, 3, ... that are the states of our project (1 may not be before 2)
* they have properties
  * early start time
  * last start time
  * free margin (optional)
  * total margin (optional)
* we have a node START
* we have a node END

From one state of your project (START), you may do some tasks like A and B. In P.E.R.T., this is 2 states (1 and 2), and on each edge ($START \to 1$, and $START \to 2$), we will put

* the name of the task
* the cost of the task

But, if the task "C" is dependent on "A" and "B", this is the same as being dependent on state 1 and state 2. What we do is adding a directed dotted arrow $1 \to 2$ (or $2 \to 1$) with the duration $0$. Then we start the edge with $C(cost)$ from $1$ (resp. $2$, up to the one you picked) giving us $2 \to 3$ (resp. $1 \to 3$).

**Note**: You may have some cases of **redundancy** like C is dependent on A, and D is dependent on C and A. You must remove $A \to D$ because we got it by transitivity since we have $A \to C \to D$.
</div></div>

<hr class="sep-both">

## Project Tools

<div class="row row-cols-lg-2"><div>

#### Project Management Tools

* [Redmine](https://www.redmine.org/)
</div><div>

#### Bug And Issues Management Tools

* [YouTrack](https://www.jetbrains.com/youtrack/) (JetBrains)
* [Jira](https://www.atlassian.com/software/jira) (Atlassian)
* [GitHub Issues](https://github.com/features/issues), [GitLab Issues](https://docs.gitlab.com/ee/user/project/issues/), etc.
* [Redmine](https://www.redmine.org/)
* ...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Steering Meetings: for key stakeholders and decision-makers to provide guidance and direction for a project
* Periodic Meetings: at regular intervals, discuss ongoing work/challenges/progress.
</div><div>
</div></div>