# JavaFX in VSCode

[Go back](../index.md)

This is a tutorial helping you in setting up JavaFX in VSCode. You're supposed to install SceneBuilder by yourself, as we are using them separately. This tutorial was made [from this video](https://www.youtube.com/watch?v=H67COH9F718). It didn't work for us, but it greatly helped.

* install JavaFX plugin
* `View > command palette`
    * create a new project
    * no build tool
    * select folder
    * give it a name
* *project is opening*
* copy the content of the teacher ``src`` folder into your ``src`` folder and remove `App.java`
* in lib folder, copy JavaFX source
  * version 16 [here](https://github.com/memorize-code/memorize-references/raw/main/special/ilo/javafx-lib-v16.zip)
  * otherwise try <https://gluonhq.com/products/javafx/>
  * otherwise, you got them here 
    * [mvn rep](https://mvnrepository.com/artifact/org.openjfx)
    * click on a file you want (ex: javafx-controls)
    * click on the version (ex: 16)
    * then bellow license and date, you got file > jar
    * check my files in version 16 to know what files you need
* menu bar, `Run > add configuration` then Java
* open the new file and add at the end 

```
"vmArgs": "--module-path lib --add-modules javafx.controls,javafx.fxml",
"args": "--name NAME"
```

You will have something like that with a different `projectName`.

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "java",
            "name": "Launch Current File",
            "request": "launch",
            "mainClass": "${file}"
        },
        {
            "type": "java",
            "name": "Launch Main",
            "request": "launch",
            "mainClass": "application.Main",
            "projectName": "tchat4_6ffacbf5",
            "vmArgs": "--module-path lib --add-modules javafx.controls,javafx.fxml",
            "args": "--name NAME"
        }
    ]
}
```

Then start it using the green arrow or the run menu.