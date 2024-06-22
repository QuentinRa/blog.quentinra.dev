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

#### Interfaces

* `PsiNameIdentifierOwner`: elements that contain a name identifier, e.g., an element that has a name
* `PsiNamedElement`: elements that have a name
* `NavigatablePsiElement`: elements that we can navigate to

Ensure the relevant elements implement the relevant interfaces.
</div></div>

<hr class="sep-both">

## Structure View

<div class="row row-cols-lg-2"><div>

The structure view is a tab listing all variables, types/classes, functions, etc. of a file. Add to the Manifest:

```xml!
<lang.psiStructureViewFactory language="..." implementationClass="com.xxx.OCamlStructureViewFactory"/>
```

And create the entrypoint factory:

```kt
import com.intellij.ide.structureView.StructureViewBuilder
import com.intellij.ide.structureView.StructureViewModel
import com.intellij.ide.structureView.TreeBasedStructureViewBuilder
import com.intellij.lang.PsiStructureViewFactory
import com.intellij.openapi.editor.Editor
import com.intellij.psi.PsiFile

internal class OCamlStructureViewFactory : PsiStructureViewFactory {
    override fun getStructureViewBuilder(psiFile: PsiFile): StructureViewBuilder {
        return object : TreeBasedStructureViewBuilder() {
            override fun createStructureViewModel(editor: Editor?): StructureViewModel {
                return OCamlStructureViewModel(editor, psiFile)
            }
        }
    }
}
```

And the model:

```kt
import com.intellij.ide.structureView.StructureViewModel
import com.intellij.ide.structureView.StructureViewModelBase
import com.intellij.ide.structureView.StructureViewTreeElement
import com.intellij.ide.util.treeView.smartTree.Filter
import com.intellij.ide.util.treeView.smartTree.Sorter
import com.intellij.openapi.editor.Editor
import com.intellij.psi.PsiFile

class OCamlStructureViewModel(editor: Editor?, psiFile: PsiFile) :
    StructureViewModelBase(psiFile, editor, OCamlStructureViewElement(psiFile)),
    StructureViewModel.ElementInfoProvider {

    override fun getSorters(): Array<Sorter> = arrayOf(Sorter.ALPHA_SORTER)
    override fun getFilters(): Array<Filter> = super.getFilters()
    override fun isAlwaysShowsPlus(element: StructureViewTreeElement): Boolean = element.value is OCamlFileBase // your Psi File Class
    override fun isAlwaysLeaf(element: StructureViewTreeElement): Boolean = when (element.value) {
        // list of generated interfaces of "always leaf" elements
        is OCamlLetBinding -> true
        else -> false
    }
}
```
</div><div>

The structure view element requires quite a lot of language-specific code. The base "template" would be something like this:

```kt
class OCamlStructureViewElement(element: PsiElement) : StructureViewTreeElement {
    private val psiAnchor = TreeAnchorizer.getService().createAnchor(element)
    private val myElement: PsiElement? get() = TreeAnchorizer.getService().retrieveElement(psiAnchor) as? PsiElement
    private val childElements: List<PsiElement>
        get() {
            return when (val psi = myElement) {
                else -> emptyList()
            }
        }

    override fun getValue(): PsiElement? = myElement
    override fun navigate(requestFocus: Boolean) { (myElement as? Navigatable)?.navigate(requestFocus) }
    override fun canNavigate(): Boolean = (myElement as? Navigatable)?.canNavigate() == true
    override fun canNavigateToSource(): Boolean = (myElement as? Navigatable)?.canNavigateToSource() == true
    override fun getPresentation(): ItemPresentation {
        return  PresentationData("unknown", "", null, null)
    }
    override fun getChildren(): Array<out TreeElement> =
        childElements.map2Array { OCamlStructureViewElement(it) }
}
```

You must then define how, starting from the PsiFile, we can get the list of children nodes in `childElements`.

```kt
// for instance, in OCaml (let_bindings="let x = 5 and y = 7"
is OCamlFile -> {
    psi.childrenOfType<OCamlLetBindings>() // all variables
}
// letBindingList=["x=5", "y=7"]
is OCamlLetBindings -> psi.letBindingList
```

