# Setup

[Go back](../../../../../../programming-languages/high-level/java/_old/index.md#tests-with-junit)

## Command-line JUnit5

You may follow the [official website](https://junit.org/junit5/docs/current/user-guide/#running-tests-console-launcher). I will only provide a sample that might help

* download this jar [junit-platform](https://mvnrepository.com/artifact/org.junit.platform/junit-platform-console-standalone/1.7.0)
    * a bit bellow the license, homepage, ...
    * click on `jar` and you got your jar!
* compile with `javac -d out -cp ".:libs/*" TestSuite.java`
* run with `java -jar junit-platform-console-standalone-1.7.0.jar -cp "out" --scan-classpath`

Okay and what's lib? That's simply a folder with all the JUnit jar you will be using like if you need `import ... jupiter.api` then look for the jar. Use [this link](https://mvnrepository.com/artifact/org.junit.jupiter), the steps are the same that we used for junit-platform.

## Command-line JUnit4

For JUnit4, my commands were

```bash
javac -cp ".:libs/*" TestSuite.java
java -cp ".:libs/*" org.junit.runner.JUnitCore TestSuite
```

## IntelliJ

Simply create a file then add @Test. The rest will follow quite easily as long as you are using JUnit5.