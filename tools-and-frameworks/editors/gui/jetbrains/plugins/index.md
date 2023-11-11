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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [old](_old.md)
</div><div>
</div></div>