And, you need to define how each element is rendered in the view:

```kt
override fun getPresentation(): ItemPresentation {
    return myElement?.let(::getPresentationForStructure)
        ?: PresentationData("unknown", null, null, null)
}
private fun getPresentationForStructure(psi: PsiElement): ItemPresentation {
    val presentation =  when(psi) { // text shown for each element
        is OCamlNamedElement -> psi.name
        else -> null
    }
    val icon = when(psi) { // icon shown | implement it in each element
        else -> psi.getIcon(Iconable.ICON_FLAG_VISIBILITY)
    }
    return PresentationData(presentation, null, icon, null)
}
```

➡️ See also related classes: `SortableTreeElement`, `Queryable`.
</div></div>

<hr class="sep-both">

## Project Wizard

<div class="row row-cols-lg-2"><div>

The new project wizard is one of the possible implementation for the new project menu. It is used for Java, Kotlin, and other languages.

```kt
package com.ocaml.ide.module.wizard

import com.intellij.ide.wizard.AbstractNewProjectWizardMultiStep
import com.intellij.ide.wizard.NewProjectWizardStep
import com.intellij.ide.wizard.language.LanguageGeneratorNewProjectWizard
import com.ocaml.OCamlBundle.message
import com.ocaml.icons.OCamlIcons
import com.ocaml.ide.module.wizard.buildSystem.BuildSystemOCamlNewProjectWizard
import javax.swing.Icon

class OCamlNewProjectWizard : LanguageGeneratorNewProjectWizard {
    override val icon: Icon get() = OCamlIcons.Nodes.OCAML_MODULE
    override val name: String = message("language.name")
    override val ordinal: Int = 200

    override fun createStep(parent: NewProjectWizardStep): NewProjectWizardStep = OCamlNewProjectWizardStep(parent)

    class OCamlNewProjectWizardStep(parent: NewProjectWizardStep) :
        AbstractNewProjectWizardMultiStep<OCamlNewProjectWizardStep, BuildSystemOCamlNewProjectWizard>(parent, BuildSystemOCamlNewProjectWizard.EP_NAME)
    {
        override val label: String  get() = message("project.wizard.build.system")
        override val self: OCamlNewProjectWizardStep get() = this
    }
}
```

The code is based on "build systems" such as the buttons "Gradle", "Maven", and "IntelliJ" for the Java Wizard. We need to declare a new extension point and create at least one implementation <small>(such as Dune)</small>.

```xml!
<extensionPoints>
    <extensionPoint qualifiedName="com.intellij.newProjectWizard.ocaml.buildSystem" interface="com.ocaml.ide.module.wizard.buildSystem.BuildSystemOCamlNewProjectWizard" dynamic="true"/>
</extensionPoints>

<extensions defaultExtensionNs="com.intellij">
<newProjectWizard.languageGenerator implementation="com.ocaml.ide.module.wizard.OCamlNewProjectWizard"/>
<newProjectWizard.ocaml.buildSystem implementation="com.ocaml.ide.module.wizard.buildSystem.OCamlDefaultBuildSystemWizard" />
<!-- ... -->
</extensions>
```
```kt
import com.intellij.ide.util.projectWizard.WizardContext
import com.intellij.ide.wizard.NewProjectWizardMultiStepFactory
import com.intellij.openapi.extensions.ExtensionPointName
import com.ocaml.ide.module.wizard.OCamlNewProjectWizard

interface BuildSystemOCamlNewProjectWizard : NewProjectWizardMultiStepFactory<OCamlNewProjectWizard.OCamlNewProjectWizardStep> {
    override fun isEnabled(context: WizardContext): Boolean = true

    companion object {
        val EP_NAME = ExtensionPointName<BuildSystemOCamlNewProjectWizard>("com.intellij.newProjectWizard.ocaml.buildSystem")
    }
}
```
</div><div>

We will add logic specific to the build system in each wizard.

