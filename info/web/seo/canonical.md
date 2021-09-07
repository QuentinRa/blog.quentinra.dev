# Canonical URL

[Go back](../index.md#search-engine-optimization-seo)

You will most likely have some links are pointing to the same page, but the URL may be different. You need to tell the search engine **which one is the real one**: that's the canonical URL.

For instance, you may have

* `/` and `/index.html`
* `/` and `#some-id`

You need to set the header Link

```php
header("Link: <https://example.com/index.php>; rel=\"canonical\"");
```

**And/Or**, you need to set the meta tag

```html
<link rel="canonical" href="https://example.com/index.php" />
```