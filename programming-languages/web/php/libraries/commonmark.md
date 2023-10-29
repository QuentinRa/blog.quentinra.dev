# commonmark for PHP

<div class="row row-cols-lg-2"><div>

[CommonMark for PHP](https://commonmark.thephpleague.com/) is a PHP library to parse [Markdown](/programming-languages/others/documents/markdown/index.md) files to [HTML](/programming-languages/web/html/index.md). It supports [extended syntax](/programming-languages/others/documents/markdown/index.md#-extended-markdown-), and you can define your own.

You can install it using [composer](/programming-languages/web/php/composer/index.md):

```shell!
$ composer require league/commonmark
```
</div><div>

A basic example:

```php!
use League\CommonMark\CommonMarkConverter;

$converter = new CommonMarkConverter();
echo $converter->convert("**Hello, World**")->getContent();
```

⚠️ Code changed a lot between version `1.x` and `2.x`.
</div></div>

<hr class="sep-both">

## Custom Converter

<div class="row row-cols-lg-2"><div>

To create a custom convert that you can tune however you want, you can use the `MarkdownConverter` class.

```php!
// define your configuration
$config = [];
$environment = new Environment($config);
// define parsing rules
$environment->addExtension(new CommonMarkCoreExtension());
// define rendering rules
$environment->addRenderer(XXX::class, new XXXRenderer());
// convert
$converter = new MarkdownConverter($environment);
echo $converter->convert("**Hello, World**")->getContent();
```

#### Configuration

Refer to this [section](https://commonmark.thephpleague.com/2.4/configuration/) of the documentation.
</div><div>

#### Extensions

By default, you won't be able to parse any markdown. You can either load your own parsers, or use existing ones:

```php!
$environment->addExtension(new CommonMarkCoreExtension());
$environment->addExtension(new TaskListExtension());
$environment->addExtension(new TableExtension());
```

All extensions are listed and explained [here](https://commonmark.thephpleague.com/2.4/extensions/overview/).

#### Renderers

[Renderers](https://commonmark.thephpleague.com/2.4/customization/rendering/) are used to define how each element parsed is rendered.

For instance, you could define that all parsed links starting with HTTP will be red and those starting with HTTPS will be green.

➡️ See also: `HtmlDecorator` to only add HTML attributes.
</div></div>

<hr class="sep-both">

## Custom renderers

<div class="row row-cols-lg-2"><div>

#### Add a custom renderer

To add a renderer, you need to define the parsed element that will be rendered using your custom renderer.

```php!
$environment->addRenderer(Heading::class, new HeadingRenderer());
```

See also: `Link::class`, `Image::class`, `Table::class`...

<br>

#### Custom renderer class

Each renderer implements `render` from `NodeRendererInterface`.

```php!
class HeadingRenderer implements NodeRendererInterface {
    public function render(Node $node, ChildNodeRendererInterface $childRenderer)
    {
        // ...
        return new HtmlElement($tag, $attrs, $childRenderer->renderNodes($node->children()));
    }
}
```

It returns a `HtmlElement` which is the HTML element that will be displayed. For instance, for `<h1 id="toto">...</h1>`, you would have:

```
$tag = "h1";
$attrs = ["id" => "toto"];
```
</div><div>

You should assert the type of node you're manipulating before using class-specific methods on it.

```php!
Heading::assertInstanceOf($node); // for Heading::class
```

Some generic methods:

```php!
// Get attributes
$attrs = $node->data->getData('attributes');
// Call render on all children nodes
$innerHtml = $childRenderer->renderNodes($node->children());
```

#### Heading

* `$node->getLevel()`: get the level, such as `2` for `##`

#### Image

* `$node->getUrl()`: get the image URL

#### Link

* `$node->getUrl()`: get the link URL

#### FencedCode

* `$node->getLiteral()`: get the fenced code text
* `$node->getInfoWords()`: get the fenced code language
</div></div>

<hr class="sep-both">

## Custom parser

<div class="row row-cols-lg-2"><div>

You can create your own Markdown syntax and create a parser for it 🚂. You'll have to create a renderer too 🖼️.

There are too categories of parsers: **Inline** and **Block**. The bold syntax `**x**` would be inline, while a table ("`<table>`") would be a block.

Block parsers are split in a `StartParser` that checks if your parser can parse a block and a `Parser` that actually parse it.

```php!
$environment->addBlockStartParser(new XXXStartParser());
```

⚠️ The order to add parsers to the environment is important. You may even have to add it before any extension.

<br>

#### StartParser

Return `BlockStart::none()` if your parser is not supposed to parse this block. Otherwise, return `BlockStart::of(...)`.

Use the cursor's methods to move around and find if your parser is supposed to parse this block.

```php!
class BootstrapVerticalTabStartParser implements BlockStartParserInterface
{
    public function tryStart(Cursor $cursor, MarkdownParserStateInterface $parserState): ?BlockStart
    {
        $cursor->isIndented();
        $cursor->advance();
        $char = $cursor->getNextNonSpaceCharacter();
        $cursor->advance();
        $cursor->advanceToNextNonSpaceOrTab();
        return BlockStart::of(new XXXParser())->at($cursor);
    }
}
```
</div><div>

#### Parser

The logic of a parser can be explained as follows:

* `tryContinue` is called for you to check if the current line is still within the block

* `addLine` is then called for you to parse the Markdown

* `closeBlock` when you parsed all of your lines

Then, `parseInlines` is called. This method will allow you to parse inline symbols such as `**bold**` that were inside of your block.

<details class="details-n">
<summary>XXXParser sample code</summary>

```php!
class XXXParser extends AbstractBlockContinueParser  implements BlockContinueParserWithInlinesInterface {
    private XXX $block;

    public function __construct(Environment $environment)
    {
        $this->block = new XXX();
    }

    public function getBlock(): AbstractBlock
    {
        return $this->block;
    }
    
    public function tryContinue(Cursor $cursor, BlockContinueParserInterface $activeBlockParser): ?BlockContinue
    {
        // return either by using the cursor methods
        // to find if you're done or not
        return BlockContinue::finished();  // done
        return BlockContinue::at($cursor); // continue
    }

    public function parseInlines(InlineParserEngineInterface $inlineParser): void
    {
        // Ex: store in a Paragraph the line
        // After parsing its inline elements.
        // Then store it as a child of our block
        $xxx = "some content you **parsed**";
        $p = new Paragraph();
        $inlineParser->parse($xxx, $p);
        $this->block->appendChild($p);
    }
    
    public function addLine(string $line): void
    {
        // each time you accept to continue
        // parsing, this method is called
        // with the line that you need to parse
        $this->block->number_of_lines++; // example
    }
    
    public function closeBlock(): void
    {
        // for instance, you may have to
        // process the last element here
    }
    
    public function canHaveLazyContinuationLines(): bool
    {
        return true;
    }
}
```
</details>

As you'll create your own renderer, you can do anything you want, such as creating new attributes or methods in `XXX`.

```php!
class XXX extends AbstractBlock
{
    public int $number_of_lines = 0;
}
```

Here is how you can get started with the renderer:

```php!
class XXXRenderer implements NodeRendererInterface
{
    public function render(Node $node, ChildNodeRendererInterface $childRenderer): ?HtmlElement {
        XXX::assertInstanceOf($node);
        var_dump($node->number_of_lines); // ok
        return null; // todo
    }
}
```
</div></div>