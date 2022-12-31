# Learn HTML5

As explained in the Web course, HTML is the language used to write a web page. To be exact, the final result is in HTML, but you could have used other languages to generate the HTML page (such as PHP or Node.js), as there is no way to factorize code in pure HTML.

The current version that you should use is **HTML5**, but even if many browsers have yet to support it, and not many people are aware of it, we are in **HTML5.2** (HTML 5 2nd minor version, December 2017). You can check the [coverage of HTML5 by your browser here](https://caniuse.com/) (for instance, try "summary", a new tag introduced in HTML5.1, or simply enter "HTML5").

The usual place to learn HTML/CSS/JS is [W3Schools](https://www.w3schools.com/html/default.asp). Personally, I'm enjoying [MDN/Mozilla Developer Network](https://developer.mozilla.org/en-US/docs/Web/HTML).

> **Note**: as a good developer 😎, you should follow the standards when writing code. You can test your code [using the W3C validator](https://validator.w3.org/#validate_by_input). You can also add a badge that will redirect to the validator with your page inside [as explained here](../../../archives/ensiie/web/parts/validator.md).
> 
> Recently, I discovered that you could check your website with [webhint.io](https://webhint.io/), which is also embedded in edge developer tools, and providing quite good feedback. You also got other tools, such as Lighthouse to check the performances, etc. (check WEB course)

<hr class="sr">

## Introduction

To summarize what was written in the WEB course, 

* a browser and a server are communicating using the protocol HTTP (or HTTPS=HTTP Secure)
* when you are visiting a page <small>(ex: https://duckduckgo.com)</small>
* you are asking the server to return the HTML for this page
* **usually**, if the URL isn't ending with an HTML file
  * then either the server is using a router
  * or, the file `index.html` (or `index.php`...) is loaded

> For instance, for DuckDuckGo, `https://duckduckgo.com` is the same as `https://duckduckgo.com/index.html`.

<details class="details-n">
<summary>An HTML file is made a <b>tags</b> (ex: title, meta, ...) that have <b>attributes</b> (properties such as <code>lang="fr"</code> etc.).
</summary>

```html
<!doctype html>
<html lang="fr">
<head>
    <title>title of your website</title>
    <!-- UTF-8 -->
    <meta charset="utf-8">
    <!-- RESPONSIVE (responsive CSS) -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <!-- your code below -->
    <h1>A big title here</h1>
    <p>Some text here</p>
    <!-- image -->
    <img src="https://cdn.jsdelivr.net/gh/memorize-code/memorize-references/.assets/icons/icon64.png" alt="an image">
    <!-- link -->
    <a href="https://memorize.be/" target="_blank" rel="noopener">Link to memorize.be</a>
</body>
</html>
```
</details>

<details class="details-n">
<summary>How do I "run" HTML code?</summary>

Create a file `index.html` (ex: with the content above), drag and drop it inside a browser, and you should see your page. You don't need a server as your code is fully in HTML (no PHP). You can change the name of the file, but the main file of your website must be called `index`. Your browser isn't "executing" code, it's simply rendering the code it received <small>(the URL is a sort of `file://path/to/a/file.html`, and as we learned before, if there is no file in the URL, and an index.html exists, then it's loaded instead)</small>.

You can also try [an online editor such as this one](https://dev.codehs.com/editor/new/html). If you want something cleaner (using a server, http/https instead of file), then refer to the PHP course (this isn't complicated).
</details>

<hr class="sl">

## Tags

<div class="row row-cols-md-2"><div>

The main idea when writing HTML is that you are going to write some tags, such as **p** for a paragraph or **a** for a link. Then you can add some attributes, such as `href` for a link that is the URL the link will be pointing to.

You will have two types of tags, tags like `<img ...>` called **auto-closing tags** because you don't write `<img></img>`, as you would with **non-auto-closing tags** such as `<a ...>this is a link</a>`.

You may also note that tags such as **p** are called blocking tags, because unless you use CSS, the tags after **p** will be rendered starting from a newline. To be accurate, "p", "div", etc. are **block-level elements** while "a", "span", etc. are called **inline elements**. A block element is usually storing a bunch of inline elements. I'm usually calling those "containers".
</div><div>

* the name of a tag can be in lowercase or in uppercase (ex: "a" or "A" are working), use lowercase 😎
* you can write `attribute=value` (without ", but that may not work every time according to the value, **do not use this 😟**)
* you can write `attribute='value'` (instead of ", **do not use this 😟**)
* you may write `<img ...></img>` or `<img ... />` (without the /), but we are usually writing `<img ...>` for auto-closable tags.
* you do not need to indent your code, but it makes things cleaner 🙂
* you do not need to put one tag per line, but it makes things cleaner
* so tags are optional (such as `</li>` or `</body>`, but you shouldn't omit/forget them)

> When I'm saying "do not use/do this", I mean that developers are usually not doing/using this, BUT if you do, then you should make sure **to not mix things** <small>(ex: do not mix ' and ")</small> **as this is what bad developers do**. Pick one, and be consistent until the end.
</div></div>

<hr class="sr">

## HTML5

<details class="pb-3">
<summary>The usual way to structure a website is the following [...]</summary>

The first line is `<!doctype html>` (or DOCTYPE), and the code is inside a tag called html `<html lang="en"> ... </html>`.  To make things cleaner, we are splitting the content of "html" into

* `head` (metadata): we are defining here the properties of your website such as the title, the icon, linking the CSS, etc.
* `body` (content): this is the real content of your website
</details>

<details class="pb-3">
<summary>We need to improve the structure of the body. Since HTML5, you can use [...]</summary>

* `header`: the top of your website, it may contain the navbar, you can put one in each aside/section
* `nav`: for your navbar
* `section`: a section of your website <small>(you can have many of them)</small>
* `aside`: some content aside from your main content in your section <small>(ex: your contact information etc.)</small>
* `footer`: the footer of your website
</details>

<details class="pb-3">
<summary>These two are less well-know, but you should learn them too [...]</summary>

* `main`: the main content of your page <small>(one per page)</small>
* `article`: a part of the website that may be extracted from the website <small>(you may split a page into multiples articles with a header, a footer, and some sections)</small>
* `address`: to wrap your contact information
</details>

> I used dropdowns to make this section more readable. To summarize
> * the first line is `doctype`, followed by a `html`
> * split the html into `head`/`body`
> * split the body into `section`(s)/`aside`(s)/`header`/`nav`/`footer`
> * wrap sub-sections into `section`, articles into `article`, the main content into `main`
> * you may add header/footer to sections/articles/main

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

<hr class="sl">

## Learn the tags

These are the tags that I'm using the most, and the tags that you must know, with their attributes.

<!--
I can't use Markdown tables because the content is too complex 😭, it may the code more unreadable.
-->

<table class="table border-dark table-striped table-bordered">
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

<tr class="text-center">
<td colspan="5">TITLES</td>
</tr>

<!-- h1 -->
<tr>
<td><kbd>h1</kbd></td>
<td>title of your page, <br> one per page</td>
<td></td>
<td><code>&lt;h1>title&lt;/h1></code></td>
<td><h6 class="h1">title</h6></td>
</tr>

<!-- h2 -->
<tr>
<td><kbd>h2</kbd></td>
<td>big title</td>
<td></td>
<td><code>&lt;h2>title&lt;/h2></code></td>
<td><h6 class="h2">title</h6></td>
</tr>

<!-- h3-h5 -->
<tr>
<td><kbd>h3</kbd> to <kbd>h5</kbd></td>
<td>...</td>
<td></td>
<td>...</td>
<td>...</td>
</tr>

<!-- h6 -->
<tr>
<td><kbd>h6</kbd></td>
<td>small title</td>
<td></td>
<td><code>&lt;h6>title&lt;/h6></code></td>
<td><h6 class="h6">title</h6></td>
</tr>

<tr class="text-center">
<td colspan="5">TEXT</td>
</tr>

<!-- p -->
<tr>
<td><kbd>p</kbd></td>
<td>a paragraph</td>
<td></td>
<td><code>&lt;p>some text&lt;/p></code></td>
<td><p>some text</p></td>
</tr>

<!-- span -->
<tr>
<td><kbd>span</kbd></td>
<td>break a paragraph into parts (for styling)<br>non-blocking p</td>
<td></td>
<td><code>&lt;span>some text&lt;/span></code></td>
<td><span>some text</span></td>
</tr>

<!-- comment -->
<tr>
<td></td>
<td>a comment</td>
<td></td>
<td><code>&lt;!-- a comment here --></code></td>
<td>you can't see it 😅</td>
</tr>

<tr class="text-center">
<td colspan="5">IMAGES AND LINKS</td>
</tr>

<!-- a -->
<tr>
<td><kbd>a</kbd></td>
<td>a link</td>
<td>
<ul>
  <li> <code>href</code> (required): page opened by the link,
    <ul>
    <li>you may use relative path (such as file.html)</li>
    <li>you may use "#" (go to top)</li>
    <li>you may use "#id" (go to id="id")</li>
    <li>you may use "mailto:email" for an email</li>
  </ul>
  </li>
  <li><code>target="_blank"</code>: open in a new tab</li>
  <li>

<code>rel="noopener"</code>: prevent a [security breach](https://mathiasbynens.github.io/rel-noopener/) with target blank
</li>
</ul>
</td>
<td><code>&lt;a href="URL">some link&lt;/a></code><br>
<br>
<code>&lt;a href="URL" target="_blank" <br> rel="noopener">some link&lt;/a></code>
</td>
<td><a href="https://memorize.be/">some link</a>
<br><br>
<a href="https://memorize.be/" target="_blank" rel="noopener">some link</a></td>
</tr>

<!-- img -->
<tr>
<td><kbd>img</kbd></td>
<td>an image</td>
<td>

* `src` (required): link (URL/path) to the image
* `alt` (required): alternative text if the image is not found
* `title`: text shown when hovering
* `width`, `height` (recommended)
</td>
<td><code>&lt;img src="URL" alt="alternative text" title="some title"></code><br><br><code>&lt;img src="URL" alt="alternative text"<br> width="48" height="48"></code></td>
<td>

<img src="https://cdn.jsdelivr.net/gh/memorize-code/memorize-references/.assets/icons/icon64.png" alt="alternative text" title="some title">
<br><br>
<img src="https://cdn.jsdelivr.net/gh/memorize-code/memorize-references/.assets/icons/icon64.png" alt="alternative text" width="48" height="48">
</td>
</tr>

</tbody>
</table>

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

<hr class="sl">

## Learn the tags: style

You may want to style your website, but you don't want/know CSS. This is a list of HTML tags that you may use.

<!--
I can't use Markdown tables because the content is too complex 😭, it may the code more unreadable.
-->

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

<!-- b -->
<tr>
<td><kbd>b</kbd></td>
<td>bold</td>
<td></td>
<td><code>&lt;p>This &lt;b>is in bold&lt;/b>&lt;/p></code></td>
<td>This <b>is in bold</b>.</td>
</tr>

<!-- u -->
<tr>
<td><kbd>u</kbd></td>
<td>Underline</td>
<td></td>
<td><code>&lt;p>This &lt;u>is underlined&lt;/u>&lt;/p></code></td>
<td>This <u>is underlined</u>.</td>
</tr>

<!-- s -->
<tr>
<td><kbd>s</kbd></td>
<td>Strikethrough</td>
<td></td>
<td><code>&lt;p>This &lt;s>is crossed out&lt;/s>&lt;/p></code></td>
<td>This <s>is crossed out</s></td>
</tr>

<!-- i -->
<tr>
<td><kbd>i</kbd></td>
<td>Italic</td>
<td></td>
<td><code>&lt;p>This &lt;i>is in italic&lt;/i>&lt;/p></code></td>
<td>This <i>is in italic</i></td>
</tr>

<!-- em -->
<tr>
<td><kbd>em</kbd></td>
<td>Emphasis</td>
<td></td>
<td><code>&lt;p>This text has &lt;em>emphasis&lt;/em>&lt;/p></code></td>
<td>This text has <em>emphasis</em></td>
</tr>

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

<!-- small -->
<tr>
<td><kbd>small</kbd></td>
<td>smaller text</td>
<td></td>
<td><code>This is  &lt;small>small&lt;/small></code></td>
<td>This is <small>small</small></td>
</tr>

<!-- mark -->
<tr>
<td><kbd>mark</kbd></td>
<td>marked text<br>(=yellow background)</td>
<td></td>
<td><code>This is  &lt;mark>marked&lt;/mark></code></td>
<td>This is <mark>marked</mark></td>
</tr>

<!-- kbd -->
<tr>
<td><kbd>kbd</kbd></td>
<td>keyboard keys</td>
<td></td>
<td><code>This is a &lt;kbd>key&lt;/kbd></code></td>
<td>This is a <kbd>key</kbd></td>
</tr>

<!-- sup -->
<tr>
<td><kbd>sup</kbd></td>
<td>superscript</td>
<td></td>
<td><code>This is a &lt;sup>superscript&lt;/sup></code></td>
<td>This is a <sup>superscript</sup></td>
</tr>

<!-- sub -->
<tr>
<td><kbd>sub</kbd></td>
<td>subscript</td>
<td></td>
<td><code>This is a &lt;sub>subscript&lt;/sub></code></td>
<td>This is a <sub>subscript</sub></td>
</tr>

<!-- var -->
<tr>
<td><kbd>var</kbd></td>
<td>for a variable</td>
<td></td>
<td><code>This is a &lt;var>variable&lt;/var></code></td>
<td>This is a <var>variable</var></td>
</tr>

<!-- samp -->
<tr>
<td><kbd>samp</kbd></td>
<td>for the output of a program</td>
<td></td>
<td><code>This is a &lt;samp>sample output&lt;/samp></code></td>
<td>This is a <samp>sample output</samp></td>
</tr>

<!-- abbr -->
<tr>
<td><kbd>abbr</kbd></td>
<td>show title when hovered</td>
<td></td>
<td><code>&lt;abbr title="some text here">word&lt;/abbr></code></td>
<td><abbr title="some text here">word</abbr></td>
</tr>

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

You got even more tags that I never used such as strong (rendered as bold), del (rendered like s), q (short quote), etc. You can learn more about them (and add them here if you want) in the HTML reference.

<hr class="sr">

## Learn the tags: advanced

You will use these tags a lot too, but they are a little more complex than the previous ones.

* [Lists](special/lists.md): with ol/ul and li
* [Definition](special/dl.md) with dl and dd
* [Code block and inline code](special/code.md) with code and pre
* [Tables](special/tables.md) using table

<hr class="sl">

## Special

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

Forms aren't something that you can use without a server, but at least since they are rendered using HTML, then you can show one on your website. I haven't tested, but you may be able to use [formspree](https://formspree.io/) to handle your forms (without PHP).

Basically, you will enter data into fields (such as a name in a textField). You will give a name to each field, so that when the form is submitted, the server knows what this value is supposed to be. You will add a label to each field, so that the user knows what value the field is supposed to take.

<details class="border-dark border px-3 py-2">
<summary>Example (code)</summary>

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
</details>
<details class="border-dark border px-3 py-2">
<summary>Example (preview)</summary>

<form method="POST" class="pt-3">
    <!-- input name -->
    <div>
        <label for="name">Name</label>
        <input id="name" name="name" type="text" placeholder="John Doe" value="">
    </div>
    <!-- submit -->
    <button type="button" class="mt-2" onclick="alert('Nice try 😂, but this form isn\'t working')">submit</button>
</form>
</details>
<details class="mb-3 border-dark border px-3 py-2">
<summary>Example (explanation)</summary>
<br>

**First**, if you don't know what is POST (or GET), then you MUST read the section about the HTTP protocol in the Web course.

Then, we are usually making **one div per field**. Each div is made of 

* a **label**, with an attribute "for" referring to the ID of a field
  * clicking on the label will focus the field
  * the message inside the label is something describing the field
* a **field**, it can be an input, a textarea, a select, etc.
  * the ID must match the one on the label
  * you must add a name for the server to know what's this value
  * the value is what will be sent to the server

Finally, you add either a button submit (to send the form) and/or a button reset to reset the form.
</details>

* [Notes about label](forms/label.md)
* [Notes about input](forms/input.md)
* [Notes about constraints](forms/constraints.md)
* [Notes about forms](forms/forms.md)
* [Notes about submit/reset](forms/buttons.md)
* [Notes about textarea](forms/textarea.md)
* Check [w3schools](https://www.w3schools.com/tags/tag_select.asp) or [mozilla.org](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/select) to learn more about the select tag.

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

<hr class="sr">

## External resources

Guidelines

* [codeguide.co](https://codeguide.co/#html-syntax)
* [Google HTML/CSS Style Guide](https://google.github.io/styleguide/htmlcssguide.html)
* [W3 Guidelines](https://www.w3schools.com/htmL/html5_syntax.asp)

CheatSheet

* [htmlreference](https://htmlreference.io/) 😍
* [MDN reference](https://developer.mozilla.org/en-US/docs/Web/HTML/Element) 😍
* [htmlcheatsheet](https://htmlcheatsheet.com/) 😯
* [htmlcheatsheet (PDF)](https://htmlcheatsheet.com/HTML-Cheat-Sheet.pdf), but it got cut quite a bit 😂
* [Pravin Pawar's CheatSheet](https://ppawar.github.io/Spring2020/CSE102-S20/cheatsheets/CSE102-CheatSheetHTML.pdf)
* [Jamie Spencer's CheatSheet](https://makeawebsitehub.com/wp-content/uploads/2015/06/HTML5-Mega-Cheat-Sheet-A4-Print-ready.pdf)

<hr class="sl">

## Sources

* [HTML - W3Schools](https://www.w3schools.com/html/default.asp)
* [HTML - Mozilla Developer Network](https://developer.mozilla.org/en-US/docs/Web/HTML)
* [HTML Guidelines](https://codeguide.co/#html-syntax)
* [HTML - reference](https://htmlreference.io/)
* [HTML.com](https://html.com/)
* [HTML - specification](https://html.spec.whatwg.org/multipage/semantics.html)

Templates/Tools/?

* [Bootstrap studio](https://bootstrapstudio.io/)
* [freehtml5](https://freehtml5.co/)
* [boilerplate](https://html5boilerplate.com/)