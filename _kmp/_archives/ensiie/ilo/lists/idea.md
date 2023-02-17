# IntelliJ - Setup TP LIST

[Go back](index.md)

This is a tutorial to set up the project "TP LISTS" in IntelliJ 2021 or newer. This should also work in older version (not tested).

* Start IntelliJ
* Click on "Open"
* Go to Project Structure (CTRL+ALT+SHIFT+S)
* Modules > Import
* Select the "TP LISTS" folder
* "Import module from external model" > Next
* Select "Link created IntelliJ ..." > Next > Next > Finish
* Remove JUnit5 and set "Dependencies Storage format" to ".iml"
* Libraries > From Maven
* and one by one, add these
    * `org.junit.platform:junit-platform-suite-api:1.7.0`
    * `org.junit.jupiter:junit-jupiter-engine:5.7.0`
    * `org.junit.platform:junit-platform-launcher:1.7.0`
    * `org.junit.vintage:junit-vintage-engine:5.7.0`
    * `org.junit.platform:junit-platform-runner:1.7.0`
* Apply

In IntelliJ, you cannot run a class, if there is a problem in the project. It means that we must move the classes that aren't compiling yet. Move

* TestListe.java
* CollectionListTest.java
* CollectionList.java

To some temporary folder (ex: `_tmp`), outside of `src`.

* Go To `AllTests.java` and comment `CollectionListTest.class`