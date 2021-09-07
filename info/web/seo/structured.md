# Structured Data

[Go back](../index.md#search-engine-optimization-seo)

**Structural Data** are providing more information about your website, and it allows Google to display **rich results**. You should are already aware of some search engines being smart, like "5+65" is being evaluated as "70" or "John Doe" will show the Wikipedia page on the right.

You will **most likely not achieve that**, but search engines **will be able to display more information** about your website in their result <small>(they may not do it even if they are able to)</small>.

* [Test your structured data (Google)](https://developers.google.com/search/docs/advanced/structured-data)
* [structured-data.org](http://www.structured-data.org/)
* [json-ld.org](https://json-ld.org/)
* [php-json-ld](https://github.com/digitalbazaar/php-json-ld)

You can look for websites to generate structural data, to learn the syntax, [such as this one](https://attrock.com/schema-markup-generator/). Note that you may need to escape the "\\".

<hr class="sl">

## Example: article

Please note, that you need to escape the "\\", for instance, the one for this page is looking like this

```html
<script type="application/ld+json">
{
    "@context": "https:\/\/schema.org",
    "@type": "Article",
    "mainEntityOfPage": {
        "@type": "WebPage",
        "@id": "https:\/\/memorize.be\/info\/web\/seo\/structured.md"
    },
    "headline": "Structured Data - WEB | Memorize",
    "description": "Structural Data are providing more information about your website, and it allows Google to display rich results. You should are already aware of some search engines being smart like \"5+65\" is being evaluated as \"70\" or \"John Doe\" will show the Wikipedia page on the right.",
    "author": {
        "@type": "Organization",
        "name": "Memorize",
        "url": "https:\/\/memorize.be\/"
    },
    "publisher": {
        "@type": "Organization",
        "name": "Memorize",
        "logo": {
            "@type": "ImageObject",
            "url": "https:\/\/memorize.be\/assets\/icon64.png",
            "width": "32",
            "height": "32"
        }
    }
}
</script>
```