# Gradle

<div class="row row-cols-md-2"><div>

Gradle is an automation tool that can be used to **build** 🏭, **test** 🧪, and **deploy** 🚀 your project. It's an alternative created to address problems with other tools such as **Maven** or **Ant**.

Gradle uses a domain-specific language (DSL) based on the Groovy programming language for defining build scripts. It's possible to use [Kotlin](/programming-languages/high-level/oo/kotlin/index.md) instead of Groovy. 

It's commonly used with [Java](/programming-languages/high-level/oo/java/_general/index.md) and [Kotlin](/programming-languages/high-level/oo/kotlin/index.md) projects.

* [Documentation](https://docs.gradle.org/current/userguide/userguide.html)
* [Plugins](https://plugins.gradle.org/)
</div><div>

You can [download gradle here](https://gradle.org/releases/). It's only needed to initialize [gradle wrapper](https://docs.gradle.org/current/userguide/gradle_wrapper.html) which is recommended to use. It allows you to use separate gradle versions per-project, and with it, **others don't need to install gradle to build/test/... the project**.

```ps
$ cd my_project
# generate the "gradle" folder (config + downloader)
# generate gradlew (Unix) gradlew.bat (Windows)
# generate .gradle (gradle binaries)
$ gradle wrapper
$ ./gradlew wrapper --gradle-version 7.2 # change version
```

⚠️ With Version Control, commit all files aside from `.gradle`.
</div></div>

<hr class="sep-both">

## Gradle components

<div class="row row-cols-md-2"><div>

#### Project

For Gradle, a project is an application or a library that we are building. A project may be composed of multiple subprojects.

See also: `settings.gradle`.

#### Build file

The build file is where we define how a project is built. It contains **tasks**, **plugin**, and **dependencies**.

See also: `build.gradle` and `println "$buildDir"`.
</div><div>

#### Tasks

A task is a simple action such as "compiling the code".

➡️ Use `./gradlew task` to run the task `"task"`.

#### Plugins

Gradle plugins contain pre-defined tasks and additional features simplifying build file and task creation.

#### Dependencies

These are the other project that we need to import to build ours.
</div></div>

<hr class="sep-both">

## Groovy Build file

<div class="row row-cols-md-2"><div>

#### Add plugins

You can import plugins in the `plugins` block at the top.

```groovy
// idea, java, java-library, maven-publish
// application...
plugins {
    id 'xxx'
    id 'xxx' version 'xxx'
}
```

#### Project metadata

```groovy
group = 'org.example'
version = '1.0-SNAPSHOT'
description = 'Some description [...]' // optional
```

#### Project repositories

```groovy
repositories {
    mavenCentral()
}
```
</div><div>

#### Add dependencies

```groovy
dependencies {
    implementation 'xxx'     // needed to compile + run
    testImplementation 'xxx' // needed for tests
    // import 'xxx', but do not import its dependency
    implementation ('xxx') {
        exclude group: 'org.json', module: 'json'
    }
}
```

#### Custom tasks

```groovy
tasks.register('hello_world') {
    doFirst {
        println 'Hello, World!'
    }
    doLast {
        println 'Bye, World!'
    }
}
```
</div></div>

<hr class="sep-both">

## Gradle for Java

<div class="row row-cols-md-2"><div>

#### Java plugins

```groovy
plugins {
    id 'java'
}
```

#### Java dependencies

You can find dependencies at [mvnrepository](https://mvnrepository.com/).

```groovy
dependencies {
    // use JUnit 5
    testImplementation platform('org.junit:junit-bom:5.9.1')
    testImplementation 'org.junit.jupiter:junit-jupiter'
}
```

#### Java Compile Options

Add the block below to set Java compiler and its options.

```groovy
tasks.withType(JavaCompile).configureEach {
    // Compiler options
    options.compilerArgs << "-Xlint:unchecked" << "-Xlint:deprecation"
    options.encoding = "UTF-8"
    // Ask the compiler to target a SDK
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
}
```

The `xxxCompatibility` attributes does not enforce that the compiler has the target version, e.g., JDK 18 can compile code targeting JDK 17. To enforce the use of JDK 17 when compiling, use:

```groovy
java {
    toolchain {
        languageVersion = JavaLanguageVersion.of(17)
    }
}
```

➡️ If you only need to set the encoding, it's simpler to use `compileJava.options.encoding = 'UTF-8'`.

#### Java Tests

```groovy
test {
    useJUnitPlatform()  // JUnit5
}
```
</div><div>

#### Java folder structure

Gradle separate `source`, and `tests`. Both have a `resources` folder.

* `src/main/java`: your java files
* `src/resources/java`: your resources (images/...)
* `src/test/java`: your tests
* `src/resources/java`: resources only for your tests

You can actually edit them however you want:

```groovy
sourceSets {
    main.java.srcDirs = []
    main.java.srcDirs += []
    main.resources.srcDirs = []

    test.java.srcDirs = []
    test.resources.srcDirs = []
}
```

#### Java run

You can create a task `run` to use `./gradlew run` and `./gradlew run --args="arg1 arg2 arg3"`.

```groovy
tasks.register('run', JavaExec) {
    mainClass = 'org.example.Main' // set yours
    classpath = sourceSets.main.runtimeClasspath
}

// optional, set run options
tasks.withType(JavaExec).configureEach {
    systemProperty 'file.encoding', 'UTF-8'
}
```

#### Generate a jar

Add this to generate a jar with `./gradlew jar`. Replace the `org.example.Main` with your Main class.

```groovy
jar {
    from sourceSets.main.output
    manifest {
        attributes 'Main-Class': 'org.example.Main'
    }
}
```

➡️ The output is usually at `build/libs/xxx-version.jar`.
</div></div>

<hr class="sep-both">

## gradle.properties

<div class="row row-cols-md-2"><div>

It will allow you to load some variables inside your `build.gradle` that are defined in `.properties` files.

This is useful for projects that need different versions of plugins or dependencies based on the target. We simply edit `gradle.property`.

```ini!
# gradle.properties
myVariable=value
```

```groovy
// build.gradle
print "$myVariable" // will print "value"
```

You may need to learn a bit about `Groovy`/`Kotlin` to write modular build files that uses your variables.
</div><div>

#### Saliman plugin

If we often need to edit the configuration, we can use `saliman` plugin to easily swap from one `.properties` to another.

```groovy
id("net.saliman.properties") version "1.5.2"
```

We will declare `myVariable` as the one determining which `.property` file we will load. You can easily change which file is loaded by changing the variable's value.

```ini!
# gradle.properties
# load gradle-$myVariable.properties
propertiesPluginEnvironmentNameProperty=myVariable
myVariable=11
```

Currently, `myVariable=11`, so we will load `gradle-11.properties`.
</div></div>

<hr class="sep-both">

## Local dependencies

<div class="row row-cols-md-2"><div>

#### Local project

Assuming the root folder has a folder `mylib` with a `build.gradle`.

* `settings.gradle`

```groovy
include 'mylib' // load
```

* `build.gradle`

```groovy
dependencies {
    implementation project(':mylib')
}
```
</div><div>

#### Local jar

This code can be used to include a local jar:

```groovy
repositories {
    // ...
    flatDir { dirs 'libs' }
}

dependencies {
    // libs/mylib-1.02.jar
    implementation 'com.example.mylib:mylib-1.02'
}
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [jitpack](https://jitpack.io/)
* sourceSets, resourcesSets, access to resources

```groovy
application {
    // if you have a module
    mainModule.set('com.module.name')
    mainClassName = "com.a.package.Main"
}
```
</div><div>
</div></div>