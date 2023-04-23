# JUnit

<div class="row row-cols-md-2"><div>

JUnit is a well-known testing library in Java. 

* ☠️ [JUnit4](https://github.com/junit-team/junit4/wiki/) <small>([download](https://mvnrepository.com/artifact/junit/junit))</small>
* 🌹 [JUnit5](https://junit.org/junit5/docs/current/user-guide/) <small>(a.k.a. Jupiter, [download](https://mvnrepository.com/artifact/org.junit.platform))</small>

JUnit5 is a bit less straightforward to use, and unlike JUnit4 where there is only one file, the code was divided into modules, so you need to find and download the ones you need.

You will usually put every required `.jar` in a folder "`libs`". To find the JUnit5 `jar` you need, check the path of the import in the code.
</div><div>

JUnit4

```ps
$ javac -cp ".:libs/*" TestSuite.java
$ java -cp ".:libs/*" org.junit.runner.JUnitCore TestSuite
```

JUnit5

```
$ javac -d out -cp ".:/libs/*" TestSuite.java
$ java -jar junit-platform-console-standalone.jar -cp "out" --scan-classpath
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Defensive programming](tests/dp.md)
* [assert in Java](tests/asserts.md)
* [Run test in JUnit4](tests/junit4.md)
* [Write some tests](tests/code.md)
* [Tests suite](tests/suite.md)
* [Parametric tests](tests/par.md)
</div><div>

* Maven
* Idea note

```
-junit5 pkg.AClass,aTest
```
</div></div>