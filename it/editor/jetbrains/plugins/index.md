# IntelliJ Platform Plugin SDK

<div class="row row-cols-md-2"><div>

These notes are an additional support to the documentation. More of my notes are from my plugin ([intellij-ocaml](https://github.com/QuentinRa/intellij-ocaml)).

The best way to learn is to see how others implemented the API <small>("extension points")</small>: [intellij-platform-explorer](https://plugins.jetbrains.com/intellij-platform-explorer/extensions) 👑.
</div><div>

* 🌍 [Documentation](https://plugins.jetbrains.com/docs/intellij/welcome.html)
* 🚀 [Examples](https://github.com/JetBrains/intellij-sdk-code-samples)
* 🪨 [Template](https://github.com/JetBrains/intellij-platform-plugin-template)
* 🤗 [Forum](https://intellij-support.jetbrains.com/hc/en-us/community/topics/200366979-IntelliJ-IDEA-Open-API-and-Plugin-Development)
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

<details class="details-n">
<summary>Split the XML into sub-files</summary>

```
-<idea-plugin>
+<idea-plugin xmlns:xi="http://www.w3.org/2001/XInclude">

+<xi:include href="/META-INF/other.xml" xpointer="xpointer(/idea-plugin/*)"/>
```
</details>
</div><div>

#### build.gradle

<details class="details-e">
<summary>Set the sandbox Directory</summary>

Kotlin

```kotlin
intellij {
    // if you change the IDE version often,
    // you might want to use different sandboxs
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

## Custom language support

👉 This basically summarize every step of me adding support for OCAML in IntelliJ 👈

<div class="row row-cols-md-2"><div>

* Support a new type of file | [Official Tutorial](https://plugins.jetbrains.com/docs/intellij/language-and-filetype.html)

<details class="details-n">
<summary>Kotlin code for <code>.ml</code></summary>

```xml
<fileType name="OCaml"
                  language="OCaml"
                  implementationClass="com.ocaml.lang.OCamlFileType"
                  extensions="ml"
                  fieldName="INSTANCE"/>
```

```kotlin
package com.ocaml.lang

import com.intellij.openapi.fileTypes.LanguageFileType
import com.ocaml.OCamlIcons

object OCamlFileType : LanguageFileType(OCamlLanguage) {
    override fun getName() = "OCaml"

    override fun getDescription() = "OCaml file"

    override fun getDefaultExtension() = "ml"

    override fun getIcon() = OCamlIcons.FileTypes.OCAML_SOURCE

    override fun getDisplayName() = description
}
```

```kotlin
package com.ocaml.lang

import com.intellij.lang.Language

object OCamlLanguage : Language("OCaml") {
    override fun getDisplayName() = "OCaml"
    override fun isCaseSensitive() = true
}
```
</details>
</div><div>

...
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