# IntelliJ - Setup TP FIGURES

[Go back](index.md)

This tutorial should help if you are having trouble, with the test classes (they are in red, you can't run nor compile the project). You can find a [tutorial about IntelliJ  here](../../../tools/jetbrains/index.md).

> do remember that IntelliJ can only run a file if all the project is working. That is not our case so you will have to add the test classes one after another.

<hr class="sl">

## easy setup

Remove the file `RunAllTests.java` since you won't need it, and it makes things hard. It's a useless class because we will run our tests using IntelliJ and not some java class.

<hr class="sr">

## real setup

That's a waste of time, but well...

* open ``Project Structure`` (CTRL+ALT+MAJ+S)
* go to libraries
* then click on "add" or "+" then "from maven"
* and one by one, add these
    * ``org.junit.platform:junit-platform-suite-api:1.7.0``
    * ``org.junit.jupiter:junit-jupiter-engine:5.7.0``
    * ``org.junit.platform:junit-platform-launcher:1.7.0``
    * ``org.junit.vintage:junit-vintage-engine:5.7.0``
    * ``org.junit.platform:junit-platform-runner:1.7.0``

Of course, you can change the version.