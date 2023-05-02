# JavaFX

* School project
* [eden](https://github.com/lgs-games/eden).

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

Example: on a button, in code section. To add a function executed when the button is clicked, I would write `onEventName` in `onAction`.

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