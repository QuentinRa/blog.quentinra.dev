# Gradle

[Go back](../index.md#expert)

You may use gradle to make your project more easy to manage like a Makefile. You will run one command downloading all libraries or running the project.

I'm not up-to-date about the last practices but here is what I know. You should create some files in order for gradle to understand what it should do.

You may check the documentation [here](https://docs.gradle.org/current/userguide/installation.html#installing_manually), since I'm using IntelliJ, I won't dig into command line or other IDEs stuffs.

* `settings.gradle`

```groovy
rootProject.name = 'project-name'
```

* `build.gradle`

```groovy
plugins {
    // ...
}

group = 'com.a.name'
version = '1.0.0.0'
description = 'A description'

repositories { mavenCentral() }

dependencies {
}

application {
    // if you have a module
    mainModule.set('com.module.name')
    mainClassName = "com.a.package.Main"
}

//noinspection GroovyAssignabilityCheck
tasks.withType(JavaCompile) {
    // add options
    options.compilerArgs << "-Xlint:unchecked" << "-Xlint:deprecation"
    // utf-8
    options.encoding = "UTF-8"
    // java version examples
    // sourceCompatibility = 1.16
    // targetCompatibility = 1.16
    // sourceCompatibility = 11
    // targetCompatibility = 11
}
// or check gradle toolchains
// you may be able to use this
// java {
//    toolchain {
//      languageVersion = JavaLanguageVersion.of(11)
//    }
// }
```

<hr class="sl">

## Plugins

I'm only importing here the line requested when I need something like

```groovy
plugins {
    id 'idea'
    id 'maven-publish'
    id 'java'
    id 'java-library'
    id 'application'
}
```

<hr class="sr">

## Dependencies

You will add here the maven links format (since we are using maven) for your libraries.

You will find the line you have to add at [https://mvnrepository.com/](https://mvnrepository.com/).

In most cases you will use `implementation ...` since that something you need when coding (source) but you may use `testImplementation` is you need a library only for tests (and you have also Runtime,...).

**Using another project**

```groovy
dependencies {
    implementation project(':another')
}
```

And in `settings.gradle`

```groovy
include 'another'
```

**Using a local jar**

```groovy
repositories {
    // ...
    // jar folder path
    //noinspection GroovyAssignabilityCheck
    flatDir { dirs 'libs' }
}

dependencies {
    // jar without .jar in the name in the libs folder
    implementation name: 'name-of-my-jar-1.0.0.0'
}
```


<hr class="sl">

## Project Structure

You will have a folder `src` with

* main
  * java
  * resources
* tests
  * java
  * resources
  
The unusual thing is that you will have to put all your files in `resources` and use some weirds methods to get a stream, but the code will works when packed in .jar file so you will be able to share it without path problems.

Note that the path starts with a `/` pointing to the `resources` folder.

```java
InputStream s = this.getClass().getResourceAsStream("/path");
// or
s = AClass.class.getResourceAsStream("/path");
// or
URL url = this.getClass().getResource("/path");
File f = new File(url.toURI());
```

<hr class="sr">

## Notes

* you may use `gradle wrapper` (or `./gradlew wrapper`) to create the gradle jar, check out `/gradle/wrapper/gradle-wrapper.properties` (project root)
  
```properties
distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
distributionUrl=https\://services.gradle.org/distributions/gradle-6.9-bin.zip
zipStoreBase=GRADLE_USER_HOME
zipStorePath=wrapper/dists
```

* you should call `gradle run` to start your application or `gradle build` to build it.

* I'm using this to create a .jar with `gradle jar`

```groovy
task makeJar(type: Jar) {
    manifest {
        // you may add attributes here
        attributes(
                'Main-Class': 'a.package.Main'
        )
    }
    from {
        configurations.runtimeClasspath.collect {
            it.isDirectory() ? it : zipTree(it)
        }
    }
    destinationDirectory.set(file("$buildDir"))
    with jar
}
```

* you can change the gradle JVM version
  * <https://stackoverflow.com/questions/18487406/how-do-i-tell-gradle-to-use-specific-jdk-version#answer-64220088>
  * in Intellij <https://www.jetbrains.com/help/idea/gradle-jvm-selection.html>