# Papyrus

<div class="row row-cols-lg-2"><div>

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

<div class="row row-cols-lg-2"><div>

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

<div class="row row-cols-lg-2"><div class="mt-4">

1. **Project explorer** 📂: Double-click on a model to open it
    * Export your diagrams <small>(right-click on model -> export)</small>
    * Open your project in the file explorer <small>(right-click on the folder "example" and "show in")</small>
2. **Model explorer** 🍀: Once you open a model, add diagrams to it from this menu: Right-click on "example" > "New diagram".
3. **Model editor** 🎥: edit your diagram here. You can move things from the palette (4) to here.
4. **Palette** 🎨: every element that you can put inside the kind of diagram you opened.
5. **Property view** 🔐: Edit the properties of what you selected
    * ex: give another name to a class
    * ex: give a type to an attribute
    * ex: write some documentation
    * etc.
6. **Outline view** 🌍: you can move faster in the model editor view using the Outline tab.
    * You can use it to view your diagram from afar
    * You can change the outline view <small>(by clicking on the tree-like icon)</small> to see your model as a tree
</div><div class="align-self-center mt-4">

![Papyrus (eclipse) editor](_images/editor.png)
</div></div>

<hr class="sep-both">

## Tips and recommendations

<div class="row row-cols-lg-2"><div>

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

The palette has quite a lot of elements. It's faster and easier to change the palette view to a list of icons <small>(Right-click to change the view)</small>.

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

It's kind of useless, but to create nicer diagrams, you may use "align" to cleanly arrange items in a diagram.

<div class="text-center">

![Align classes](_images/align.png)
</div>

Either by using this icon or <kbd>CTRL+{some arrow}</kbd>, **after selecting elements**, you can align every class based on the position of the last selected class. You can use "distribute" too.
</div></div>

<hr class="sep-both">

## Class diagrams in Papyrus

<div class="row row-cols-lg-2"><div>

#### Associations

When selecting an association, directed associations are created by default. After using an undirected association, it will use these.

<div class="text-center">

![associations](_images/associations.png)
</div>

After creating an association, in the **Property view** you can add a direction, set the multiplicity, transform it into a composition or aggregation, etc. rather easily.

Wait a bit while your mouse is on top of a class, and a shortcut to create associations will pop up:

<div class="text-center">

![associations shortcut papyrus](_images/associations_shortcut.png)
</div>

#### Interfaces

As a reminder:

* ➡️ If a class implements/realizes an interface, then the head of the arrow is on the interface.
* ➡️ If a class extends/generalizes another class, then the head of the arrow is on the other class.

#### Layout/Appearance

You can right-click on a class:

* **Reformat**: reformat what you selected
* **Filter**: show/hide attributes/operations/...
* You can also give colors to classes
* ...
</div><div>

#### Types

When clicking on an attribute, there is a field "Type" inside the Property View. Click on "... > Tree > EPackage Primitive Types" and select your type.

![Set type Papyrus](_images/type.png)

**Notes**

* "Boolean [1]" after the type means that the **cardinality** is **1** <small>(=this is a value, more than 1 means this is an array/a list/a queue/...)</small>
* You could drag and drop a class inside the field, instead of picking a primitive type.
* If you need to create a new type, use either `DataType` <small>(cannot be instanced)</small> or `Primitive type` or a class if none are what you want

**External Types**

In Java, you may use classes such as `java.util.Arrays` in your diagrams. ⚠️ It's complicated to do it properly.

<details class="details-n">
<summary>Initial Configuration</summary>

* Navigate to the model explorer and click on the root
* Go to **Profile** > Profile Applications
    * Next to "+" and "x", click on "apply registered profile"
        * Add "Papyrus Code Generation Profile"
        * Add "Papyrus Java Profile"
* Add a new package (new child) "ExternalTypes". Click on it, then Profile, then Applied Stereotypes, and add NoCodeGen.
* Create a stereotype <small>(Profile > +)</small> "External".
* Create a new class diagram called "Dependencies".
</details>

<details class="details-n">
<summary>Step per dependency</summary>

* Add your classname if the "External" Stereotype
* Add your class to the diagram along with the external class
* Create a usage relationship to request an import <small>(A to B means A imports B)</small>.
</details>
</div></div>

<hr class="sep-both">

## Code Generation

<div class="row row-cols-lg-2"><div>

#### Install dependencies

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

You may also have to edit `org.eclipse.acceleo.module.sample` > src > `org/eclipse/acceleo/module/sample/`.

<details class="details-n">
<summary>Code samples</summary>

```text!
[for (p : Package | aModel.nestedPackage->sortedBy(name))]
	[comment DONE then display Package's name/]
	Package [p.name/]
	[comment DONE and indent classes and interfaces names/]
	[for (c : Class | p.packagedElement->filter(Class)->sortedBy(name))]
		[generateClassElement(c)/]
	[/for]
	[for (i : Interface | p.packagedElement->filter(Interface)->sortedBy(name))]
		[generateInterfaceElement(i)/]
	[/for]
[/for]
```

For file: `common/fileUtils.mtl`.

