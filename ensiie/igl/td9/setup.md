# Setup TD9 - Code Generation

[Go back](../index.md#td8---code-generation)

The setup include installing **papyrus.designer**, **Xtend IDE**, and **acceleo**. While the steps are easy, you will have to deal with multiple instances of Papyrus and things aren't tidy nor convenient at all 😬.

> **Note**: I may have installed more than the bare minimum, but it's working! Please edit if we can unselect some things.

<hr class="sl">

## Papyrus Software Designer

* Help > Install New Software
* Enter `https://ci.eclipse.org/papyrus/job/papyrus-designer-2020-06/lastSuccessfulBuild/artifact/releng/org.eclipse.papyrus.designer.p2/target/repository/` and press enter
* Select the first `Papyrus base elements for code generation`
* Select the first `Papyrus Java profile ...`
* Next (wait)
* Next
* I accept & Finish (wait, check the bottom right of papyrus)
* Restart (when prompted)

<hr class="sr">

## Xtend IDE

* Help > Install New Software
* Enter `https://download.eclipse.org/modeling/tmf/xtext/updates/composite/latest/` and press enter
* Select Xtend IDE inside XText
* The next steps are the same as in the previous part

<hr class="sl">

## Acceleo

* Help > Install New Software
* Enter `https://download.eclipse.org/acceleo/updates/releases/3.7/R201911060712` and press enter
* Select Acceleo in Acceleo
* The next steps are the same as in the previous part

<hr class="sr">

## Getting started

* If needed, create a new project (**ex: IGL**)
  * Papyrus
  * Remove the generated model
* Right-click on the project, and select "import"
  * General > Archive file
  * [Model_Transformation_Tutorial_Student.zip](https://raw.githubusercontent.com/memorize-code/memorize-references/main/special/igl/Model_Transformation_Tutorial_Student.zip)
* Once imported, click on **your root folder (ex: IGL)** then delete (but don't check "Delete ... on disk")
* General > Existing Projects Into Workspace
* Browse
* Go find "Model_Transformation_Tutorial_Student". You should have 9 projects listed once you open "Model_Transformation_Tutorial_Student".
* Wait a bit, **some cross/errors will appear**. **You can ignore them** (such as javaLangCodeGen.java), **aside from**
  * package xxx.codegen.sm => replace java version in plugin.xml with 1.8
  * package xxx.ui.sm => replace java version in plugin.xml with 1.8

<hr class="sr">

## Runtime eclipse

Now, we need to test our code.

* Run > Run Configurations (or Debug Configurations)
* Double-click on Eclipse
* You may name the configuration "runtime_eclipse"
* Press Run (resp. Debug)
* And click on **proceed** if prompted. 

In the **runtime_eclipse**

* Import projects
* Existing Projects Into Workspace
* Browse > Find SMModel
* Once imported, double-click on the model
* In the **Model explorer**
  * right-click on "Project SMModel" 
  * Generate Code for State Machine
  * Create JDT (yes, set JDK to 1.8, Finish)
* It will generate a new model with Java classes that are your generated code