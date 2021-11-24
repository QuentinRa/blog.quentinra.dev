# Setup TD8 - Code Generation

[Go back](../index.md#td8---code-generation)

The setup include installing **papyrus.designer**, **Xtend IDE**, and **acceleo**. While the steps are easy, you will have to deal with multiple instances of Papyrus and things aren't tidy nor convenient at all 😬.

> **Note**: I may have installed more than the bare minimum, but it's working! Please edit if we can unselect some things.

<hr class="sl">

## papyrus.designer

* Window > Install software
* Enter `https://ci.eclipse.org/papyrus/job/papyrus-designer-2020-06/lastSuccessfulBuild/artifact/releng/org.eclipse.papyrus.designer.p2/target/repository/` and press enter
* Select both versions of `Papyrus base elements for code generation`
* Select both versions of `Papyrus Java profile ...`
* Next (wait)
* Next
* I agree & Finish (wait, check the bottom right of papyrus)
* Restart (when prompted)

<hr class="sr">

## Xtend IDE

* Window > Install software
* Enter `https://download.eclipse.org/modeling/tmf/xtext/updates/composite/latest/` and press enter
* Select XText => Xtend IDE
* The next steps are the same as in the previous part

<hr class="sl">

## Acceleo

* Window > Install software
* Enter `https://download.eclipse.org/acceleo/updates/releases/3.7/R201911060712` and press enter
* Select the first two groups (out of 3)
* The next steps are the same as in the previous part

<hr class="sr">

## Getting started

* Create a new project (if needed)
* Right-click on the project, and select "import"
  * General > Archive file
  * [Model_Transformation_Tutorial_Student.zip](https://github.com/memorize-code/memorize-references/tree/main/igl/Model_Transformation_Tutorial_Student.zip)
* **WE WON'T USE THIS PAPYRUS** ❗

Then, we need to create an editor that will be usable, I mean we need autocompletion and so on. You can't close the previous one through 👎.

* Run > Run Configurations (or Debug Configurations)
* Double-click on Eclipse
* You may name the configuration "xtend_editor"
* Press Run (resp. Debug)
* **You will modify files only in this editor** ❗

In **xtend_editor**

* Import projects
* Existing Projects Into Workspace
* Browse
* Go find "Model_Transformation_Tutorial_Student". You should have 9 projects listed once you open "Model_Transformation_Tutorial_Student".
* Wait a bit, some cross/errors will appear. You can ignore them, aside from
  * package xxx.codegen.sm => replace java version in plugin.xml with 1.8
  * package xxx.ui.sm => replace java version in plugin.xml with 1.8

Now, we need to test our code. Redo the steps as above, and create a run configuration called "**runtime_eclipse**". Run it (click on proceed if prompted). In the **runtime_eclipse**

* Import projects
* Existing Projects Into Workspace
* Browse > Select SM Model
* Once imported, double-click on the model
* In the **Model explorer**
  * right-click on "Project SMModel" 
  * Generate Code for State Machine
  * Create JDT (yes, set JDK to 1.8, Finish)
* It will generate a new model, with Java classes that are your code