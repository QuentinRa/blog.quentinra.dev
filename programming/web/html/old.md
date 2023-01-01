# Learn HTML5

```html
<head>
    <meta charset="utf-8">
    <title>title of your website</title>
</head>
```

>We need to improve the structure of the body. Since HTML5, you can use [...]

* `header`: the top of your website, it may contain the navbar, you can put one in each aside/section
* `nav`: for your navbar
* `section`: a section of your website <small>(you can have many of them)</small>
* `aside`: some content aside from your main content in your section <small>(ex: your contact information etc.)</small>
* `footer`: the footer of your website

These two are less well-know, but you should learn them too [...]

* `main`: the main content of your page <small>(one per page)</small>
* `article`: a part of the website that may be extracted from the website <small>(you may split a page into multiples articles with a header, a footer, and some sections)</small>
* `address`: to wrap your contact information

I used dropdowns to make this section more readable. To summarize

* split the body into `section`(s)/`aside`(s)/`header`/`nav`/`footer`
* wrap sub-sections into `section`, articles into `article`, the main content into `main`
* you may add header/footer to sections/articles/main

<details>
<summary>Example (image)</summary>

![html5_doc_sections](_images/html5.png)
</details>

<details>
<summary>Example (code)</summary>

```html
<!doctype html>
<html lang="fr">
<head>
    <title>title of your website</title>
    <!-- UTF-8 -->
    <meta charset="utf-8">
    <!-- RESPONSIVE (CSS) -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <main>
        <header>
          Some title
            <nav>... some tags ...</nav>
        </header>
        <section><h2>Some title</h2>... some tags ...</section>
        <section><h2>Some title</h2>... some tags ...</section>
        <footer>... some tags ...</footer>
    </main>
    <aside>... some tags ...</aside>
</body>
</html>
```
</details>

<hr class="sr">

## Learn the tag: div

The tags main, header, footer, section, etc. introduced in HTML5 are simply named divs. A div is a container, allowing you to group tags. This makes the code more readable, and later, it may help if you want to apply a style to a group of components.

Note that a div is "invisible", meaning that the user won't see any difference between the code with or without a div.

```html
<div>
    <h3>a title here</h3>
    <p>
      We got a paragraph that is a bit longer than usual (🤨)
      with one <span>span</span> inside.
    </p>
</div>
```

* [Code block and inline code](special/code.md) with code and pre
* [Meta tags](special/meta.md)
* [Icons](special/icons.md) 🚀

<hr class="sr">

## Features of HTML5, 5.1, and 5.2

Notes and tags introduced in HTML 5 (and 5.1/5.2), that I haven't added before, as I didn't use them.

<table class="table table-striped border-dark table-bordered">
<thead>
<tr>
<th>Description</th>
<th>Code</th>
<th>Preview</th>
</tr>
</thead>
<tbody>

<!-- time -->
<tr>
<td>Wrap a date/moment inside time.</td>
<td><code>&lt;time datetime="FOR_A_COMPUTER">FOR_YOUR_USER&lt;/time></code>
<br>
<code>&lt;time datetime="2020-12-06">December 6&lt;/time></code><br>
<code>&lt;time datetime="2020-12-06T00:00:00">December 6&lt;/time></code>

See [MDN documentation](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/time). 
</td>
<td>
<time datetime="2020-12-06">December 6</time><br>
<time datetime="2020-12-06T00:00:00">December 6</time>
</td>
</tr>
</tbody>
</table>

My notes

* **HTML5.2**: multiples main are allowed, but only when can be visible (use hidden)

<hr class="sl">

## Notes

```html
<!-- 
 Force a space, or write a character using UTF8 codes
 Note that you will rarely (never?) need that
 -->
&nbsp; (space) &#244; (ô) &#224; (à) &lt; (<) &gt; (>)

<!-- refresh in 5 seconds -->
<meta http-equiv="refresh" content="5">
<!-- HTML redirect -->
<meta http-equiv="refresh" content="0; url=URL">
```