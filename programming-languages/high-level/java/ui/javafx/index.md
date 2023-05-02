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

...
</div><div>

...
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

...
</div><div>

...
</div></div>

<hr class="sep-both">

## Design interfaces

<div class="row row-cols-md-2"><div>

There are **layout managers** to organize components within the screen, such as:

* 🐼 [BorderPane](https://openjfx.io/javadoc/20/javafx.graphics/javafx/scene/layout/BorderPane.html): split in five <small>(North, South, East, West, Center)</small>
* 📚 [VBox](https://openjfx.io/javadoc/20/javafx.graphics/javafx/scene/layout/VBox.html): items one below the other
* 🚸 [HBox](https://openjfx.io/javadoc/20/javafx.graphics/javafx/scene/layout/HBox.html): items one next to the other
* ❄️ [Pane](https://openjfx.io/javadoc/20/javafx.graphics/javafx/scene/layout/Pane.html): no responsive, place views arbitrarily
* 🗃️ [FlowPane](https://openjfx.io/javadoc/20/javafx.graphics/javafx/scene/layout/FlowPane.html): each view takes its preferred size
* 🖍️ [GridPane](https://openjfx.io/javadoc/20/javafx.graphics/javafx/scene/layout/GridPane.html): a table <small>(with cells, rows, and columns)</small>
* ...

...
</div><div>

...
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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
* [old ENS](_f/index.md)
* note vscode
</div><div>


</div></div>