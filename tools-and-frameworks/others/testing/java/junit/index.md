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
        if (result.wasSuccessful()) {
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

## Assertions

<div class="row row-cols-md-2"><div>

JUnit use assertions in its tests. They are defined in the package `Assertions` <small>(JUnit5)</small> or `Assert` <small>(JUnit4)</small>.

An assertion is a function call that will test something, and raise an exception if the check failed.

```java
// true if equals
Assertions.assertEquals(Object, Objet);
// true if the condition is true
Assertions.assertTrue(condition);
// true if the condition is false
Assertions.assertFalse(condition);
// true if null
Assertions.assertNull(objet);
// true if not null
Assertions.assertNotNull(Objet);
```
</div><div>

```java
// true if ==
Assertions.assertSame(Object, Object);
// true if !=
Assertions.assertNotSame(Object, Object)
// true if Arrays are equals
Assertions.assertArrayEquals(t1,t2);
// true if exception got thrown,
// method must be a Runnable
assertThrows(NomException.class, methode);
// fail
fail()
```

Every assert method has an argument usually called `message` to send with the Exception a pertinent error message.
</div></div>

<hr class="sep-both">

## Test suites

<div class="row row-cols-md-2"><div>

Test suite are java classes with tests. Most test methods are named starting with `test[...]`. They are annotated with `@Test`.

```java
public class XXXTest {
    @Test
    public void testAAA() {
        Assertions.assertTrue(true);
    }
}
```

According to the JUnit version, you can add some annotation to refine how your test is handled by JUnit.

* `@DisplayName("XXX")`: name displayed by the runner
* `@Test(expected = XXX.class)`: the test must raise an exception
* `@Test(timeout = xxx)`: test fails if longer than timeout
* `@Disabled`: don't run this test
</div><div>

Test suits are usually grouping tests, testing the same method or class. We may have to preprare things before running tests:

```java
public class TestSuite {
    // before/all ALL tests
    @BeforeAll
    public static void classInit(){ /* set attributes */ }
    @AfterAll
    public static void classFree(){ /* unset attributes */ }

    // before/all EVERY tests
    @BeforeEach
    public void testInit(){ /* set attributes, ... */ }
    @AfterEach
    public void testFree(){ /* unset attributes, ... */ }
}
```

☠️ Use `@BeforeClass`/`@AfterClass`, and `@Before/@After` with Junit4.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

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