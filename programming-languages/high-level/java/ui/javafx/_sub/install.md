# Install JavaFX and Scene Builder

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

The [official installation instructions](https://openjfx.io/openjfx-docs/) 🚀 are a quite complete, but it may be useful to add additional approaches if they don't work for you.

#### IntelliJ IDEA 2023 - JavaFX

* Navigate to `Project Structure > Libraries`
* Click on `+` > `From Maven`
  * Enter `org.openjfx:javafx-fxml:18` for version `18`
  * You should check `sources` and `javadoc` for a better experience
* 🍔 Navigate to `Edit Configurations`
    * press `ALT-V` to show VM options input field
    * write inside `--module-path lib --add-modules javafx.controls,javafx.fxml`

<br>

#### IntelliJ IDEA 2020 - JavaFX

* Navigate to `Project Structure > Libraries`
* Click on `+` > `From Maven`
  * Enter `org.openjfx:javafx-fxml:16` for version `16`
  * Enable the "Download to" option leading to the `lib` folder
* 🍔 Navigate to `Edit Configurations`
  * press `ALT-V` to show VM options input field
  * write inside `--module-path lib --add-modules javafx.controls,javafx.fxml`

<br>

#### IntelliJ IDEA - Scene Builder

* Navigate to `Settings > Languages & Frameworks > JavaFX`
* Select the PATH leading to the installed Scene Builder
* 🐄 Use `new > FXML file` to create an FXML file
* 🍔 Right-click on a FXML and select `Open in SceneBuilder` to...
</div><div>

#### Visual Studio - JavaFX

➡️ Refer to this [video](https://www.youtube.com/watch?v=H67COH9F718).

* Install JavaFX plugin
* Navigate to view `View > command palette` and create a project
* Download JavaFX [jars](https://mvnrepository.com/artifact/org.openjfx) and put them in `lib`
* 🍔 Navigate to `Run > add configuration > Java`
  * Append to the generated file: `"vmArgs": "--module-path lib --add-modules javafx.controls,javafx.fxml",`
</div></div>