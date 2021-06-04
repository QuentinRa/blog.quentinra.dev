# IntelliJ

[Go back](index.md)

You can find some tutorial about
IntelliJ [here](../../../tools/jetbrains/index.md).

> do remember that IntelliJ can only run a file if all
> the project is working. That not our case so you
> will have to add the test classes one after another.

## easy setup

Remove the class `RunAllTests.java`
since you won't need it and it makes thing hard
but it's a useless class since we will run tests
using IDEA and not some java.

## real setup (2 minutes but tiring)

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