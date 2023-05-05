# JavaFX

* School project
* [eden](https://github.com/lgs-games/eden)

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