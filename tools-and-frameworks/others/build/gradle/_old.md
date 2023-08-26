# Gradle

```groovy
application {
    // if you have a module
    mainModule.set('com.module.name')
    mainClassName = "com.a.package.Main"
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

* you should call `gradle run` to start your application or `gradle build` to build it.

* you can change the gradle JVM version
    * <https://stackoverflow.com/questions/18487406/how-do-i-tell-gradle-to-use-specific-jdk-version#answer-64220088>
    * in Intellij <https://www.jetbrains.com/help/idea/gradle-jvm-selection.html>