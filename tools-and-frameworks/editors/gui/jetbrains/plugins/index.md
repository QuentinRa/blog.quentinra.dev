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

## Language Parsing

<div class="row row-cols-lg-2"><div>

JetBrains uses the [Backus–Naur form](https://en.wikipedia.org/wiki/Backus%E2%80%93Naur_form) (BNF) language to define the parsing rules of a language. We create a `.bnf` syntax file, such as `OCaml.bnf`, and use [JetBrains Grammar-Kit](https://github.com/JetBrains/Grammar-Kit) to generate a parser from it.

* [Grammar Kit Overview](https://github.com/JetBrains/Grammar-Kit/blob/master/TUTORIAL.md)
* [Grammar Kit How To](https://github.com/JetBrains/Grammar-Kit/blob/master/HOWTO.md)

This section is the **hardest** ⚠️. The [OCaml Manual](https://v2.ocaml.org/releases/4.14/htmlman/lex.html) along the [extended](https://v2.ocaml.org/releases/4.14/htmlman/extn.html) page describe language elements and explanations in a BNF-like format, which you may use as a reference.

```kt
// Left: an element of the language
// Right: how the element is structured
file ::= expressions*

// Braces can be used to group tokens
// "?" means the expression is optional
// "*" means "0+" times the expression
// "+" means "1+" times the expression
// "|" is an alternative structure
expression ::= { A ";" B } * // must quote characters
| (A | B)*           // Alternative to braces
| another_expression // Reference another element

// Brackets can be used to group an optional sequence
another_expression ::= [A B]
| (A B)?            // Alternative to brackets
```

⚠️ An element can reference itself as long as there is no "left recursive" call, e.g. the first element is not itself.

⚠️ The parser is applied on the [Lexed](#lexical-analysis) tokens!
</div><div>

At the start of the file, we may configure the parser generation.

```json!
{
    // Parser class
    parserClass="com.xxx.OCamlParser"
    // Generated class with all elements+tokens instances
    elementTypeHolderClass="com.ocaml.language.psi.OCamlTypes"

    // Generated files prefix/suffix
    psiClassPrefix="OCaml"
    psiImplClassSuffix="Impl"
    // Where to store generated files
    psiPackage="com.ocaml.language.psi"
    psiImplPackage="com.ocaml.language.psi.impl"

    // Base classes for elements/tokens instances
    // That we can access from the "elementTypeHolderClass"
    elementTypeClass="com.ocaml.language.psi.OCamlElementType"
    tokenTypeClass="com.ocaml.language.psi.OCamlTokenType"
}
```

<details class="details-n">
<summary>Examples of Custom TypeClass</summary>

```kt!
// Elements are Composite Elements
// elementTypeClass="com.ocaml.language.psi.OCamlElementType"
class OCamlElementType(debugName: String) : IElementType(debugName, OCamlLanguage), ICompositeElementType {
    override fun createCompositeNode(): ASTNode {
        return OCamlTypes.Factory.createElement(this)
    }
}
```
```kt!
// Tokens are IElementType tokens 
// tokenTypeClass="com.ocaml.language.psi.OCamlTokenType"
class OCamlTokenType(debugName: String) : IElementType(debugName, OCamlLanguage)
```
</details>

All elements extend `PsiElement`, but you can use your own class:

```kt
// implements='com.ocaml.language.psi.api.OCamlElement'
interface OCamlElement : PsiElement, UserDataHolderEx
```

All implementations extend `ASTWrapperPsiElement`, but you can use your own class:

```
// extends='com.ocaml.language.psi.api.OCamlElementImpl'
abstract class OCamlElementImpl(type: IElementType) : CompositePsiElement(type)
```
</div></div>

<hr class="sep-both">

## Parsing Elements

<div class="row row-cols-lg-2"><div>

By default, a class will be generated for each **public**
</div><div>

...
</div></div>

<hr class="sep-both">

## Lexical Analysis

<div class="row row-cols-lg-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## Parser and Lexer

<div class="row row-cols-lg-2"><div>

This section is the **hardest** ⚠️. We need to define the syntax of our language inside a `.bnf` file, such as `OCaml.bnf`.

```json!
{
  [...]
   tokens=[
        AND = "and"
        NUMBER='regexp:\d+'
        [...]
   ]
}

ocamlFile ::= structure
[...]
```

While it may not be accurate,

* A file, a keyword, a literal, etc. are elements of the language
* Int, New, String, etc. are tokens of the language

We first need to define the list of tokens. Then, you have to elements that will use these tokens. For instance, a statement such as `let x = 5` is defined as a keyword <small>(token `let`)</small>, a name <small>(token `LIDENT`)</small>, an assignment operator <small>(token `=`)</small> and an expression <small>(a literal, a number, `5`)</small>.

Right-click on the BNF syntax file to generate both the parser code and the lexer file. From the lexer file, you can further define how the parser will handle each token. It can handle "complex tokens":

* Integers <small>(5, 0x5, 0X5, 0xF, etc.)</small>
* Floats <small>(5., 5.0, 0x9.5, etc.)</small>
* Chars <small>(escape characters, etc.)</small>
* Strings <small>(multilines string, '' and "", escape characters, etc.)</small>
* Comments <small>(Multiline comments, documentation comments, etc.)</small>
</div><div>

Right-click on the lexer file to generate a Lexer.

📚 Having the list of tokens is enough to get started with the lexer, but you should create a "temporary" element with every token.

👉 We don't use the lexer directly, create an adapter. It should have the path package path as generated lexer class.

```kt
import com.intellij.lexer.FlexAdapter // generated

class OCamlLexerAdapter : FlexAdapter(_OCamlLexer(null))
```

We must then link all classes using from `ParserDefinition`:

```kt
internal class OCamlParserDefinition : ParserDefinition {
    override fun createLexer(project: Project?): Lexer = OCamlLexerAdapter()
    override fun getCommentTokens(): TokenSet = ParserDefinitionUtils.COMMENTS
    override fun getStringLiteralElements(): TokenSet = ParserDefinitionUtils.STRINGS
    override fun createParser(project: Project?): PsiParser = OCamlParser()
    override fun getFileNodeType(): IFileElementType = ParserDefinitionUtils.FILE
    override fun createFile(viewProvider: FileViewProvider): PsiFile = OCamlFile(viewProvider)
    override fun createElement(node: ASTNode?): PsiElement = OCamlTypes.Factory.createElement(node)

    object ParserDefinitionUtils {
        val FILE = IFileElementType(OCamlLanguage)
        val COMMENTS = TokenSet.create(OCamlTypes.COMMENT)
        val STRINGS = TokenSet.create(OCamlTypes.STRING_VALUE)
    }
}
```

And link it inside the Manifest.

```xml!
    <extensions defaultExtensionNs="com.intellij">
        <!-- PARSER -->
        <lang.parserDefinition language="OCaml" implementationClass="com.ocaml.language.parser.OCamlParserDefinition"/>
    </extensions>
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [old](_old.md)
* versions + multiple versions + different IDEs
</div><div>
</div></div>