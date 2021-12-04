# Running your tests

[Go back](../index.md#td10---tests)

This section is supposed to help your getting started and running your tests.

<hr class="sl">

## Starting from the teacher generated sources

* Open a Papyrus (I'm using 4.8.0 without any plugins/... for reference)
* Create a new Java project
* You may switch to Java Perspective
* Click on src > show in > system explorer
* Copy the second of the src folder in [xtend generated sources](https://raw.githubusercontent.com/memorize-code/memorize-references/main/special/igl/GeneratedCodefromDesigner.zip), inside our src folder
* Right-click on our src > refresh
* Follow the steps in the next section

<hr class="sl">

## Starting from your sources

If you are starting with **your** generated sources, then you are almost good.

* Right-click on your root folder > new > Source folder > "tests"
* Create packages `testvalidation`/`testunitaire` inside
* Create a class:  `testvalidation` > `TestStartTemperatureManager`

```java
public class TestStartTemperatureManager {
	@Test
	public void SampleTest() {
	}
}
```

* Then, hover "Test", and either fix it by adding JUnit4 or **Junit5** in the class path
* Complete the method (**use CTRL+space** for autocompletion)

```java
// import org.junit.jupiter.api.Assertions;
@Test
public void SampleTest() {
	Assertions.assertTrue(true);
}
```

* Right-Click on the file in the explorer > Run as > JUnit Test
* **Done**