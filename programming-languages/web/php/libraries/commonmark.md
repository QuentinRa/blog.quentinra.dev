# commonmark for PHP

<div class="row row-cols-md-2"><div>

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

<div class="row row-cols-md-2"><div>

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

<div class="row row-cols-md-2"><div>

#### Add a custom renderer

To add a renderer, you need to define the parsed element that will be rendered using your custom renderer.

```php!
$environment->addRenderer(Heading::class, new HeadingRenderer());
```

See also: `Link::class`, `Image::class`, `Table::class`...

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