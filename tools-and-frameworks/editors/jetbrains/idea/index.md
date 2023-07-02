# IntelliJ IDEA

<div class="row row-cols-md-2"><div>

[IntelliJ IDEA](https://www.jetbrains.com/idea/) is a **Java** <small>(Maven, Gradle, JavaFX, Junit)</small> and **Kotlin** IDE powered by JetBrains in a **free** and a **paid** version.

<p class="text-center">
<img src="/courses/tools-and-frameworks/editors/jetbrains/idea/_images/logo.png" width="100"/>
</p>

👉 JetBrains IDEs share many features [explained here](../_general/index.md).
</div><div>

**Features**

* 🌱 can easily install Java JDKs, and switch between versions
* 🚀 recognize old code snippets and suggest upgrades
* 🔥 recognize common mistakes and suggest fixes
* ⏳ can generate common code snippets <small>(equals, getters...)</small>
* ...
</div></div>

<hr class="sep-both">

## Product-specific features

<div class="row row-cols-md-2"><div>

#### Java JDKs

Press `CTRL+ALT+MAJ+S` or `⚙️ > Project Structure`. 

Navigate to the `Project` tab. From there, you can **download** a JDK, or **select** the JDK used for this project.

#### Add libraries

Press `CTRL+ALT+MAJ+S` or `⚙️ > Project Structure`.

Navigate to the `Libraries` tab. Click on `+`. By selecting "Java", you can import JARs. By selecting maven, you can download JARs from [maven repository](https://mvnrepository.com/) <small>(use the search bar within the IDE)</small>.

#### Junit

IDEA natively supports [JUnit5](https://www.jetbrains.com/help/idea/junit.html). Simply write a `@Test` in a class, then they will prompt you to import JUnit5.

For JUnit4, [you need to do it manually](stuff/junit4.md).
</div><div>

#### Configurations

Similarly to other software, there are configurations were we can set which **javac/java options**, **program arguments**...

![configurations-idea](_images/edit_conf.png)

Once inside, not all fields are shown. For instance, to see `javac` options, you need to click on `Modify options > add VM options`.

</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
</div><div>


</div></div>