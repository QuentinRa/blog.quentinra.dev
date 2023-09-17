# Papyrus

<div class="row row-cols-md-2"><div>

[Papyrus](https://eclipse.dev/papyrus/index.php) is an open-source UML tool based on Eclipse. It's a multipurpose software allowing us to:

* 🤔 Design UML 2 diagrams
* 🏭 Generate code from diagrams
* 🛣️ Simulate your diagrams
* 👀 Connect diagrams and write meta-models
* ...

You can download it [here](https://eclipse.dev/papyrus/download.html). These notes are based on [4.8.0](https://www.eclipse.org/downloads/download.php?file=/modeling/mdt/papyrus/rcp/2020-06/4.8.0/papyrus-2020-06-4.8.0-win64.zip).
</div><div>

To install Papyrus, you need to install [Java](https://www.oracle.com/java/technologies/downloads/) first. If you have problems when starting Papyrus, check out [this video](https://www.youtube.com/watch?v=QlGrBHkwDXQ&ab_channel=GameTrick).

Once the software is started, create a **new papyrus model**. A model is made of 3 files: `xxx.di`, `xxx.notation`, and `xxx.uml`.

⚠️ Their software may be buggy at times and crash. Make sure to often save your diagrams and keep copies of your work.
</div></div>

<hr class="sep-both">

## Core concepts

<div class="row row-cols-md-2"><div>

#### Model

All diagrams are parts of a **model**. It allows us to connect diagrams and reuse what we defined in other diagrams between diagrams.

If you change the model, it will be changed everywhere.

<br>

#### View and model

**The Model explorer is the only thing you can trust.**

The view may change and the model may not. It may occur if you try to rename something and the new name is invalid.
</div><div>

#### Perspectives

Perspectives allow you to view your model from different perspectives. Ensure that you are using the Papyrus perspective when you are creating models.

<div class="text-center">

![Papyrus perspective](_images/perp1.png) and select ![Papyrus select perspective](_images/perp2.png)
</div>

If you use a perspective at least once, a shortcut will be available right next to the perspective menu. See also:  "Window > Perspective".
</div></div>

<hr class="sep-both">

## Papyrus Interface

<div class="row row-cols-md-2 mt-4"><div>

1. **Project explorer** 📂: Double-click on a model to open it
    * Export your diagrams <small>(right-click on model -> export)</small>
    * Open your project in the file explorer <small>(right-click on the folder "example" and "show in")</small>
2. **Model explorer** 🍀: Once you opened a model, add diagrams inside it from here: Right-click on "example" > "New diagram".
3. **Model editor** 🎥: edit your diagram here. You can move things from the palette (4) to here.
4. **Palette** 🎨: everything element that you can put inside the kind of diagram you opened.
5. **Property view** 🔐: Edit the properties of what you selected
    * ex: give another name to a class
    * ex: give a type to an attribute
    * ex: write some documentation
    * etc.
6. **Outline view** 🌍: you can move faster in the model editor view using the Outline tab.
    * You can use it to view your diagram from afar
    * You can change the outline view <small>(by clicking on the tree-like icon)</small> to see your model as a tree
</div><div class="align-self-center">

![Papyrus (eclipse) editor](_images/editor.png)
</div></div>

<hr class="sep-both">

## Tips and recommendations

<div class="row row-cols-md-2"><div>

#### Don't scroll in the property view

You can scroll to change the values of a field <small>(such as checked -> uncheck, or the type of your attribute, etc.)</small> when you are in the **Property view**. 

Unfortunately, you can't control it: you might change something or cancel everything you did by mistake ⚠️.

<br>

#### Modified file symbol

It's common, but there is a little star before every edited filename.

<div class="text-center">

![Papyrus saved](_images/saved.png)
</div>

<br>

#### Icons for Palette

The palette has quite a lot of elements. It's fasted and easier to change the palette view to a list of icons <small>(Right-click to change the view)</small>.

<div class="text-center">

![palette use icons](_images/icons.png)
![hover palette](_images/icons_hover.png)
</div>

</div><div>

#### Dark Mode

Navigate to `Window > Preferences` and set your settings.

<br>

#### Fast creation of items

From the palette, you can double-click on something to create a new element, there is no need to drag-and-drop it.

<br>

#### Align items

It's kinda useless but to create nicer diagrams, you may use "align" to cleanly arrange items of a diagram.

<div class="text-center">

![Align classes](_images/align.png)
</div>

Either by using this icon or <kbd>CTRL+{some arrow}</kbd>, **after selecting elements**, you can align every class based on the position of the last selected class. You can use "distribute" too.
</div></div>

<hr class="sep-both">

## Class diagrams in Papyrus

<div class="row row-cols-md-2"><div>

#### Associations

When selecting an association, directed associations are created by default. After using an undirected association, it will use these.

<div class="text-center">

![associations](_images/associations.png)
</div>

After creating an association, in the **Property view** you can add a direction, set the multiplicity, transform it to a composition or aggregation, etc. rather easily.

Near the corners of a class, wait a bit while your mouse is on a class and a shortcut to create associations will pop:

<div class="text-center">

![associations shortcut papyrus](_images/associations_shortcut.png)
</div>

#### Interfaces

As a reminder:

* ➡️ If a class implements/realizes an interface, then the head of the arrow is on the interface.
* ➡️ If a class extends/generalize another class, then the head of the arrow is on other class.
</div><div>

#### Types

When clicking on an attribute, there is a field "Type" inside the Property View. Click on "... > Tree > EPackage Primitive Types" and select your type.

![Set type Papyrus](_images/type.png)


**Notes**

* "Boolean [1]" after the type mean that the **cardinality** is **1** <small>(=this is a value, more than 1 means this is an array/a list/a queue/...)</small>
* You could drag and drop a class inside the field, instead of picking a primitive type.
* If you need to create a new type, use either `DataType` <small>(cannot be instanced)</small> or `Primitive type` or a class if none are what you want

#### Layout/Appearance

You can right-click on a class:

* **Reformat**: reformat what you selected
* **Filter**: show/hide attributes/operations/...
* You can also give colors to classes
* ...
</div></div>

<hr class="sep-both">

## Code Generation

<div class="row row-cols-md-2"><div>

#### Install deps

You need **papyrus.designer**, **Xtend IDE**, and **acceleo**.

<details class="details-n">
<summary>papyrus.designer</summary>

* Help > Install New Software
* Enter `https://ci.eclipse.org/papyrus/job/papyrus-designer-2020-06/lastSuccessfulBuild/artifact/releng/org.eclipse.papyrus.designer.p2/target/repository/` and press enter
* Select the first `Papyrus base elements for code generation`
* Select the first `Papyrus Java profile ...`
* Next (wait)
* Next
* "I accept" and Finish <small>(wait, check the bottom right of papyrus)</small>
* Restart <small>(when prompted)</small>
</details>

You'll then have to download a plugin for code generation:

<details class="details-n">
<summary>Xtend IDE 🍬</summary>

* Help > Install New Software
* Enter `https://download.eclipse.org/modeling/tmf/xtext/updates/composite/latest/` and press enter
* Select Xtend IDE inside XText
* Next (wait)
* Next
* "I accept" and Finish <small>(wait, check the bottom right of papyrus)</small>
* Restart <small>(when prompted)</small>
</details>

<details class="details-n">
<summary>Acceleo 🍫</summary>

Acceleo only generates code from class diagrams.

* Help > Install New Software
* Enter `https://download.eclipse.org/acceleo/updates/releases/3.7/R201911060712` and press enter
* Select Acceleo in Acceleo
* Next (wait)
* Next
* "I accept" and Finish <small>(wait, check the bottom right of papyrus)</small>
* Restart <small>(when prompted)</small>
</details>

#### Improve the generation

<p></p>

<details class="details-n">
<summary>Acceleo improvements</summary>

Get started by opening the file: `/org.eclipse.acceleo.examples.uml2java/` > src > `/org/eclipse/acceleo/examples/uml2java/main/uml2java.mtl`.
</details>

#### Runtime Eclipse

* Run > Run Configurations (or Debug Configurations)
* Double-click on Eclipse
* You may name the configuration "runtime_eclipse"
* Press Run (resp. Debug)
* And click on **proceed** if prompted.
</div><div>

#### Process With Code Generation

Inside the Runtime Eclipse:

* Import projects
* Existing Projects Into Workspace
* Browse > Find SMModel
* Once imported, double-click on the model

For **Xtend** 🍬, in the Model Explorer:

* Right-click on "Project XXX" <small>(your project)</small>
* Generate Code for State Machine
* Create JDT <small>(Yes > Set JDK to XXX > Finish)</small>

For **Acceleo** 🍫, in the Project Explorer:

* Expand "Project XXX" <small>(your project)</small> to see the UML file
* Right-click on the UML file
    * Acceleo Model To Text
    * Generate UML2java
* You got a folder **src-gen**

It will generate a new model with the generated Java classes 👑.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_IGL](igl/index.md)
* [Papyrus CEA Guide](https://www.eclipse.org/papyrus/resources/TutorialOnPapyrusUSE_d20101001.pdf)
* Warning: do not create an activity twice (use sync with editor, navigate to find it)
* Warning: in activities, every call must be Typed
</div><div>


</div></div>