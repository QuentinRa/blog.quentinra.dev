# JavaFX

<div class="row row-cols-md-2"><div>

[JavaFX](https://openjfx.io/) is an open-source java library to create graphical interfaces.

JavaFX views are stored `.fxml` files usually created using [Scene Builder](https://gluonhq.com/products/scene-builder/) 🛝 which is a `WYSIWYG` editor <small>(What You See Is What You Get)</small>.

* [Official installation instructions](https://openjfx.io/openjfx-docs/) 🚀
* [Official Javadoc](https://openjfx.io/javadoc/20/) 🌿
* [My notes to install JavaFX and Scene Builder](_sub/install.md)
</div><div>
</div></div>

<hr class="sep-both">

## SceneBuilder

<div class="row row-cols-md-2"><div>

[Scene Builder](https://gluonhq.com/products/scene-builder/) is a Java editor to edit [FXML](#fxml) files. 

![Scene Builder Main Frame](_images/mf.png)
</div><div>

1. **Library** 📚: a searchable list of [components](#components). You can drag and drop then inside "2" or "4".
2. **Hierarchy** 🗃️: the tree representation of your XML. You can rename/move/duplicate/delete components from there.
3. **Controller** 🚸: you can bind a [controller](#controllers) here
4. **Scene** 🖍️: you can preview your interface here. You can move components within the interface too.
5. **Inspector** 👮‍♀️: when selecting a component <small>(in "2" or "4")</small>, you will be able to edit its properties here. <small>(ex: change the background color)</small>
6. **MenuBar** 📂: the `Preview` menu is quite handy

The inspector is subdivided in 3 sections:

* **Properties**: set a value/text, check/uncheck, show/hide, css...
* **Layout**: to set margins, padding, size, alignment...
* **Code**: to add a `fxid` or link a method from a [controller](#controllers)
</div></div>

<hr class="sep-both">

## FXML

<div class="row row-cols-md-2"><div>

FXML files are [XML](/programming-languages/others/data/xml.md) files with a syntax specific to JavaFX ☕. A starter FXML file using a [BorderPane](https://openjfx.io/javadoc/20/javafx.graphics/javafx/scene/layout/BorderPane.html) as the **root** could be:

```xml!
<?xml version="1.0" encoding="UTF-8"?>
<?import javafx.scene.layout.BorderPane?>
<BorderPane prefHeight="600" prefWidth="800" xmlns="http://javafx.com/javafx/18" xmlns:fx="http://javafx.com/fxml/1">
</BorderPane>
```

➡️ You usually don't edit the FXML manually, and use [SceneBuilder](#scenebuilder) instead. Some exceptions are copy-paste and buggy views.
</div><div>

...
</div></div>

<hr class="sep-both">

## Components

<div class="row row-cols-md-2"><div>

There are **layout** to organize components within the screen, such as:

* 🐼 [BorderPane](https://openjfx.io/javadoc/20/javafx.graphics/javafx/scene/layout/BorderPane.html): view split in five <small>(North, South, East, West, Center)</small>
* 📚 [VBox](https://openjfx.io/javadoc/20/javafx.graphics/javafx/scene/layout/VBox.html): items one below the other
* 🚸 [HBox](https://openjfx.io/javadoc/20/javafx.graphics/javafx/scene/layout/HBox.html): items one next to the other
* ❄️ [Pane](https://openjfx.io/javadoc/20/javafx.graphics/javafx/scene/layout/Pane.html): place components arbitrarily, not responsive
* 🗃️ [FlowPane](https://openjfx.io/javadoc/20/javafx.graphics/javafx/scene/layout/FlowPane.html): each component takes its preferred size
* 🖍️ [GridPane](https://openjfx.io/javadoc/20/javafx.graphics/javafx/scene/layout/GridPane.html): a table <small>(with cells, rows, and columns)</small>
* ...
</div><div>

Components can be layout managers or **views**. It means you can put a layout inside a layout, or a view otherwise. Some views include:

* `XXX`:
* `XXX`:
* `XXX`:
* `XXX`:
* `XXX`:
* `TextFlow`: a group of Labels. Used to show a text with some labels having different size/colors/...
* ...
</div></div>

<hr class="sep-both">

## Controllers

<div class="row row-cols-md-2"><div>

Each [FXML](#fxml) file can have up to one controller. A controller is a class that can link a view with the code. We can:

* 📚 Manipulate a view from the code
* 🎉 Handle events

You have to add the `fx:controller` to the root element in the FXML. You can do it from the bottom-left corner of SceneBuilder.

```xml!
<XXX ... fx:controller="xxx.XXXController" ...>
```

➡️ In the example above, `xxx.XXXController` means the class `XXXController` in the package `xxx`.

...
</div><div>

```java
package xxx;

import javafx.fxml.FXML;
import javafx.event.ActionEvent;
import javafx.scene.layout.BorderPane;

public class XXXController {
    @FXML
    private BorderPane xxx;
    
    public XXXController() {} // xxx is null
    public void init() {} // xxx won't be null
    
    @FXML
    private void onEventName(ActionEvent actionEvent) {}
}
```

➡️ `@FXML` is only required if the member is `private`.

➡️ `ActionEvent actionEvent` can be removed if unused.
</div></div>

<hr class="sep-both">

## Main

<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## Style 🍔

<div class="row row-cols-md-2"><div>

#### Icon next to a text

Drag-and-Drop an image inside a Button/Label/... Select the label, and in the inspector, navigate to Properties:

* Use `Graphic Text Gap` to add gab between the image and the text
* Use `Content Display` to move the image around. You can select `GRAPHIC_ONLY` or `TEXT_ONLY` to only show one of them.
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
* [old ENS](_f/index.md)
* note vscode
</div><div>

<details class="details-n">
<summary>Localization</summary>

Right after the input field "Text" in properties, on a same line, you can make a little cogs appear. This cogs allow you to make localized strings, that you will use later to make your application in many languages.

* `%key` (enter a key)
* create a file `i18n_en.properties`
* add `key=the translation here for key`
* you may create as many files as you want
* in your code, you will have to add this line (see next part)

```java
FXMLLoader loader = new FXMLLoader(resource);
loader.setResources(ResourceBundle.getBundle("i18n", locale));
// ...
```
</details>
</div></div>