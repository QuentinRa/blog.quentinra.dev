# Structured Data

[Go back](../index.md#websites-improvements-summary)

Structural Data may not impact your SEO, but it will at least help search engines to know what your website is about, while allowing Google to display rich results.

* [An article about it](https://ahrefs.com/blog/structured-data/)
* [Test your structured data (Google)](https://developers.google.com/search/docs/advanced/structured-data)
* [structured-data.org](http://www.structured-data.org/)
* [json-ld.org](https://json-ld.org/)
* [php-json-ld](https://github.com/digitalbazaar/php-json-ld)

You can look for website to generate structural data, to see what it looks like, such as [this one](https://attrock.com/schema-markup-generator/).

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
    "description": "Structural Data may not impact your SEO, but it will at least help search engines to know what your website is about, while allowing Google to display rich results.",
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