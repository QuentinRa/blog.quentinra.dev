# Sitemap

[Go back](../index.md#search-engine-optimization-seo)

A sitemap may not be needed for a crawler to index your website, but this is a good practice as you are telling robots what page they should index, or to provide information about the images/video/... (=resources) of your website.

The format is an XML file, you can these to generate one

* <https://www.xml-sitemaps.com/> (max. 500 pages)
* <https://www.sitemapgenie.com/> (no limit, or it seems so)
* You can find some tools on GitHub

Once you created a sitemap, you have to send it to Google/Bing using their platform, as explained in this article about how [to submit your website to a search engine](https://ahrefs.com/blog/submit-website-to-search-engines/).

<hr class="sl">

## Notes about the format

The file is looking like this

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<urlset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
            https://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
    <url>
        <loc>https://memorize.be/</loc>
        <lastmod>2021-08-27T18:11:59+02:00</lastmod>
        <priority>1.00</priority>
    </url>
</urlset>
```

**Notes**

* you are adding as many URLs as you want
* the priority is optional
* the field "lastmod" is optional (last time the file was modified, either "YYYY-MM-DD" or the one above)