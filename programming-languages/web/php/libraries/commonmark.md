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