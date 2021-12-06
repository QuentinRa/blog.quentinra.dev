# Introduction au génie logiciel

IGL "Introduction au génie logiciel" is not an easy course. You will need strength and motivation to survive 👀. <small>Joke aside, it's hard to learn something. You will have a lot of things used in graded homework that you didn't "see" during classes</small>.

> In 2021, the version of Papyrus in the school was **4.8.0**, so even if there are newer versions, [install Papyrus 4.8.0](https://www.eclipse.org/downloads/download.php?file=/modeling/mdt/papyrus/rcp/2020-06/4.8.0/papyrus-2020-06-4.8.0-win64.zip). If you need another version of papyrus that is not on the official website, look for the section **Update sites** on [Papyrus Download Page](https://www.eclipse.org/papyrus/download.html).

<hr class="sl">

## Install Papyrus

<table class="table table-bordered table-striped border-dark">
<tr>
<th>Steps</th>
<th>Notes</th>
</tr>

<td>

* (**If not done**) Download and Install Java <small>([Oracle JDK17](https://www.oracle.com/java/technologies/downloads/), Windows > Installer)</small>
* [Download Papyrus 4.8.0](https://www.eclipse.org/downloads/download.php?file=/modeling/mdt/papyrus/rcp/2020-06/4.8.0/papyrus-2020-06-4.8.0-win64.zip) or check [Papyrus Download Page](https://www.eclipse.org/papyrus/download.html)
* (**Optional**) For some, you may need to do this ([~source](https://www.youtube.com/watch?v=QlGrBHkwDXQ&ab_channel=GameTrick))
  * To find your Java folder <small>(ex: `C:\Program Files\Java\jdk-17\bin`)</small>
  * In Papyrus Config file, named `papyrus.ini`, add two lines before the line with `-vmargs`
  * `-vm`
  * `C:\Program Files\Java\jdk-17\bin`
</td>
<td>

**We will work with Java 1.8, but you can use a newer version and configure that later**.

It's a good practice to make backup, as losing everything <small>(or Random bugs)</small> may be a daily occurrence, especially if you are using SysML.
</td>
</table>

<hr class="sr">

## TD8 - activities

Once you created an activity, make sure that you are not creating a new one. Use the sync with editor / navigate to find it, then complete it.

Also, every call must be typed.

<hr class="sl">

## TD9 - Code Generation

We have to write some code, that will be able to generate **Java** and **Documentation** from our **model**. We will test a few ways of doing so.

* [Setup](td9/setup.md) (**hard** 😱, **may take around 20 minutes**)
* [Code generation with Xtend](td9/xtend.md) (**medium**)
* [Code generation with Acceleo](td9/acceleo_code.md) (**easy**)
* [Code documentation generation with Acceleo](td9/acceleo_doc.md) (**easy-medium**)

> **Note**: you need to run the second IDE again, each time you changed something in the first IDE.

* This is covering the TP, that you need this in order to do the [TD9 of the project](td9/project.md).
* [Correction TD9](td9/correction.md).

<hr class="sr">

## TD10 - Tests

This TP is the hardest. You will have to write tests, on an incomplete, wrongly generated code. What I mean, is that the generated (either coming from the teacher or mine) is not taking into account

* **initial states**: check the list of states, they aren't in
* **current state**: the wrong value is used for current state (the initial value), I doubt any one was expecting this (but we can ignore this)
* **duplicate states**: there is duplicates states in the HashSet. I my own opinion, this is not a problem (HashSet = Set of unique values) as this may allow us to be "on two states" at one time
* **current state (2)**: we used regions, but we are not able to have more than one current state, hence the tests should be either done on each region (**2 more tests to do**) or you may only do them on one. Anyway, there is a problem as this is not what we should had.
* **signals**: did you see that your interfaces are empty. How do you even send signals. In my opinion, you should modify the generator to generate a method for each getter, allowing you to "send" signals on this class. But, must of use relied on **transit** to make tests.
* **transit**: it's taking two states, but if things were "normal", we should be moving from one of our current states, to another state, right?
* **methods**: their code is empty (or useless), but you can do your tests without hassle even with this (imo, you may need to add OpaqueBehavior to replace Activities trough).

Without further ado, let's get started.

* [Running your tests](td10/running.md)