# JavaFX

* School project
* [eden](https://github.com/lgs-games/eden).

The best way to make interfaces would be to use .fxml files. 
Install [Scene builder](https://gluonhq.com/products/scene-builder/), a software with a graphical interface to create your fxml.

Like in swing, you will have **layout managers** to group components

* `BorderPane`: screen split in NORTH, SOUTH, EAST, WEST, CENTER
* `FlowPane`: each component takes its preferred size
* `HBox`: add components horizontally
* `VBox`: add components vertically
* `GridPane`: a table (with cells, rows, and columns)
* ...

Simply drag and drop them, either in the **hierarchy** or in the **preview** tab. Then you can look and add components inside.

You may directly edit the properties of a components by clicking on it then inspecting them in the **inspector tab**.

* Properties
  * Disable: to disable a component <small>(like a button)</small>
  * Node orientation: you may do some tricks here if align does not work
  * Cursor: change the cursor on a button <small>(for instance)</small>
  * Style: add some css <small>(explained later)</small>
* Layout
  * margin: spacing between your component and the outside
  * padding: make as margin but with the component border
  * you may set the width/height here
* Code
  * you can add an ID here (if you want to use it in the code)
  * you may add event listeners here (function names) 

<hr class="sr">

## Labels

You will use labels to display text. You may group labels using a **TextFlow** (if you want to put a word in red in a sentence etc.).

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

If you put an image and a text inside a label, you can

* increase the gap between the two: Properties > Graphic text gap
* change the image position: Properties > Content display
  * left: image text
  * right: text image
  * ...
  * graphic only: image
  * text only: text

<hr class="sl">

## Creating a Controller

Each fxml file can have one controller. This is a class that will store the variable declared with an ID and the event listener functions that will be called when an event is fired if you need ones. For instance, an event would be click somewhere in the view.

First, create a Java class

```java
package com.lgs.eden.application;

public class WindowController {}
```

Then, in SceneBuilder, in the bottom-left corner, click on controller and add it

```none
com.lgs.eden.application.WindowController
```

You may now add your attributes and your functions

```java
package com.lgs.eden.application;

import javafx.fxml.FXML;
import javafx.event.ActionEvent;
import javafx.scene.layout.BorderPane;

public class WindowController {

    @FXML // title + minimize + close
    private BorderPane topPane;
    
    public void init(){
        // you can only use JavaFX after the constructor
        // has been called so you may use a method like this
        // one do some stuff    
    }
    
    @FXML
    private void onEventName(ActionEvent actionEvent) {}
```

* for the attribute topPane, it means that I put in my fxml an id "topPane" to a BorderPane.
* I can use the function "onEventName" (change the name according to what the function do) in my fxml

Example: on a button, in code section. To add a function executed when the button is clicked, I would write `onEventName` in `onAction`.

* Note: We are adding `@FXML` because the attribute/method is private. If that's not the case, then you don't need it. 
* Note: You may remove the event method argument if you are not planning to use it.

<hr class="sr">

## Starting coding

You main class must extends Application and call `launch`. Your code will be in `start`.

```java
public class Main extends Application {

    public static void main(String[] args) {
        // start
        launch(args);
    }

    @Override
    public void start(Stage primaryStage) {
        URL resource = Main.class.getResource("your_file.fxml");
        if (resource == null) /* ... */
            throw new IllegalStateException();

        FXMLLoader loader = new FXMLLoader(resource);

        // IF YOUR ROOT COMPONENT IS A BORDERPANE
        BorderPane b = null;
        try {
            b = loader.load();
        } catch (IOException | IllegalStateException e) {
            throw new IllegalStateException(e);
        }
        // get the controller
        WindowController controller = loader.getController();
        controller.init();
        
        Scene scene = new Scene(b, 800, 550);
        primaryStage.setScene(scene);
        primaryStage.show();
    }
}
```