```kt
class OCamlDuneBuildSystemWizard : OCamlDefaultBuildSystemWizard() {
    override val name: String = message("project.wizard.build.system.dune")
    override fun createStep(parent: OCamlNewProjectWizard.OCamlNewProjectWizardStep): NewProjectWizardStep = Step(parent)

    private class Step(parent: OCamlNewProjectWizard.OCamlNewProjectWizardStep) : OCamlNewProjectWizardBaseStep(parent) {
        override fun setupUI(builder: Panel) {
            super.setupUI(builder)
            // Specific to Dune
        }
    }
}

open class OCamlNewProjectWizardBaseStep(parent: OCamlNewProjectWizard.OCamlNewProjectWizardStep) : AbstractNewProjectWizardStep(parent) {
    override fun setupUI(builder: Panel) {
        super.setupUI(builder)
        // For every subclass
    }
}
```

Inside IntelliJ, e.g., with the JAVA plugin, we can use classes such as `IntelliJNewProjectWizardStep` to have a JAVA-like menu.

When the client is done, `setupProject` is invoked. Refer to the aforementioned class for a possible implementation. It loads the selected SDK and configure the builder with the parameters.

```kt
    override fun setupProject(project: Project) {
        super.setupProject(project)
        setupProject(project, OCamlModuleBuilder())
    }
```

Don't forget to register the module builder and the module type:

```xml!
<moduleBuilder builderClass="com.ocaml.ide.module.OCamlModuleBuilder" order="first"/>
<moduleType id="OCAML_MODULE" implementationClass="com.ocaml.ide.module.OCamlIdeaModuleType"/>
```

Refer to `OCamlNewProjectWizardAssetStep` to understand how we can create IntelliJ files and load a template. To be fair, I am adding hardcoded files without any variable to inject, but if I didn't, I would use "internal templates" and refer to `AssetsJavaNewProjectWizardStep`.

**moduleType** is deprecated but there is no clear alternative...
</div></div>

<hr class="sep-both">

## Editor and Actions

<div class="row row-cols-lg-2"><div>

#### CreateNewFile

To create a new file, refer to `OCamlCreateFileAction`. The content of the new files is based on files in `fileTemplates/internal`.

```xml!
    <extensions defaultExtensionNs="com.intellij">
        <internalFileTemplate name="OCaml File"/>
        <internalFileTemplate name="OCaml Interface"/>
    </extensions>

    <actions>
        <!-- Create file -->
        <action id="NewOCamlFile" class="com.ocaml.ide.files.actions.OCamlCreateFileAction">
            <add-to-group group-id="NewGroup" anchor="before" relative-to-action="NewFile"/>
        </action>
    </actions>
```
</div><div>
</div></div>

<hr class="sep-both">

## SDK and Libraries

<div class="row row-cols-lg-2"><div>

Setting an SDK is essentially the same as adding a library to the project. The files added can be browsed and referenced/navigated to once we implement the said features.

```xml!
<sdkType implementation="com.ocaml.sdk.OCamlSdkType"/>
<sdkDownload implementation="com.ocaml.sdk.OCamlSdkType"/>
```

When we navigate to "Project Structure > SDKs", we can see the files loaded by IntelliJ. This is the result of:

```kt
    override fun isRootTypeApplicable(type: OrderRootType): Boolean = type === OrderRootType.CLASSES
    override fun setupSdkPaths(sdk: Sdk) {
        val homePath = checkNotNull(sdk.homePath) { sdk }
        val sdkModificator = sdk.sdkModificator
        sdkModificator.removeRoots(OrderRootType.CLASSES)
        addSources(File(homePath), sdkModificator)
        // 0.0.6 - added by default
        sdkModificator.addRoot(getDefaultDocumentationUrl(sdk), OrderRootType.DOCUMENTATION)
        sdkModificator.addRoot(OCamlSdkWebsiteUtils.getApiURL(sdk.versionString!!), OrderRootType.DOCUMENTATION)
        sdkModificator.commitChanges()
    }
```

