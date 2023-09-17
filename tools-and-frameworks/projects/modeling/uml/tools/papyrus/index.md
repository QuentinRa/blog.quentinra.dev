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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old/index.md)
* [_IGL](igl/index.md)
</div><div>


</div></div>