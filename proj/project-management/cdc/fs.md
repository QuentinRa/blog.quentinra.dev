# Functional specifications

[Go back](../index.md#specifications)

The name is giving you a hint, these specifications
are focused on the functionalities of the project.
You need to explain inside everything that the
project team will have to deal with,
functionality by functionality.

<hr class="sl">

## Table of tasks

Usually, you start by making a summary of
all your tasks, with some information

* amount of time (Man-days) and money
* a priority, see [MoSCoW](../tools/moscow.md)
* you can make a group of tasks to sort them

Let's say we grouped in Phase1 the tasks
A and B, we could have a table looking like this

<table class="table table-bordered table-striped">
<thead>
<tr>
<th>N°</th>
<th>Task</th>
<th>Duration (days)</th>
<th>Man-days</th>
<th>Priority</th>
</tr>
</thead>
<tbody>
<tr>
<td></td>
<td>Phase1</td>
<td>20</td>
<td>85</td>
<td>M</td>
</tr>
<tr>
<td>A</td>
<td>Task1</td>
<td>8</td>
<td>25</td>
<td>M</td>
</tr>
<tr>
<td>B</td>
<td>Task2</td>
<td>12</td>
<td>60</td>
<td>C</td>
</tr>
</tbody>
</table>

<hr class="sr">

## Explaining a task

Then, you will have to further explain each task.

* maybe make a mock-up,
  so that the devs know exactly what they need to do
  * recommended for websites and applications
  * add a short description for things like the color
  of the button when pressed...
* write some sentences about what each task
  will involve
  * ex: once registered, send a mail to activate your account.
  * add everything we can't guess by simply looking at the mock-up
* you should write the POC (proof of concept),
  meaning that you should check if something can be done!
  Sometimes your client will request something that can't
  be done either because of time, knowledge, technology,
  manpower or costs.
* you may add UML diagrams
* you may add some constraints
  * (ex: check with some REST API that the username is available)
  * Pretty much a follow-up of the description part.