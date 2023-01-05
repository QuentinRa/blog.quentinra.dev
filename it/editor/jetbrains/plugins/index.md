# IntelliJ Platform Plugin SDK

<div class="row row-cols-md-2"><div>

These notes are an additional support to the documentation.
</div><div>

* [Documentation](https://plugins.jetbrains.com/docs/intellij/welcome.html) (🌍)
* [Examples](https://github.com/JetBrains/intellij-sdk-code-samples) (🚀)
* [Template](https://github.com/JetBrains/intellij-platform-plugin-template) (🪨)
</div></div>

<hr class="sep-both">

## Important files

<div class="row row-cols-md-2"><div>

#### Resources/META-INF/plugin.xml

You can add more information about the vendor, and directly add the description inside the XML <small>(remove the hook in build.gradle)</small>.

```
<vendor email="xxx" url="xxx">yyy</vendor>
<description><![CDATA[
    xxx
]]>
</description>
```
</div><div>

#### build.gradle.kts

```
intellij {
    // if you can version often,
    // you might want to use different sandboxs
    sandboxDir.set("$buildDir/idea-sandbox-${properties("platformVersion")}")
}
```
</div></div>

<hr class="sep-both">

## Important classes

<div class="row row-cols-md-2"><div>

#### Icons

Usually, there is a class to load icons.

<details class="details-e">
<summary>Kotlin code</summary>

```kotlin
/** @see com.intellij.icons.AllIcons */
object XXXIcons {
    private fun loadIcon(path: String): Icon {
        return IconLoader.getIcon(path, XXXIcons::class.java)
    }
    object YYY {
        @JvmField
        val XXX = loadIcon("/icons/xxx.svg")
    }
}
```
</details>
</div><div>

#### Bundle

To make translatable plugins, we should store the translatable texts inside a `.bundle` stored in `resources/message/`. Later in the code, we use `XXXBundle.message("key", args)` to get back the translation.

<details class="details-e">
<summary>Kotlin code</summary>

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
</details>
</div></div>


<hr class="sep-both">

## PSI - Program Structure Interface

* parses code, builds indexes, and creates a semantic model.

...

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Gradle IntelliJ Plugin](https://plugins.jetbrains.com/docs/intellij/tools-gradle-intellij-plugin.html) + [IntelliJ Platform Configuration](https://plugins.jetbrains.com/docs/intellij/configuring-plugin-project.html#intellij-platform-configuration)
* [Using kotlin](https://plugins.jetbrains.com/docs/intellij/using-kotlin.html)
* Enabling Auto-Reload
</div><div>

</div></div>