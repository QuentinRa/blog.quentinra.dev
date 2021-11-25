# IGL

IGL "Introduction au génie logiciel" is not an easy course. You will need strength and motivation to survive 👀. <small>Joke aside, it's hard to learn something. You will have a lot of things used in the graded homework that you didn't "see" during classes</small>.

> In 2021, the version of Papyrus in the school was **4.8.0**, so even if there are newer versions, [install Papyrus 4.8.0](https://www.eclipse.org/downloads/download.php?file=/modeling/mdt/papyrus/rcp/2020-06/4.8.0/papyrus-2020-06-4.8.0-win64.zip). If you need another version of papyrus that is not on the official website, trick the URL above (it works, that's how I found this version).

<hr class="sl">

## TD9 - Code Generation

We have to write some code, that will be able to generate **Java** and **Documentation** from our **model**. We will test a few ways of doing so.

* [Setup](td8/setup.md) (**hard** 😱, **may take around 20 minutes**)
* [Code generation with Xtend](td8/xtend.md) (**medium**)
* [Code generation with Acceleo](td8/acceleo_code.md) (**easy**)
* [Code documentation generation with Acceleo](td8/acceleo_doc.md) (**easy-medium**)

> **Pro tip**: you need to close and run again the 3rd editor, each time you changed the code in the 2nd editor.<br>
> **Pro tip**: you can't run the expected main in eclipse. If you try, you are going to run the previous program, not the expected main.

About the project

<details class="details-e">
<summary>XTend Generator isn't generating a lot of files</summary>

It means that it crashed. Check for error messages in `xtend_editor` console. In my case, it was because I got some vertex/nodes without names.
</details>

<details class="details-e">
<summary><b>java.util.HashSet</b>/<b>java.util.Arrays</b> no added</summary>

You need to declare dependencies. This is a bit complex, but fortunately, I'm giving you the steps

* Click on SmartHouse (in the model explorer, the root)
* Go to **Profile** > Profile Applications
  * Next to "+" and "x", click on "apply registered profile"
    * Add "Papyrus Code Generation Profile"
    * Add "Papyrus Java Profile"

First, let's exclude the Folder "Needs". Click on it, then **Profile**, then **Applied Stereotypes**, and add **NoCodeGen** (we don't want some code generation for Needs). 

In SmartHouse (root), add a new package (new child), and do the same as for Needs. Put inside two classes

* HashSet
* Arrays

And on both of them, add them a stereotype (Profile > +) "External". Click on the stereotype and don't forget to set the value for name. This is the package+class that you want.

Then create in the root a new class diagram "Dependencies" and use the usage relationship to request an import.
</details>