```xml!
[**
 * Generates the type in Java given an OCL type
 * @param aType The OCL Type
 */]
[template public genType(aType : String)]
[if (aType.toUpperFirst() = 'Real')]Float[else][aType.toUpperFirst()/][/if]
[/template]
```

You then need to use your newly created function everywhere:

* use `genType(aProperty.type.name)`
    * instead of `aProperty.type.name`
    * or instead of `aProperty.type.name.toUpperFirst()`
* of course, sometimes the variable isn't called aProperty

The locations are

* **classJavaFile**: fields (1), operations (1), parameters (1), accessors (2)
* **interfaceJavaFile**: genInterfaceJavaFile (1), parameters (1)
</details>
</details>

<details class="details-n">
<summary>Support NoCodeGen</summary>

The **NoCodeGen** attribute is ignored during code generation. In `ClassUtils.java`, `requiredClassifiers`, before the return:

```java
// import
// import org.eclipse.papyrus.designer.languages.common.profile.Codegen.NoCodeGen;
EList<Classifier> usedClassesReturn = new UniqueEList<Classifier>();
for(Classifier c : usedClasses) {
	if (!GenUtils.hasStereotypeTree(c, NoCodeGen.class)) {
		usedClassesReturn.add(c);
	}
}
```

Edit **noCodeGen** in **JavaModelElementsCreator**.

```diff
- GenUtils.hasStereotypeTree(element, ExternLibrary.class) ||
+ GenUtils.hasStereotypeTree(element, ExternLibrary.class) &&
+ GenUtils.hasStereotypeTree(element, NoCodeGen.class);
```
</details>

<details class="details-n">
<summary>Support Code Generation From The Diagram</summary>

<br>

<details class="details-n">
<summary>Inside a diagram, add the implementation</summary>

* Right-click on a class
* New Child > Opaque Behavior > Owned ...
* Name it (ex: `getXXX`)
* Language > + > Java
* Write some code
```java
// todo
return false;
```
* Click on a method (ex: `getXXX`)
* In UML, look for the field Method
* Add your Opaque Behavior
</details>

<details class="details-n">
<summary>Default implementation in the generator</summary>

You must change the return type so that it is always a class <small>(ex `float` is now `Float`)</small>. The default behavior will be to **return null**, but only if this is not a constructor nor a method returning void.

In **JavaOperations.xtend**, in **javaReturnSpec**

```diff
- JavaGenUtils.javaQualifiedName(operation.type, operation.owner) + ' ' 
+ JavaGenUtils.javaQualifiedName(operation.type, operation.owner).toFirstUpper() + ' '
```

And in **javaOperationDeclaration**

```diff
- «IF mustGenerateBody(operation)»«JavaOperations.javaOperationImplementation(operation)»«ENDIF»
+ «IF mustGenerateBody(operation)»«JavaOperations.javaOperationImplementation(operation)»
+ «IF javaReturnSpec(operation) != 'void ' && !isConstructor(operation)»return null;«ENDIF»«ENDIF»
```
</details>
</details>

<details class="details-n">
<summary>Acceleo: improve import support</summary>

An easy way to do this is to hard code the import, by adding some lines in **genDefaultImport** inside **common/fileUtils.mtl**

```java
[template public genDefaultImport(aType : Type)]
// [protected ('for imports')]
import java.util.*;
// [/protected]
[/template]
```

The problem with this is that it doesn't work for your classes as they are not within a package.

In **fileUtils**, edit these two functions with

```diff
[template private packagePath(aType : Type)]
- [ /* something */ /]
+ ['/' + aType.getSourcePackage() + '/' + /* something */ /]
[/template]

[template public genPackageValue(aType : Type)]
- [ /* something */ /]
+ [aType.getSourcePackage() + '.' + /* something */ /]
[/template]
```

And create the template **getSourcePackage**

```java
[template public getSourcePackage(aType : Type)]
[aType.getModel().name/]
[/template]
```
</details>

<details class="details-n">
<summary>Handle Duplicate Methods</summary>

Obviously, this is a problem in your model, but you can edit **classJavaFile**, template **operations**

```diff
- [for (anOperation : Operation | aClass.getOperations()->union(aClass.getImplementedInterfaces().ownedOperation))]
+ [for (anOperation : Operation | aClass.getOperations())]
```
</details>

<details class="details-n">
<summary>Do not generate External Classes</summary>

Wrap the code generating aClass inside this if. You can trick this code to make it work with other templates.

```java
[let c : Classifier = aClass.oclAsType(Classifier)]
[if (c.getAppliedStereotypes()->collect(name)->count('External') = 0)]
[/if]
[/let]
```
</details>

</div><div>

#### Runtime Eclipse

* Run > Run Configurations (or Debug Configurations)
* Double-click on Eclipse
* You may name the configuration "runtime_eclipse"
* Press Run (resp. Debug)
* And click on **proceed** if prompted.

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

<div class="row row-cols-lg-2"><div>

* [Papyrus CEA Guide](https://www.eclipse.org/papyrus/resources/TutorialOnPapyrusUSE_d20101001.pdf)
* Warning: do not create an activity twice (use sync with editor, navigate to find it)
* Warning: in activities, every call must be Typed
</div><div>


</div></div>