We can add additional tabs such as Documentation tabs, but we cannot edit the SDK to match the change in settings from the UI <small>(JB changed something, I can't do it anymore, getting some error about Bridges and Elements when trying to edit the SDK by following their short documentation)</small>.

```kt
    override fun createAdditionalDataConfigurable(sdkModel: SdkModel, sdkModificator: SdkModificator) = OCamlSdkAdditionalDataConfigurable()

    override fun loadAdditionalData(currentSdk: Sdk, additional: Element): SdkAdditionalData {
        // ...
    }

    override fun saveAdditionalData(additionalData: SdkAdditionalData, additional: Element) {
        // ...
    }
```
</div><div>

We often want to notify the user when the SDK is not set, as it often limit what the plugin can do. We can show a message at the top of a source file using `ProjectSdkSetupValidator`.

```xml!
<projectSdkSetupValidator implementation="com.ocaml.sdk.validator.OCamlSDKValidator"/>
```
```kt!
class OCamlSDKValidator : ProjectSdkSetupValidator {
    override fun isApplicableFor(project: Project, file: VirtualFile): Boolean {
        // checks if the file is a source file (+in the project)
    }

    override fun getErrorMessage(project: Project, file: VirtualFile): String? {
        // Null == no error, otherwise, the error message shown
    }

    override fun getFixHandler(project: Project, file: VirtualFile): EditorNotificationPanel.ActionHandler {
        // filter which SDK is suggested
    }
}
```

While it's purely visual, you can change the SDK library root icons or hide non-source files. Refer to `OCamlLibraryRootsNodeDecorator` and `OCamlLibraryRootsTreeStructureProvider`.

</div></div>

<hr class="sep-both">

## Random Features

<div class="row row-cols-lg-2"><div>

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

For instance, assuming that `OCamlNameIdentifierOwner` is an element that own an element that has a name, we would add `element is OCamlNameIdentifierOwner -> OCamlNameIdentifierOwnerTokenizer`.

We would then develop a custom tokenizer:

```kt
import com.intellij.spellchecker.inspections.IdentifierSplitter
import com.intellij.spellchecker.tokenizer.TokenConsumer
import com.intellij.spellchecker.tokenizer.Tokenizer

object OCamlNameIdentifierOwnerTokenizer : Tokenizer<OCamlNameIdentifierOwner>() {
    override fun tokenize(element: OCamlNameIdentifierOwner, consumer: TokenConsumer) {
        val identifier = element.nameIdentifier ?: return
        consumer.consumeToken(identifier, IdentifierSplitter.getInstance())
        // you can add a more complex logic here
    }
}
```
</div><div>

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

* versions + multiple versions + different IDEs
* Gradle Configuration
* [Gradle IntelliJ Plugin](https://plugins.jetbrains.com/docs/intellij/tools-gradle-intellij-plugin.html) + [IntelliJ Platform Configuration](https://plugins.jetbrains.com/docs/intellij/configuring-plugin-project.html#intellij-platform-configuration)
* [Using kotlin](https://plugins.jetbrains.com/docs/intellij/using-kotlin.html)
* Enabling Auto-Reload
* .form

```gradle
idea {
  module {
    generatedSourceDirs.add(file("src/main/gen"))
  }
}
```

```kotlin
MyBundle.message("applicationService")
MyBundle.message("projectService", project.name)

System.getenv("CI")

project.service<MyProjectService>()

val instance: OCamlSdkType?
    get() = EP_NAME.findExtension(OCamlSdkType::class.java)
```


<details class="details-n">
<summary>Split the XML into sub-files</summary>

```diff
-<idea-plugin>
+<idea-plugin xmlns:xi="http://www.w3.org/2001/XInclude">

+<xi:include href="/META-INF/other.xml" xpointer="xpointer(/idea-plugin/*)"/>
```
</details>

<details class="details-n">
<summary>Set the sandbox Directory</summary>

➡️  If you change the IDE version often, you might want to use different sandbox, to start where you left.

Kotlin

```kotlin
intellij {
    sandboxDir.set("$buildDir/idea-sandbox-${properties("platformVersion")}")
}
```
</details>

<details class="details-n">
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

Random

```
TreeAnchorizer.getService().createAnchor(element)
TreeAnchorizer.getService().retrieveElement(psiAnchor)
```

Bundles

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