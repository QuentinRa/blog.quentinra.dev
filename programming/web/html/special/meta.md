# Meta tags

[Go back](../index.md#special)

In the head, you can define the metadata of your website using the tag `meta`. A long time ago, this was used by search engines, but some of them aren't used anymore.

```html
<!-- website icon -->
<link rel="icon" href="icon.png">

<!-- meta data -->
<meta name="author" content="...">
<meta name="copyright" content="...">
<meta name="keywords" content="....">
<meta name="description" content="...">
```

<hr class="sl">

## Search-engine optimization (note)

The only one that we **keep using in SEO is description**. We will also use a lot of social network meta tags, that you preview and generate [on metatags.io](https://metatags.io/) (define how a user on a social network will preview your website).

```html
 <!-- Facebook -->
<meta property="og:type" content="website">
<meta property="og:url" content="http://memorize.lgs-games.etu/info/html/special/meta.md">
<meta property="og:title" content="Meta tags - HTML | Memorize">
<meta property="og:description" content="...">

<!-- Twitter -->
<meta property="twitter:card" content="summary_large_image">
<meta property="twitter:url" content="http://memorize.lgs-games.etu/info/html/special/meta.md">
<meta property="twitter:title" content="Meta tags - HTML | Memorize">
<meta property="twitter:description" content="...">
```

<hr class="sl">

## Search-engine (index/follow)

You can prevent robots from indexing your page with "noindex" (resp. "index"), and you can tell them whether they can follow the links with "follow" and "nofollow".

```html
<!-- index and follow -->
<meta name='robots' content='index, follow'>
<!-- don't index nor follow -->
<meta name='robots' content='noindex, nofollow'>
```