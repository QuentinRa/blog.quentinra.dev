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
  
Then run `jpackage command`.

For jpackage, I have a line like this (don't use `\ ` and put everything in one line)

```bash
jpackage --name eden \
  # type of executable created
  --type exe \
  # input folder
  --input eden \
  # output folder
  --dest "eden\dist" \
  # jar file, relative path to input folder
  --main-jar "eden.jar" \
  # app icon
  --icon "docs\icon.ico" \
  # options
  --java-options -Dfile.encoding=UTF-8 \
  # jre path
  --runtime-image "eden\myjre" \
  # app vendor
  --vendor "Legendary Games Studio" \
  # app version
  --app-version "1.0.0" \
  # app desc
  --description "eden" \
  # add a shortcut
  --win-shortcut \
  # add in menu
  --win-menu
```

I'm running this command at my project root with my files in eden folder

* /
  * eden
    * eden.jar
    * myjre/...
    
And the result would be an installer in `/eden/dist/`

<hr class="sl">

## Alternatives

Before that, I was using

* [easy jre](https://justinmahar.github.io/easyjre/) to create my jre
* [launch4j](http://launch4j.sourceforge.net/) to create an exe (not an installer, from a .jar)
* [innoSetup](../../../tools/inno-setup) to create an installer for my .exe, this software is explained in special/innoSetup
  
You may also check out

* code signing certificate (to create a verified application, paid)
* [install4j](https://www.ej-technologies.com/products/install4j/overview.html) to create installer (paid)