# JavaFX in Eclipse

[Go back](../index.md)

This page is supposed to help you if you're having issues while installing JavaFX and SceneBuilder in Eclipse. If you don't know where to start, you must follow the [official tutorial](https://openjfx.io/openjfx-docs/#IDE-Eclipse). 

You may add notes below if needed,

* enter **fx** in the search bar to open a menu to add SceneBuilder path and JavaFX SDK path
* to start a JavaFX application
  * add into your configuration (in **VM** arguments)
  * ``--module-path /path/to/javafx/lib --add-modules javafx.controls,javafx.fxml``
  * with  **your path** instead of ``/path/to/javafx/lib``.