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

IntelliJ recommends avoiding hard-coded [translatable texts](https://plugins.jetbrains.com/docs/intellij/localization-guide.html). We store translatable strings in a file, and access them from the code:

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

👉 You can use `Language(OCamlLanguage, "OCamli")` to declare an language inheriting from `OCamlLanguage` <small>(same highlighter, etc.)</small>.
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
    parserClass="com.ocaml.language.parser.OCamlParser"
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
</div><div>

#### Psi Files And Interfaces

The tool will generate an interface <small>(stored in `psiPackage`)</small> and its implementation <small>(stored in `psiImplPackage`)</small> for every element.

You can exclude some by marking them as private:

```kt
private abc ::= /* some definition */
```

Each interface will define getters allowing us to fetch the children elements. Methods/types are computed from the *whole* rule.

All interfaces extend `PsiElement`, but you can use your own interface:

```kt
// Add: implements='com.ocaml.language.psi.api.OCamlElement'
interface OCamlElement : PsiElement, UserDataHolderEx
```

All implementations extend `ASTWrapperPsiElement`, but you can use your own class:

```
// Add: extends='com.ocaml.language.psi.api.OCamlElementImpl'
abstract class OCamlElementImpl(type: IElementType) : CompositePsiElement(type)
```

👉 See also: `generateTokenAccessors=false` (default).
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

## Syntax Highlighter

<div class="row row-cols-lg-2"><div>

The syntax highlighter is coloring the tokens that were lexed by the [Lexer](#lexical-analysis). For parsed elements, we need to use an annotator.

First, define colors:

```kt
import com.intellij.openapi.editor.colors.TextAttributesKey
import com.intellij.openapi.options.OptionsBundle
import com.intellij.openapi.options.colors.AttributesDescriptor
import com.intellij.openapi.editor.DefaultLanguageHighlighterColors as Default

// Token(text_shown_in_settings, color_used)
// Use "//" in translations to group colors in folders
enum class OCamlColor(humanText: String, attr: TextAttributesKey? = null) {
    VARIABLE(OCamlBundle.message("settings.ocaml.color.variables.default"), Default.IDENTIFIER),
    
    // See also: OptionsBundle for existing texts
    BRACES(OptionsBundle.message("options.language.defaults.braces"), Default.BRACES),
    ;

    // For The Highlighter
    val textAttributesKey = TextAttributesKey.createTextAttributesKey("com.ocaml.$name", attr)
    // For Highlight Color Settings
    val attributesDescriptor = AttributesDescriptor(humanText, textAttributesKey)
}
```

Then we can write an highlighter:

```kt
import com.intellij.openapi.fileTypes.SyntaxHighlighter
import com.intellij.openapi.fileTypes.SyntaxHighlighterBase.pack
import com.intellij.psi.tree.IElementType

class OCamlSyntaxHighlighter : SyntaxHighlighter {
    override fun getHighlightingLexer(): Lexer = OCamlLexerAdapter()

    override fun getTokenHighlights(tokenType: IElementType): Array<TextAttributesKey> =
        pack(map(tokenType)?.textAttributesKey)

    companion object {
        fun map(tokenType: IElementType): OCamlColor? = when (tokenType) {
            CHAR_VALUE -> OCamlColor.CHAR
            // ...
            LPAREN, RPAREN -> OCamlColor.PARENTHESES
            // ...
            in OCAML_KEYWORDS -> OCamlColor.KEYWORD
            // ...
            else -> null
        }

        private val OCAML_KEYWORDS = setOf<IElementType>(
            AS, CLASS, ELSE, FOR, IF, // ...
        )
    }
}
```

</div><div>

You need to create a factory and add it to the Manifest:

```kt
// <lang.syntaxHighlighterFactory language="..." implementationClass="com.xxx.highlight.OCamlSyntaxHighlighterFactory"/>
class OCamlSyntaxHighlighterFactory : SyntaxHighlighterFactory() {
    override fun getSyntaxHighlighter(project: Project?, virtualFile: VirtualFile?): SyntaxHighlighter {
        return OCamlSyntaxHighlighter()
    }
}
```

To add the highlight color settings page in `Editor > Color Scheme`:

```kt
// <colorSettingsPage implementation="com.xxx.OCamlColorSettingsPage"/>
import com.intellij.openapi.editor.colors.TextAttributesKey
import com.intellij.openapi.fileTypes.SyntaxHighlighter
import com.intellij.openapi.options.colors.AttributesDescriptor
import com.intellij.openapi.options.colors.ColorDescriptor
import com.intellij.openapi.options.colors.ColorSettingsPage
import javax.swing.Icon

class OCamlColorSettingsPage : ColorSettingsPage {
    override fun getDisplayName(): String = "OCaml"
    override fun getIcon(): Icon = OCamlIcons.FileTypes.OCAML_SOURCE
    override fun getAttributeDescriptors() = Constants.ATTRS
    override fun getColorDescriptors(): Array<ColorDescriptor> = ColorDescriptor.EMPTY_ARRAY
    override fun getHighlighter(): SyntaxHighlighter = OCamlSyntaxHighlighter()
    override fun getAdditionalHighlightingTagToDescriptorMap() = Constants.ANNOTATOR_TAGS
    override fun getDemoText() = Constants.DEMO_TEXT

    internal object Constants {
        val ATTRS: Array<AttributesDescriptor> = OCamlColor.values().map{ it.attributesDescriptor }.toTypedArray()
        val ANNOTATOR_TAGS: Map<String, TextAttributesKey> = OCamlColor.values().associateBy({ it.name }, { it.textAttributesKey })
        val DEMO_TEXT: String by lazy {
            """
            (* write some code *)
            """
        }
    }

}
```
</div></div>

<hr class="sep-both">

## Customizing Parser Generated Classes

<div class="row row-cols-lg-2"><div>

At the top of the file, you can define the `extends`/`implements` restrictions on elements and their interface.

```kt
{
    // We use a regex to select elements
    // implements: selected element will implement this interface
    implements("A|B")="com.intellij.psi.PsiNamedElement"
    // extends: selected elements implementation will inherit from this class
    extends(".*expr")=expr
    // ⚠️ You can have multiple "extends" but an element
    // is only associated to the first extends that matches it
}
```

You can alternatively define properties locally, e.g., after an element.

```kt
element ::= /* some definition */
{
    name = "my_element" // Generate class: {Prefix}MyElement
    methods = [getName setName]
    mixin="com.xxx.yyy.OCamlValDeclMixin"
    extends="com.xxx.yyy.XXX"
    implements = "com.intellij.psi.PsiNamedElement"
    //or: implements = ["com.intellij.psi.PsiNamedElement"]
}
```

#### Methods

Using methods, you can inject a method in the generated class. First, in the top-level block, add a psi implementation util class: `psiImplUtilClass="com.xxx.OCamlImplUtils"`.

The first argument is the interface of the associated element. You can add as many argument as you need.

```kt
internal object OCamlImplUtils {
    @JvmStatic // my_element ::= and prefix = "XXX"
    fun getName(myElement: XXXMyElement): String? {
        return myElement.text
    }
    // ...
}
```
</div><div>

#### Mixins

Instead of using method injection, we can mix the generated class with the contents of another "mixin" class.

* The generated class will inherit from the mixin class
* The generated class will explicitly copy every constructor
* The mixin class must extend an element implementation class, such as the OCamlElementImpl in the examples above.

```kt
// OCamlLetBinding is a generated interface
// Allowing us to use the implementation methods in the mixin
abstract class LetBindingMixin : OCamlElementImpl, OCamlLetBinding {

    // example of declaring multiple constructors
    constructor(type: IElementType) : super(type) {}
    constructor(node: ASTNode) : super(node.elementType) {}

    // declare methods
    override fun getNameIdentifier(): PsiElement? {
        TODO("Not yet implemented")
    }

    override fun getName(): String? = nameIdentifier?.text

    override fun setName(name: String): PsiElement {
        TODO("Not yet implemented")
    }
}
```
</div></div>

<hr class="sep-both">

## Random Features

<div class="row row-cols-lg-2"><div>

#### Commenter

We can use `<lang.commenter language="..." implementationClass="com.xxx.OCamlCommenter"/>` to support the comment line <small>(CTRL+/)</small> and the comment block <small>(CTRL+SHIFT+/)</small> features.

```kt
import com.intellij.lang.Commenter

class OCamlCommenter : Commenter {
    override fun getLineCommentPrefix(): String? = "//"
    override fun getBlockCommentPrefix(): String  = "/*"
    override fun getBlockCommentSuffix(): String  = "*/"
    override fun getCommentedBlockCommentPrefix(): String  = "/*"
    override fun getCommentedBlockCommentSuffix(): String  = "*/"
}
```

It automatically supports uncommenting. Related classes: `CommenterDataHolder`, `CustomUncommenter`, `SelfManagingCommenter<T>`.

#### Spell Checker

You can define which elements should be analyzed by the spell checker using: `<spellchecker.support language="..." implementationClass="com.xxx.OCamlSpellcheckingStrategy"/>`

```kt
import com.intellij.psi.PsiElement
import com.intellij.spellchecker.tokenizer.SpellcheckingStrategy
import com.intellij.spellchecker.tokenizer.Tokenizer
import com.ocaml.ide.files.OCamlLanguage
import com.ocaml.language.psi.OCamlTypes

class OCamlSpellcheckingStrategy : SpellcheckingStrategy() {
    override fun isMyContext(element: PsiElement) = OCamlLanguage.isKindOf(element.language)

    override fun getTokenizer(element: PsiElement?): Tokenizer<*> = when {
        element?.node?.elementType == OCamlTypes.STRING_LITERAL -> TEXT_TOKENIZER
        // add variables, etc.
        else -> super.getTokenizer(element)
    }
}
```

The default tokenizer can handle comments, but it doesn't handle elements of the language such as STRINGS or variable names etc.
</div><div>

#### Braces Matching

You can add support to automatically detect the matching brace/token using `<lang.braceMatcher language="..." implementationClass="com.xxx.OCamlBraceMatcher"/>`:

```kotlin
package com.ocaml.ide.typing

import com.intellij.lang.BracePair
import com.intellij.lang.PairedBraceMatcher
import com.intellij.psi.PsiFile
import com.intellij.psi.tree.IElementType
import com.ocaml.language.psi.OCamlTypes

class OCamlBraceMatcher : PairedBraceMatcher {
    override fun getPairs() = Constants.PAIRS

    override fun isPairedBracesAllowedBeforeType(lbraceType: IElementType, next: IElementType?): Boolean = 
        true
    override fun getCodeConstructStart(file: PsiFile?, openingBraceOffset: Int): Int = 
        openingBraceOffset

    internal object Constants {
        val PAIRS: Array<BracePair> = arrayOf(
            BracePair(OCamlTypes.LBRACE, OCamlTypes.RBRACE, false),
            BracePair(OCamlTypes.BEGIN, OCamlTypes.END, false),
            // ...
        )
    }
}
```
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
    generatedSourceDirs.add(file("src/main/gen"))
  }
}
```
</div><div>

Stubs

* `IStubElementType`
* `stubClass=""`
* `elementTypeFactory="""`

BNF Grammar File

```
elementTypeFactory(".*") = "com.xxx.yyy.AAA"
consumeTokenMethod(".*") = "consumeTokenFast"
```
</div></div>