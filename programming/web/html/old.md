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

* `dl+dt+dd`

<br>

<table class="table table-striped border-dark table-bordered">
<thead>
<tr>
<th>Tag</th>
<th>For what?</th>
<th>Attributes</th>
<th>Code</th>
<th>Preview</th>
</tr>
</thead>
<tbody>

<!-- br -->
<tr>
<td><kbd>br</kbd></td>
<td>Force a newline</td>
<td></td>
<td><code>&lt;span>This is&lt;/span>&lt;br>&lt;span>on 2 lines&lt;/span></code></td>
<td><span>This is</span><br><span>on 2 lines</span></td>
</tr>

<!-- hr -->
<tr>
<td><kbd>hr</kbd></td>
<td>Horizontal separator</td>
<td></td>
<td><code>&lt;hr></code></td>
<td><hr></td>
</tr>

<tr><td colspan="5" class="text-center">
Rarely used tags
</td></tr>

<!-- cite -->
<tr>
<td><kbd>cite</kbd></td>
<td>referencing a work</td>
<td></td>
<td><code>This is a &lt;cite>reference&lt;/cite></code></td>
<td>This is a <cite>reference</cite></td>
</tr>

<!-- quote -->
<tr>
<td><kbd>blockquote</kbd></td>
<td>Quoting something</td>
<td>You may add <code>cite="URL/to/source"</code>.</td>
<td><code>&lt;blockquote>quote&lt;/blockquote></code></td>
<td><blockquote>quote</blockquote></td>
</tr>

</tbody>
</table>

* [Code block and inline code](special/code.md) with code and pre
* [Meta tags](special/meta.md)
* [Icons](special/icons.md) 🚀

<hr class="sr">

## Global attributes

This may be something that you won't need to know, at least until you aren't writing CSS/JavaScript. You can use these attributes on **any tag**

* `id="value"`: give an ID to a tag, the value mustn't be used twice on a page
* `class="a"` or `class="a b c ..."`: give classes to a tag
* `hidden`: hide a component
* `style="some CSS"`: inline style
* you got inline JavaScript too (onclick, onload, ...)
* `contenteditable="true" spellcheck="true"`: you can click and edit some HTML, as long as the HTML got these attributes

You got [the list of Global Attributes on W3Schools](https://www.w3schools.com/TAGs/ref_standardattributes.asp) with some examples.

<hr class="sl">

## Forms

You will add a label to each field, so that the user knows what value the field is supposed to take.

```html
<form method="POST">
    <!-- input name -->
    <div>
      <label for="name">Name</label>
      <input id="name" name="name" type="text" placeholder="John Doe" value="">
    </div>
    <!-- submit -->
    <button type="submit">submit</button>
</form>
```

Then, we are usually making **one div per field**. Each div is made of 

* a **label**, with an attribute "for" referring to the ID of a field
  * clicking on the label will focus the field
  * the message inside the label is something describing the field
* a **field**, it can be an input, a textarea, a select, etc.
  * the ID must match the one on the label
  * you must add a name for the server to know what's this value
  * the value is what will be sent to the server

* [Notes about label](forms/label.md)
* [Notes about input](forms/input.md)
* [Notes about constraints](forms/constraints.md)
* [Notes about forms](forms/forms.md)

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

<!-- figure -->
<tr>
<td>Adding a caption to an image.</td>
<td><code>&lt;figure><br>
  &lt;img src="URL" alt="Memorize logo" title="Memorize logo" <br> width="64" height="64"><br>
  &lt;figcaption>Memorize logo&lt;/figcaption><br>
&lt;/figure></code>
</td>
<td><figure>
  <img src="https://cdn.jsdelivr.net/gh/memorize-code/memorize-references/.assets/icons/icon64.png" alt="Memorize logo" title="Memorize logo" width="64" height="64">
  <figcaption>Memorize logo</figcaption>
</figure>
</td>
</tr>

<!-- dropdown -->
<tr>
<td>Adding a dropdown.</td>
<td><code>&lt;details><br>
  &lt;summary>Some summary&lt;/summary><br>
  Some content<br>
&lt;/details></code>
</td>
<td>
<details>
<summary>Some summary</summary>
Some content
</details>
</td>
</tr>

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

<!-- audio -->
<tr>
<td>Audio</td>
<td><code>&lt;audio src="URL" controls>&lt;/audio></code></td>
<td>
<audio src="" controls></audio>
</td>
</tr>

<!-- video -->
<tr>
<td>Video</td>
<td><code>&lt;video src="URL" controls>&lt;/video></code><br>
You can add inside video, the tag track to add subtitles.<br>
If you got multiples sources/format, then you may use the tag source instead of "src".
</td>
<td>
<video src="" controls></video>
</td>
</tr>
</tbody>
</table>

My notes

* **HTML5.1**: you can add option inside the browser content-menu (`menu type="context"`)
* **HTML5.1**: `srcset` for images allows us to give a batch of images for some resolutions. `sizes` allows us to resize the image according to the size of the screen.
* **HTML5.1**: new tag `picture`, to show different pictures according to the resolution
* **HTML5.1**: the rev attribute for links. You can give it "prev" or "next" if there is a relation previous page/next page with the current page
* **HTML5.2**: new tag `dialog`, not supported everywhere,
see [MDN doc](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dialog) and [can i use](https://caniuse.com/mdn-html_elements_dialog).
* **HTML5.2**: multiples main are allowed, but only when can be visible (use hidden)

Support of [HTML 5.1](https://w3c.github.io/test-results/html51/implementation-report).
Support of [HTML 5.2](https://w3c.github.io/test-results/html52/implementation-report). As for [HTML 5.3](https://w3c.github.io/test-results/html53/implementation-report) (in progress).

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