# IntelliJ Language Plugin

<div class="row row-cols-lg-2"><div>

[IntelliJ Platform Plugin SDK](https://plugins.jetbrains.com/docs/intellij/welcome.html) is the name of the Java API that we can use to write plugin for IntelliJ-based IDEs.

Language Plugins are plugin adding support for a language, such as [R](https://github.com/JetBrains/Rplugin), [Rust](https://github.com/intellij-rust/intellij-rust), or [OCaml](https://github.com/QuentinRa/intellij-ocaml). The best way to learn is to see how others implemented the API "extension points": [intellij-platform-explorer](https://plugins.jetbrains.com/intellij-platform-explorer/extensions).

📚 A plugin using the [Language Server Protocol](https://langserver.org/) (LSP) maybe a more viable alternative than implementing your own logic.
</div><div>

A few useful links:

* 🌍 [Documentation](https://plugins.jetbrains.com/docs/intellij/custom-language-support-tutorial.html)
* 🚀 [Code Samples](https://github.com/JetBrains/intellij-sdk-code-samples)
* 🪨 [Template](https://github.com/JetBrains/intellij-platform-plugin-template)
* 🤗 [Forum](https://intellij-support.jetbrains.com/hc/en-us/community/topics/200366979-IntelliJ-IDEA-Open-API-and-Plugin-Development)
</div></div>

<hr class="sep-both">

## Get Started

<div class="row row-cols-lg-2"><div>

You can use the [Template](https://github.com/JetBrains/intellij-platform-plugin-template) or directly inside the IntelliJ, you can create `IDE Plugin` project. I used the latter which is a bit different.

Open the Manifest file at: `src/main/resources/META-INF/plugin.xml` and define the basic information about the plugin:

```xml!
<idea-plugin>
    <id>com.my.plugin.id</id>
    <name>Plugin Name</name>
    <vendor email="support@yourcompany.com" url="https://www.yourcompany.com">YourCompany</vendor>
    <description><![CDATA[
        Enter short description for your plugin here.<br>
        <em>most HTML tags may be used</em>
    ]]></description>
</idea-plugin>
```
</div><div>

You can also add your plugin icon(s):

* `src/main/resources/META-INF/pluginIcon.svg`
* `src/main/resources/META-INF/pluginIcon_dark.svg`

Run the Gradle task <kbd>Run Plugin</kbd> and see if your plugin is in the list of the new IDE that opened, and each information is properly set.
</div></div>

<hr class="sep-both">

## Basic Utilities

<div class="row row-cols-lg-2"><div>

#### Icons

Create a class to centralize access to icons. 

Useful links: [Working with Icons and Images](https://plugins.jetbrains.com/docs/intellij/work-with-icons-and-images.html),  [IntelliJ Platform UI Guidelines](https://jetbrains.design/intellij/principles/icons/), [IntelliJ Platform Icons](https://intellij-icons.jetbrains.design/),  [intellij-icon-generator](https://github.com/bjansen/intellij-icon-generator).

```kt
/**
 * @see com.intellij.icons.AllIcons
 * @see com.intellij.icons.AllIcons.FileTypes
 * @see com.intellij.icons.AllIcons.General
 * @see com.intellij.icons.AllIcons.Gutter
 * @see com.intellij.icons.AllIcons.Nodes
 */
 object OCamlIcons {
    private fun loadIcon(path: String): Icon {
        return IconLoader.getIcon(path, OCamlIcons::class.java)
    }

    object FileTypes {
        val OCAML_SOURCE = loadIcon("/icons/mlFile.svg")
    }
}
```
</div><div>

#### Bundle

IntelliJ recommends avoiding hard-coded texts, mostly are they may be [translated](https://plugins.jetbrains.com/docs/intellij/localization-guide.html). We store translatable strings in a file, and access them from the code:

```kt
import com.intellij.DynamicBundle
import org.jetbrains.annotations.PropertyKey

private const val BUNDLE = "messages.OCamlBundle"

// ex: OCamlBundle.message("filetype.ml.description")
object OCamlBundle : DynamicBundle(BUNDLE) {
    fun message(@PropertyKey(resourceBundle = BUNDLE) key: String,
                vararg params: Any): String {
        return getMessage(key, *params)
    }
}
```

With `src/main/resources/messages/OCamlBundle.properties`:

```ini!
# Filetype
filetype.ml.description=OCaml file
```
</div></div>

<hr class="sep-both">

## Defining File Types

<div class="row row-cols-lg-2"><div>

Add a `fileType` with all information that is also defined in the class `com.ocaml.ide.files.OCamlFileType`.

```xml!
    <extensions defaultExtensionNs="com.intellij">
        <!-- FILES -->
        <fileType extensions="ml" hashBangs="ml" name="OCaml File" language="OCaml"
                  fieldName="INSTANCE" implementationClass="com.ocaml.ide.files.OCamlFileType"/>
    </extensions>
```

You may have to define the language of the file:

```kt
import com.intellij.lang.Language

object OCamlLanguage : Language("OCaml") {
    private fun readResolve(): Any = OCamlLanguage
    override fun getDisplayName(): String = "OCaml"
    override fun isCaseSensitive(): Boolean = true
}
```

🍰 You should see an icon in files having the selected extension.
</div><div>

Using variables for the extension is not needed, but it's useful if we need this information in other classes.

```kt
import com.intellij.openapi.fileTypes.LanguageFileType
import com.ocaml.OCamlBundle
import com.ocaml.icons.OCamlIcons
import javax.swing.Icon

object OCamlFileType : LanguageFileType(OCamlLanguage) {
    // Extension-Related Constants
    private const val DEFAULT_EXTENSION = "ml"
    private const val DOT_DEFAULT_EXTENSION = ".$DEFAULT_EXTENSION"

    // LanguageFileType implementation
    override fun getName(): String  = "OCaml File"
    override fun getDescription(): String = OCamlBundle.message("filetype.ml.description")
    override fun getDefaultExtension(): String = DEFAULT_EXTENSION
    override fun getIcon(): Icon = OCamlIcons.FileTypes.OCAML_SOURCE
    override fun getDisplayName(): String  = description
}
```

⚠️ There is no `INSTANCE` in the Kotlin Class as it's a static object.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [old](_old.md)
* versions + multiple versions + different IDEs
</div><div>
</div></div>