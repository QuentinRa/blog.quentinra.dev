# Generating a .exe or an installer

[Go back](../index.md#expert)

Since JDK 14, you can use JPackage to create an installer for a .jar and JLink to create a jre for you .jar.

You should [read this](https://openjdk.java.net/jeps/343).

I'm using gradle but you may find some help in reading the code below.

In gradle, I'm using for the project [eden](https://github.com/lgs-games/eden) (note the name, it's important that the folder for the jre have the name of your "project")

```groovy
plugins {
    // ...
    id 'org.beryx.jlink' version '2.24.0'
}

// jar
task makeJar(type: Jar) {
    manifest {
        attributes(
                'Main-Class': 'com.lgs.eden.Main'
        )
    }
    from {
        configurations.runtimeClasspath.collect {
            it.isDirectory() ? it : zipTree(it)
        }
    }
    destinationDirectory.set(file("$buildDir/../eden/"))
    with jar
}

// jre
jlink {
    addOptions('--strip-debug', '--compress', '2', '--no-header-files', '--no-man-pages')
    launcher {
        name = 'eden'
    }
    imageDir.set(file("$buildDir/../eden/myjre"))
}
```

Then

* `gradle jlink` (create eden/myjre)
* `gradle jar` (create eden/eden-1.0.0.0-jar) but you should rename it to `eden.jar`

<hr class="sl">

## Alternatives

Before that, I was using

* [easy jre](https://justinmahar.github.io/easyjre/) to create my jre
* [launch4j](http://launch4j.sourceforge.net/) to create an exe (not an installer, from a .jar)
* [innoSetup](../../../tools/inno-setup) to create an installer for my .exe, this software is explained in special/innoSetup
  
You may also check out

* code signing certificate (to create a verified application, paid)
* [install4j](https://www.ej-technologies.com/products/install4j/overview.html) to create installer (paid)