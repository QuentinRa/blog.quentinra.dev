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

// Braces can be used to group expressions
// "?" means the expression is optional
// "*" means "0+" times the expression
// "+" means "1+" times the expression
// "|" is used for each alternative structure
expression ::= { A ";" B } * // Must quote characters
| (A | B)*                   // Alternative to braces
| another_expression         // Reference another element

// Brackets can be used to group an optional sequence
another_expression ::= [A B]
| (A B)?            // Alternative to brackets
```

⚠️ An element can reference itself as long as there is no "left recursive" call, e.g. the first element is not itself.

⚠️ The parser is applied on the [Lexed](#lexical-analysis) tokens!
</div><div>

At the start of the file, we may configure the parser generation. Refer to the [Generated Files Section](#generated-parser-files) to learn more about these.

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
    
    tokens=[
        AND = "and"
        NUMBER='regexp:\d+'
        [...]
    ]
    
    // ...
}
```

Inside the `tokens`, you can define the language tokens. For instance, `SEMI=";"` means you can use `SEMI` instead of `";"`. See also: [Lexer](#lexical-analysis).
</div></div>

<hr class="sep-both">

## Generated Parser Files

<div class="row row-cols-lg-2"><div>

Right-click on the BNF syntax file to generate the parser code.

#### Psi Type Holder

The tool will also generate a `elementTypeHolderClass` with every an element type for each token and element of the language, allowing us to reference an element or a token in the code.

```kt
IElementType COMMENT = new OCamlTokenType("COMMENT");
```

The type of the tokens/elements in the type folder class can be customized using `elementTypeClass` and `tokenTypeClass`.

<details class="details-n">
<summary>Example of Type Classes</summary>

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

👉 See also: `generateTokens=true` (default).

<br>

#### Psi Files And Interfaces

The tool will generate an interface <small>(stored in `psiPackage`)</small> and its implementation <small>(stored in `psiImplPackage`)</small> for every element.

You can exclude some by marking them as private:

```kt
private abc ::= /* some definition */
```

Each interface will define getters allowing us to fetch the children elements. Methods/types are computed from the *whole* rule.

👉 See also: `generateTokenAccessors=false` (default).
</div><div>

All interfaces extend `PsiElement`, but you can use your own interface:

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

## Lexical Analysis

<div class="row row-cols-lg-2"><div>

Before parsing a file, we convert the stream of characters to a stream of tokens using a Lexer. Right-click on the BNF syntax file to generate the base lexer file. For instance, if we have `/* xxx */` in the file, the lexer could return that this text is a `COMMENT` token.

* Integers <small>(5, 0x5, 0X5, 0xF, etc.)</small>
* Floats <small>(5., 5.0, 0x9.5, etc.)</small>
* Chars <small>(escape characters, etc.)</small>
* Strings <small>(multilines string, '' and "", escape characters, etc.)</small>
* Comments <small>(Multiline comments, documentation comments, etc.)</small>
* Operators <small>(";", "(", ")", etc.)</small>
* Keywords <small>("and", "if", "fun", etc.)</small>
* ...

Right-click on the lexer file to generate a Lexer. We don't use the lexer directly in the code, so create an adapter. It should have the same package path as generated lexer class.

```kt
import com.intellij.lexer.FlexAdapter // generated

class OCamlLexerAdapter : FlexAdapter(_OCamlLexer(null))
```
</div><div>

An overview of a lexing file:

```js!
[...]          // class definition (omitted)
DIGIT=[0-9]    // variables
%state INITIAL // parsing states
%state IN_XXX
%%
<INITIAL> { // Link to the Type Holder Variables
   "and"       { return AND; } // OCamlTypes.AND
   "A" "B"     { return AB; }  // Same as "AB"
   // You can use variables, etc.
   {DIGIT}* ("i"|"I")? { return INTEGER_VALUE; }
   
   // you can move to custom state for complex tokens
   "/*" { yybegin(XXX); /* ... */ }
}

<IN_XXX> {
    "*/" { /*...*/; return BLOCK_COMMENT; }
    . { }
    <<EOF>> { /*...*/ }
}

// Every state can have a default case
[^] { return BAD_CHARACTER; }
```

</div></div>

<hr class="sep-both">

## Parser Definition

<div class="row row-cols-lg-2"><div>

The parser definition connects all classes defined above:

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

📚 Add to `getCommentTokens()` any token that must be ignored by the parser, e.g., treated as a comment.

⚠️ Use `OCamlTypes.Factory.createElement(node.elementType)` when using `CompositePsiElement`.
</div><div>

The OCamlFile class:

```
import com.intellij.extapi.psi.PsiFileBase
import com.intellij.openapi.fileTypes.FileType
import com.intellij.psi.FileViewProvider
import com.ocaml.ide.files.OCamlFileType
import com.ocaml.ide.files.OCamlLanguage

class OCamlFile(viewProvider: FileViewProvider) : PsiFileBase(viewProvider, OCamlLanguage) {
    override fun getFileType(): FileType = OCamlFileType
    override fun toString(): String = "OCaml File"
}
```

Add to the Manifest:

```xml!
    <extensions defaultExtensionNs="com.intellij">
        <!-- PARSER -->
        <lang.parserDefinition language="OCaml" implementationClass="com.ocaml.language.parser.OCamlParserDefinition"/>
    </extensions>
```
</div></div>

<hr class="sep-both">

## Advanced BNF Grammar File

<div class="row row-cols-lg-2"><div>

You can use an utility class for the implementations.

```json!
{
    psiImplUtilClass="com.ocaml.language.parser.OCamlParserUtils"
}

element ::= xxx
{
    methods = [getName setName]
}
```

You can create mixins:

```kt!
// mixin="com.xxx.yyy.OCamlValDeclMixin"
abstract class OCamlValDeclMixin(node: ASTNode) : ASTWrapperPsiElement(node), OCamlValDecl, PsiNamedElement {
    override fun getName(): String? {
        return this.text
    }

    @Throws(IncorrectOperationException::class)
    override fun setName(@NonNls name: String): PsiElement {
        return this
    }
}
```

You can define an ancestor:

```js!
// extends="com.xxx.yyy.XXX"
```
</div><div>

You can also add an implementation:

```js!
// at the top: implements(".*")="com.intellij.psi.PsiNamedElement"
implements = "com.intellij.psi.PsiNamedElement"
implements = ["com.intellij.psi.PsiNamedElement"]
```

PsiNotes:

```kt!
PsiElement element

ASTNode node = element.node
node.text

IElementType type = node.elementType
type.getLanguage()
```

Others

```
// elementTypeFactory = ""
elementTypeFactory(".*") = "com.xxx.yyy.AAA"
consumeTokenMethod(".*") = "consumeTokenFast"
```
</div></div>

<hr class="sep-both">

## Stub Elements

<div class="row row-cols-lg-2"><div>

* `IStubElementType`
* `stubClass=""`
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [old](_old.md)
* versions + multiple versions + different IDEs

```gradle
idea {
    module {
        generatedSourceDirs.add(file("src/gen"))
    }
}
```
</div><div>
</div></div>