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

All diagrams are parts of a **model**. It allows us to connect diagrams and reuse what we defined in other diagrams inside each diagram.

#### XXX

...
</div><div>
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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old/index.md)
* [_IGL](igl/index.md)
</div><div>


</div></div>