# ILO

ILO is not an easy course so you will need strength
or backup in order to master it, or just survive in it.

## First practical class

If you do have a TP using JUnit3/JUnit4 called
"TP FIGURES" then use another IDE than eclipse. It will
help you understand a lot of your mistakes, especially
if you use ``IntelliJ`` that is really good at finding
potential mistakes and providing a patch.

**VSCode**

In order to do it in ``VSCode``, you should
simply open it and that's okay.

**IntelliJ**

You can find some tutorial about 
IntelliJ [here](../../tools/jetbrains/index.md).

Either remove the class `RunAllTests.java`
since you won't need it since you got an IDE.

Or do this but that's a waste of time

* open ``Project Structure`` (CTRL+ALT+MAJ+S)
* then libraries
* then click on add from maven
* import all theses
  
    * ``org.junit.platform:junit-platform-suite-api:1.7.0``
    * ``org.junit.jupiter:junit-jupiter-engine:5.7.0``
    * ``org.junit.platform:junit-platform-launcher:1.7.0``
    * ``org.junit.vintage:junit-vintage-engine:5.7.0``
    * ``org.junit.platform:junit-platform-runner:1.7.0``
* do not add all the files of the teacher at once since in that
case you won't be able to test without coding everything
since IDEA only compile if everything is working.

## TP CHAT

...