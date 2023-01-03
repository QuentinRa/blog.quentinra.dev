# SEO (draft)

*😵 A list of random notes, an update+cleanup is required, as not everything is related to SEO... 😵*

<hr class="sep-both">

<div class="row row-cols-md-2"><div>

#### Apple touch icon

More at [webhint.io/Apple Touch Icon](https://webhint.io/docs/user-guide/hints/hint-apple-touch-icons/).

```html
<link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png" />
<link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png" />
```

<br>

#### URL/robots.txt

➡️ Tell which files robots shouldn't access, and link your sitemap.

More at [robots-txt.com](http://robots-txt.com/). Test your [robots.txt using Google Search Console](http://robots-txt.com/ressources/robots-txt-tester/). You got [examples here](http://robots-txt.com/ressources/).

```yaml
# allows everyone
User-agent: *
Disallow:

# Link to the sitemap (optional)
Sitemap: URL/sitemap.xml
```

<br>

#### URL/sitemap.xml

➡️ Help search engines to properly index your website, and provide additional information on resources such as videos/images... The format is an XML file, you can these to generate one on

* <https://www.xml-sitemaps.com/> (max. 500 pages)
* <https://www.sitemapgenie.com/> (no limit, or it seems so)
* You can find some tools on GitHub

Once you created a sitemap, you have to share it, as explained [here](https://ahrefs.com/blog/submit-website-to-search-engines/).

<details class="details-e">
<summary>Example</summary>

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<urlset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
            https://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
    <url>
        <loc>https://blog.quentinra.dev/</loc>
        <lastmod>2021-08-27T18:11:59+02:00</lastmod>
        <priority>1.00</priority>
    </url>
</urlset>
```
</details>
</div><div>

#### URL/humans.txt

Learn more about it at [humanstxt.org](https://humanstxt.org/),
and [humanstxt.org - Standard](https://humanstxt.org/Standard.html).

```html
<link type="text/plain" rel="author" href="URL/humans.txt"/>
```

<br>

#### Canonical URLs

It could be that two URLs are actually the same page. For instance, `https://example.com` and `https://example.com/index.php`. You need to tell search engines that the former is the same as the later. For both, you need to return the same canonical URL.

```php
header("Link: <https://example.com/index.php>; rel=\"canonical\"");
```

```html
<link rel="canonical" href="https://example.com/index.php" />
```

<br>

#### Titles

* You must use exactly one header "h1"
* Title's length should be between 55-65 characters

```html
<title>MainTopic - title1, title2, title3</title>
```

```html
<title>MainTopic - title1, title2 | Organization</title>
```

<br>

#### Descriptions

You should write a good and unique description of your pages. The size displayed in the results is usually 110 characters (mobile), and around 130 on a computers.

</div></div>