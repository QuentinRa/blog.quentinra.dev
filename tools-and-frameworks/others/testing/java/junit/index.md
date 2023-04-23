# JUnit

<div class="row row-cols-md-2"><div>

JUnit is a well-known testing library in Java. 

* ☠️ [JUnit4](https://github.com/junit-team/junit4/wiki/) <small>([download](https://mvnrepository.com/artifact/junit/junit), [hamcrest library](https://mvnrepository.com/artifact/org.hamcrest/hamcrest-all/1.3))</small>
* 🌹 [JUnit5](https://junit.org/junit5/docs/current/user-guide/) <small>(a.k.a. Jupiter, [download](https://mvnrepository.com/artifact/org.junit.platform))</small>

JUnit5 is a bit less straightforward to use, and unlike JUnit4 where there is only one file, the code was divided into modules, so you need to find and download the ones you need.

You will usually put every required `.jar` in a folder "`libs`". To find the JUnit5 `jar` you need, check the path of the import in the code.
</div><div>

JUnit4

```ps
$ javac -cp ".:libs/*" XXXTest.java
$ java -cp ".:libs/*" org.junit.runner.JUnitCore XXXTest
```

JUnit5

```
$ javac -d out -cp ".:/libs/*" XXXTest.java
$ java -jar junit-platform-console-standalone.jar -cp "out" --scan-classpath
```
</div></div>

<hr class="sep-both">

## JUnit4

<div class="row row-cols-md-2"><div>

In JUnit4, it was common to have a class to run all tests.

```
public class RunAllTests {
	public static void main(String[] args) {
		Result result = JUnitCore.runClasses(XXXTest.class, YYYTest.class);
		if(result.wasSuccessful()) {
			System.out.println("All tests passed.");
		} else {
			for (Failure failure : result.getFailures()) {
				System.err.println("Failure : " + failure.toString());
			}
		}
	}
}
```
</div><div>

If your IDE can run them, it's shorter and better to run suites:

```java
@RunWith(Suite.class)
@SuiteClasses({XXXTest.class, YYYTest.class})
public class AllTests {}
```

To move to/from JUnit5, you will most likely have to only replace the import with JUnit4 imports <small>(if classes/methods still exist)</small>:

```java
import org.junit.Assert;
import org.junit.Test;
```
</div></div>

<hr class="sep-both">

## JUnit5

<div class="row row-cols-md-2"><div>

Since JUnit5, there is no easy way to have a main class running all tests. You can run multiple classes using:

```java
@Suite
@SelectClasses({XXXTest.class, YYYTest.class})
public class AllTests {}
```

🍵 Required: `jupiter-api`, `platform-commons`, `platform-suite-api`, `platform-suite-engine`, `platform-suite-commons`.
</div><div>

To move to/from JUnit4, you will most likely have to only replace the import with JUnit5 imports <small>(if classes/methods still exist)</small>:

```
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
```

➡️ Notice that we use `api`, so you need the `xxx-api.jar`.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Defensive programming](tests/dp.md)
* [assert in Java](tests/asserts.md)
* [Write some tests](tests/code.md)
* [Tests suite](tests/suite.md)
* [Parametric tests](tests/par.md)
* [JUnit5 JB](https://blog.jetbrains.com/idea/2020/09/writing-tests-with-junit-5/)
</div><div>

* Maven
* Idea note

```
-junit5 pkg.AClass,aTest
```

<details class="details-n">
<summary>JUnit4</summary>

```java
@RunWith(JUnitPlatform.class)
@SelectClasses({anotherClass.class})
// @SelectPackages("tests")
// @SelectPackages({"tests"})
public class MaClasse {

}
```

```java
@RunWith(Suite.class) ;
@Suite.SuiteClasses({ TestClass.class, ... });
public class MyClass {}
```
</details>
</div></div>