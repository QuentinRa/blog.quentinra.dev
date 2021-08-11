# JavaFX

[Go back](..#graphical-interfaces)

JavaFx is a graphic library in Java. This is way better
than SWING because you can use ``.fxml`` files to
create the view and that makes your code way cleaner.

I started learning JavaFX with a 
[school project](../../../special/ilo/tchat/index.md).
After that, I practiced a lot on a 
[game launcher eden](https://github.com/lgs-games/eden).
Here is the 
[official tutorial to install JavaFX](https://openjfx.io/openjfx-docs/)
but you may check my school project if you have a problem.

<hr class="sl">

## .fxml

The best way to make interfaces would be to use
.fxml files. 
Install
[Scene builder](https://gluonhq.com/products/scene-builder/),
a software with a graphical interface to create your fxml.

Like in swing, you will have **layout managers** to group components

* ``BorderPane``: screen split in NORTH, SOUTH, EAST, WEST, CENTER
* ``FlowPane``: each component takes its preferred size
* ``HBox``: add components horizontally
* ``VBox``: add components vertically
* ``GridPane``: a table (with cells, rows, and columns)
* ...

Simply drag and drop them, either in the 
**hierarchy** or in the **preview** tab. Then
you can look and add components inside.

You may directly edit the properties of a components
by clicking on it then inspecting them in the
**inspector tab**.

* Properties
  * Disable: to disable a component
    <span class="tms">(like a button)</span>
  * Node orientation: you may do some tricks here if align does not work
  * Cursor: change the cursor on a button
    <span class="tms">(for instance)</span>
  * Style: add some css
    <span class="tms">(explained later)</span>
* Layout
  * margin: spacing between your component and the outside
  * padding: make as margin but with the component border
  * you may set the width/height here
* Code
  * you can add an ID here (if you want to use it in the code)
  * you may add event listeners here (function names) 

<hr class="sr">

## Labels

You will use labels to display text. You may group
labels using a **TextFlow** (if you want to put a word
in red in a sentence etc.).

Right after the input field "Text" in properties,
on a same line, you can make a little cogs appear.
This cogs allow you to make localized strings, that you
will use later to make your application in many
languages.

* ``%key`` (enter a key)
* create a file ``i18n_en.properties``
* add ``key=the translation here for key``
* you may create as many files as you want
* in your code, you will have to add this line (see next part)

```java
FXMLLoader loader = new FXMLLoader(resource);
loader.setResources(ResourceBundle.getBundle("i18n", locale));
// ...
```

If you put an image and a text inside a label, you can

* increase the gap between the two: Properties > Graphic text gap
* change the image position: Properties > Content display
  * left: image text
  * right: text image
  * ...
  * graphic only: image
  * text only: text