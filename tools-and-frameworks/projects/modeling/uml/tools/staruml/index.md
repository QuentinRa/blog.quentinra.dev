# StarUML

<div class="row row-cols-lg-2"><div>

[StarUML](https://staruml.io/) is a simple yet complete free UML design tool. 

* It supports the concept of **Models** 🏘️
* It supports more than 20 types of **diagrams** 🚀
* It supports **many symbols/elements** for each diagram 👌
* It has many **plugins** 🕹️ ; although some are not updated
  * UML to OpenAPI <small>(An API Specification)</small>
  * UML to Code <small>(C#, SQL, Python, TypeScript, Java, C++...)</small>
  * Code to UML <small>(C#, Java, C++...)</small>
  * ...
* ...

But it also has some bugs, including some annoying ones 🐛.
</div><div>

Once you have installed the software, run it. To start from a clean environment, click on "Model" and select "Delete From Model".

<div class="text-center">

![Base Editor Opened Model](_images/base_editor.png)
</div>

👉 StarUML projects files are `.mdj` files <small>(models + diagrams)</small>.
</div></div>

<hr class="sep-both">

## Editor Overview

<div class="row row-cols-lg-2"><div class="pt-2 mt-3">

![StarUML Editor](_images/software.png)

💡 The editor <small>(5)</small> is available after selecting an element, either from the view <small>(4)</small> or the model <small>(1)</small>.
</div><div class="mt-3">

The editor is divided into five windows.

1. **Model Explorer** 🌱: a model is a collection of diagrams. You can reuse something from a diagram in another diagram.

2. **Working Diagrams** 📇: all recently opened diagrams

3. **Toolbox** 🪛: UML elements available for the opened diagram

4. **View** 🖼️: the opened UML diagram. Click on an element from the toolbox and click somewhere in this window to add it.

5. **Editor** 🧑‍🍳: you can manipulate UML elements properties or add additional information such as documentation.

➡️ In the Model Explorer, "Untitled" is the project name.
</div></div>

<hr class="sep-both">

## Random Notes

<div class="row row-cols-lg-2"><div>

#### Export Diagram

You can export a diagram using `File > Export Diagram As`. The main drawback is that diagrams have an **Unregistered** background.

You can still take a screenshot of a diagram for a fast solution.

You could also use the SVG trick: export your diagram to SVG, remove all the `UNREGISTERED`, and convert it to PNG.
</div><div>

#### Do not trust the view

You can delete an element, but it will remain in the model, meaning:

* 🪲 If we use the model explorer to select an element, for instance, to edit it, then we may pick the wrong one
* 👻 If we want to reuse an element in another diagram, we may inadvertently use the wrong element
* 💩 You will still have them in the generated code

The model is the **only one you can trust**. Ensure it is up-to-date.
</div></div>