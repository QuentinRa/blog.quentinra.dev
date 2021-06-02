# Road to your GanTT

[Go back](..)

You need to create a GanTT with your tasks, their time, their cost,
who will do it, ... So we need to do some diagrams beforehand.

## WBS - work breakdown structure

In French that's `organigramme des taches`, the idea is

* make a tree of your task
* the project is the root
* then the branches are the direct task needed to do the node above
* for each node, we will have
    * a duration
    * a cost (HJ / money)
    * the result expected
    * the resources needed
    
<pre class="d-none">
@startwbs
* Projet. Cout = 300 HJ.
** Production. Cout = 295 HJ.
*** ...
*** ...
** Lancement. Cout = 5 HJ.
*** ...
** Complete innovate phase
@endwbs
</pre>

![plantuml code above](http://www.plantuml.com/plantuml/png/SoWkIImgAKygvj9I22ZApqejqLDmpYyjKR1LC3OmKF3mqkFI0ikab2QNPERdmMMDB4qXia1fFJraMi4dCIyvDJSr3s4KkbAWU6v1Jcf9ga9cNbv-MIAGKP2HM9pAvP2Qbm9q3000)

## P.E.R.T.

Now we need to see if a task need another tasks and what these
tasks would be. This is a simplified version of PERT
where the initial node is the project and we use a
``------`` to represent a task that will take a lot
longer than the other one.

![pert](pert.png)

## GanTT

Check some tutorial on the web since it's more visual
and dependant on the tool you will use.

* [GanttProjet](https://www.ganttproject.biz/download#download30) (software)
* [officetimeline](https://www.officetimeline.com/) (website)

But still here are some steps when you are in

1. list all steps
2. sort and indent child tasks
3. create dependencies
4. set date and duration
5. add JALONS
6. add people