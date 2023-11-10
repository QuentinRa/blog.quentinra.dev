# Search Engine Optimization (SEO)

<div class="row row-cols-md-2"><div>

Search Engine Optimization, commonly known as SEO, is a set of practices and strategies aimed at improving the visibility and ranking of a website in search engine results pages (SERPs).

SEO is an ongoing process as search engines continually update their algorithms. It means that the content below may be obsolete.

* [webhint](https://webhint.io/) (hints to improve your website)
* [seo-peek](https://www.sanderheilbron.nl/seo-peek)/[SEOInfo](https://addons.mozilla.org/en-US/firefox/addon/seoinfo/) (extensions)
</div><div>

Search engines are using crawlers to index websites. They are basically bots inspecting each page and navigating on the website.

A few crawlers we can use to check a website:

* [siteliner](https://www.siteliner.com/) (250 pages max)
* [drlinkcheck](https://www.drlinkcheck.com/) (broken links)
* [snyk.io](https://snyk.io/website-scanner/) (vulnerabilities)
</div></div>

<hr class="sep-both">

## Basic Practices

<div class="row row-cols-md-2 mt-3"><div>

#### URL/robots.txt

➡️ Tell which files robots shouldn't access, and link your sitemap.

More at [robots-txt.com](http://robots-txt.com/). Test your [robots.txt using Google Search Console](http://robots-txt.com/ressources/robots-txt-tester/). You got [examples here](http://robots-txt.com/ressources/).

```yaml!
# allows everyone
User-agent: *
Disallow:

# Link to the sitemap (optional)
Sitemap: URL/sitemap.xml
```

<br>

#### Canonical URLs

It could be that two URLs are leading to the same page. For instance, `https://example.com` and `https://example.com/index.php`. You need to inform search engines, by setting the same canonical URL for both.

```php!
header("Link: <https://example.com/index.php>; rel=\"canonical\"");
```

```html!
<link rel="canonical" href="https://example.com/index.php" />
```

<br>

#### Titles

* You must use exactly one header "h1"
* Title's length should be between 55-65 characters

```html!
<title>MainTopic - title1, title2, title3</title>
```

```html!
<title>MainTopic - title1, title2 | Organization</title>
```

</div><div>

#### Descriptions

You should write a good and unique description of your pages. The size displayed in the results is usually 110 characters (mobile), and around 130 on a computer.

<br>

#### URL/sitemap.xml

➡️ Ensure the search engine crawlers properly index your website. Provide additional information on resources such as videos/images... The format is an XML file, you can these to generate one on:

* <https://www.xml-sitemaps.com/> (max. 500 pages)
* <https://www.sitemapgenie.com/> (no limit, or it seems so)
* You can find some tools on GitHub

After creating a sitemap, you have to share it, as explained [here](https://ahrefs.com/blog/submit-website-to-search-engines/).

<details class="details-n">
<summary>Example</summary>

```xml!
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

<br>

#### Structured Data

I'm unsure if this helps with SEO, but it allows search engines, if they want to, to display rich results. For instance, when we type a name, we often see the Wikipedia page on the right.

* [Test your structured data (Google)](https://developers.google.com/search/docs/advanced/structured-data)
* [structured-data.org](http://www.structured-data.org/)
* [json-ld.org](https://json-ld.org/)
* [php-json-ld](https://github.com/digitalbazaar/php-json-ld)


You can look for websites to generate structural data, to learn the syntax, [such as this one](https://attrock.com/schema-markup-generator/). Note that you may need to escape the "\\".

<details class="details-n">
<summary>Example</summary>

```html!
<script type="application/ld+json">
{
    "@context": "https:\/\/schema.org",
    "@type": "Article",
    "mainEntityOfPage": {
        "@type": "WebPage",
        "@id": "https:\/\/example.com\/"
    },
    "headline": "...",
    "description": "...",
    "author": {
        "@type": "Organization",
        "name": "XXX",
        "url": "https:\/\/example.com\/"
    },
    "publisher": {
        "@type": "Organization",
        "name": "XXX",
        "logo": {
            "@type": "ImageObject",
            "url": "https:\/\/example.com\/assets\/icon64.png",
            "width": "32",
            "height": "32"
        }
    }
}
</script>
```
</details>
</div></div>

<hr class="sep-both">

## Performance Optimization

<div class="row row-cols-md-2"><div>

#### Content delivery network (CDN)

Resources are cached on nearby servers to reduce the loading time of static resources <small>(CSS, images, videos, audios...)</small>.

* [jsdeliver](https://www.jsdelivr.com/) <small>(free, works with [GitHub](https://cdn.jsdelivr.net/gh/user/repo/path/to/file.png))</small>
* [cdnjs](https://cdnjs.com/) <small>(free, but not decentralized)</small>
* [gitcdn](https://github.com/schme16/gitcdn.xyz) <small>(same as jsdeliver, but slower)</small>
* [unpkg.com](https://unpkg.com/) <small>(👻)</small>
* [keycdn.com](https://www.keycdn.com/) <small>(👻)</small>
* [raw.githack.com](https://raw.githack.com/) <small>(👻)</small>
</div><div>

#### Images

Clients must download every image, and it slows page loading.

* Compress images
* Use `.webp` instead of `.jpg`/`.png`
* See [imagekit](https://imagekit.io/) (👻)
* Cache images ([see article](https://web.dev/http-cache/))

<br>

#### Tools

* [pagespeed](https://pagespeed.web.dev/) (test page loading time)
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [biq.cloud](https://biq.cloud/rank-intelligence/) <small>(see your website ranking for a keyword, account required)</small>
* [woorank](https://www.woorank.com/)
* [webpagetest](https://www.webpagetest.org/)
* [website-checker](https://www.ionos.com/tools/website-checker)
* [sitechecker](https://sitechecker.pro/)
* [protege](https://protege.stanford.edu/)
* [similarweb](https://www.similarweb.com/)
</div><div>

* [websiteplanet](https://www.websiteplanet.com/webtools/)
* [sanderheilbron](https://www.sanderheilbron.nl/)
* [uptrends](https://www.uptrends.com/tools)
* [seositecheckup](https://seositecheckup.com/tools)
* [nitropack](https://nitropack.io/)
* [brandwatch](https://www.brandwatch.com/)
* [semrush](https://www.semrush.com/)
</div></div>