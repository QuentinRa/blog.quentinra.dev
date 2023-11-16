# IntelliJ Platform Plugin SDK

<hr class="sep-both">

## Important files

<div class="row row-cols-lg-2"><div>

#### Resources/META-INF/plugin.xml

You can add more information about the vendor, and directly add the description inside the XML <small>(remove the hook in build.gradle)</small>.

```xml!
<vendor email="xxx" url="xxx">yyy</vendor>
<description><![CDATA[
    xxx
]]>
</description>
```

<details class="details-n">
<summary>Split the XML into sub-files</summary>

```diff
-<idea-plugin>
+<idea-plugin xmlns:xi="http://www.w3.org/2001/XInclude">

+<xi:include href="/META-INF/other.xml" xpointer="xpointer(/idea-plugin/*)"/>
```
</details>
</div><div>

#### build.gradle

<p></p>

<details class="details-e">
<summary>Set the sandbox Directory</summary>

➡️  If you change the IDE version often, you might want to use different sandbox, to start where you left.

Kotlin

```kotlin
intellij {
    sandboxDir.set("$buildDir/idea-sandbox-${properties("platformVersion")}")
}
```
</details>


<details class="details-e">
<summary>Add new folders as src/res</summary>

Groovy

```gradle
sourceSets {
    main.java.srcDirs = ["src/xxx", "src/main"]
    main.java.srcDirs += ["src/yyy"]
    main.resources.srcDirs = ["resources/main", "resources/zzz"]
    test.java.srcDirs = ["test/xxx/", "test/main"]
    test.resources.srcDirs = ["resources/main", "resources/xxx", "test/testData"]
}
```

Kotlin

```kotlin
sourceSets {
    main.configure {
        java.srcDir("src/xxx/")
        java.srcDir("src/xxx/kotlin")
        resources.srcDir("src/xxx/resources")
    }
}
```
</details>
</div></div>

<hr class="sep-both">

## Important classes

<div class="row row-cols-lg-2"><div>

</div><div>

#### Bundle

To make translatable plugins, we should store the translatable texts inside a file stored in `resources/message/`. Later in the code, we use `XXXBundle.message("key", args)` to get back the translation.

```kotlin
import com.intellij.DynamicBundle
import org.jetbrains.annotations.NonNls
import org.jetbrains.annotations.PropertyKey

@NonNls
private const val BUNDLE = "messages.xxx"

object XXXBundle : DynamicBundle(BUNDLE) {

    @Suppress("SpreadOperator")
    @JvmStatic
    fun message(@PropertyKey(resourceBundle = BUNDLE) key: String, vararg params: Any) =
        getMessage(key, *params)

    @Suppress("SpreadOperator", "unused")
    @JvmStatic
    fun messagePointer(@PropertyKey(resourceBundle = BUNDLE) key: String, vararg params: Any) =
        getLazyMessage(key, *params)
}
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [Gradle IntelliJ Plugin](https://plugins.jetbrains.com/docs/intellij/tools-gradle-intellij-plugin.html) + [IntelliJ Platform Configuration](https://plugins.jetbrains.com/docs/intellij/configuring-plugin-project.html#intellij-platform-configuration)
* [Using kotlin](https://plugins.jetbrains.com/docs/intellij/using-kotlin.html)
* Enabling Auto-Reload
* .form
</div><div>

```kotlin
MyBundle.message("applicationService")
MyBundle.message("projectService", project.name)

System.getenv("CI")

project.service<MyProjectService>()
```
</div></div>