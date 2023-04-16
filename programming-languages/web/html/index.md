# HTML

<div class="row row-cols-md-2"><div>

HTML primary, and probably only purpose, is to build web pages 🌍.

* 👉 It can be used in [PHP](../php/_general/index.md) scripts
* 👉 It can be used in [JavaScript](../javascript/_general/index.md) scripts
* 👉 It pretty similar to [XML](/programming-languages/others/data/xml.md) which is used on Android/...

**Where to learn?**

* [MDN/HTML](https://developer.mozilla.org/en-US/docs/Web/HTML) <small>(⛪)</small>
* [W3Schools/HTML](https://www.w3schools.com/html/default.asp) <small>(⛪)</small>
* [HTML reference](https://htmlreference.io/) <small>(unmaintained since 2019)</small>
* [HTML.com](https://html.com/) <small>(ok)</small>
* ...

</div><div>

**HTML versions**

Since HTML5, similarly to CSS, HTML has become complete, and the versions were dropped. [HTML has now a Living Standard](https://html.spec.whatwg.org/), and new versions <small>(HTML 5.2/5.3)</small> were dropped.

<br>

**Some tools**

* Syntax ✅: [W3C nu](https://validator.w3.org/nu/) (in-development) or [W3C Validator](https://validator.w3.org/#validate_by_input) (old)
* Guidelines ‍🎓 : [codeguide](https://codeguide.co/#html-syntax) or [W3Schools](https://www.w3schools.com/htmL/html5_syntax.asp) or [Google](https://google.github.io/styleguide/htmlcssguide.html)
* Online editor 👻: [htmledit](https://htmledit.squarefree.com/)
</div></div>

<hr class="sep-both">

## HTML syntax

<div class="row row-cols-md-2"><div>

A HTML file (`.html`) is a tree of **tags** (`html`, `head`, `body`...). 

```html
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Title of your website</title>
        <!-- ... -->
    </head>
    <body>
        <!-- ... -->
    </body>
</html>
```

➡️ `<!doctype html>` is not a tag, but an element telling a browser what kind of document type to expect.
</div><div>

* Every tag is a child of `html`.
* The `head` is where we put metadata <small>(ex: the title of the website)</small>.
* The `body` is where we put the code <small>(ex: the navigation bar...)</small>.

Notes

* 👉 Tags are case-insensitive (`head` or `HEAD` or `hEAd`...)
* 👉 Tags can have **attributes** (`lang="en"`...)
  * 👉 Properties are case-insensitive (`lang` or `LANG`...)
  * 👉 Quotes are optional (`lang="en"` or `lang=en`)
  * 👉 Quotes can be single quotes (`lang="en"` or `lang='en'`)
* 👉 Indentations are optional
* 👉 You can put multiples tags on one line

🧼 The most important takeaway is to be consistent.
</div></div>

<hr class="sep-both">

## HTML tags

<div class="row row-cols-md-2 mt-4"><div>

HTML tags are divided in 3 categories

* 🌍 Normal HTML tags: `<a></a>`, `<span></span>`...
* 🎹 Auto-closing tags: `<img>`, `<input>`, `<br>`...
* 🗃️ Blocking tags: `<p></p>`, `<div></div>`, `<h1></h1>`...

👑 To be correct, non-blocking tags are called **inline elements**, while blocking tags are called **block-level elements**, and they are usually grouping a bunch of inline elements.

</div><div>

➡️ For auto-closing tags, `<img>` or `<img />` is the same.

➡️ The browser will try to display as many tags as possible on the **same line**. You can use `<br>` to force a line-break. For **blocking tags**, by default, they will take a whole line for themselves.

```html
<p>one line for this one</p>
<span>This one,</span>
<span>this one,</span>
<a href="#">and this one, are on the same line.</a>
```
</div></div>

<hr class="sep-both">

## HTML elements

<div class="row row-cols-md-2"><div>

#### Headers

From `h1` to `h6`, the lower the number, the bigger the title.

<div class="row row-cols-md-2"><div>

```html
<h6>Some small title</h6>
```
</div><div class="align-self-center">

<h6 class="h6">Some small title</h6>
</div></div>

➡️ HTML standard: up to one `<h1>` per page.

<br>

#### Paragraphs

Note that `<p>` is blocking, while `<span>` is not.

<div class="row row-cols-md-2"><div>

```html
<p>xxx</p>
<span>xxx</span>
```
</div><div class="align-self-center">

<p class="m-0 p-0">xxx</p>
<span>xxx</span>
</div></div>

➡️ You can write multilines texts. Note that two or more spaces are merged into one. The indentations/... are NOT kept.

➡️ You can use `&code;` to encode some characters like: `&nbsp;` (space) `&#244;` (ô) `&#224;` (à) `&lt;` (<) `&gt;` (>)...

<br>

#### Links

Use `<a>Text</a>` to create a link. The user will see `Text`.

```html!
<a href="test.html">Link to a local file</a>
<a href="https://duckduckgo.com/">External link</a>
<a href="..." target="_blank">Open in a new tab</a>
<a href="#">Do nothing</a>
<a href="#id">Move to the div id="#id"</a>
<a href="mailto:a@b.c">Send a mail to xxx</a>
```

<br>

#### Images

If an image cannot be loaded, `alt` will be shown instead.

```html!
<img src="xxx.png" alt="alternative text">
<img src="xxx.png" alt="xxx" title="shown on hover">
<img src="xxx.png" alt="xxx" width="48" height="48">
```

➡️ See also `figure`/`figcaption`, and `picture`.

<br>

#### Lists

You can make ordered lists (`1.`, `2.`...) with `<ol>`, and unordered lists with `<ul>`. One entry of the list is inside a tag `<li>`.

<div class="row row-cols-md-2"><div>

```html
<ol>
  <li>one</li>
  <li>two
    <ul>
      <li>xxx</li>
      <li>yyy</li>
    </ul>
  </li>
</ol>
```
</div><div class="align-self-center">

<ol>
  <li>one</li>
  <li>two
    <ul>
      <li>xxx</li>
      <li>yyy</li>
    </ul>
  </li>
</ol>
</div></div>

➡️ You can change the ordered starting value with `start="n"`, and the kind of value used, using the CSS attribute `list-style-type`.

</div><div>

#### Containers: div

A `div` is a blocking component that is not visible to the user, and mainly used to group components, either to apply a CSS to the block, or to make the code more readable.

```html
<div>
    <h3>XXX</h3>
    <p>xxx</p>
</div>
```

<br>

#### Tables

Use <code>table</code>, <code>tr</code>, <code>th/td</code> to make tables.

<details class=" -n border-0">
<summary>Click to see the code<p></p>

<table>
<thead>
<tr><th>column1 title</th><th>column2 title</th></tr>
</thead>
<tbody>
<tr><td>line-1 col-1</td><td>line-1 col-2</td></tr>
<tr><td>line-2 col-1</td><td>line-2 col-2</td></tr>
<tr><td colspan="2">line-3</td></tr>
</tbody>
</table>
</summary><br>

➡️ `thead`/`tbody` were added in HTML5, and are optional. See also `<tfoot>`, and `<caption>`.

```html
<table class="table table-bordered border-dark">
    <!-- header of your table / tr + th -->
    <thead>
        <tr>
            <th>column1 title</th>
            <th>column2 title</th>
        </tr>
    </thead>
    <!-- body of your table / tr + td -->
    <tbody>
        <!-- tr = a line -->
        <tr>
            <td>line-1 col-1</td>
            <td>line-1 col-2</td>
        </tr>
        <tr>
            <td>line-2 col-1</td>
            <td>line-2 col-2</td>
        </tr>
        <tr>
          <!-- multiple columns -->
          <td colspan="2">line-3</td>
        </tr>
    </tbody>
</table>
```
</details>

<br>

#### Style

We can add some charm to our website without CSS.

<div class="row row-cols-md-2"><div>

```html
<b>bold</b>
<u>underlined</u>
<s>crossed out</s>
<i>italic</i>
<em>emphasis</em>
<small>small</small>
<mark>marked</mark>
<kbd>key</kbd>
<sup>superscript</sup>
<sub>subscript</sub>
<abbr title="xxx">x</abbr>
```
</div><div class="align-self-center">

<b>bold</b><br>
<u>underlined</u><br>
<s>crossed out</s><br>
<i>italic</i><br>
<em>emphasis</em><br>
<span class="usual-small">small</span><br>
<mark class="usual-small">yellow background</mark><br>
<kbd class="usual-small">CTRL+S</kbd><br>
<sup>at the top</sup><br>
<sub>at the bottom</sub><br>
<abbr title="xxx">hover me</abbr>
</div></div>

➡️ See also `var`, `samp`, `q`, `strong`, `del`...

<br>

#### Others

* Use `<hr>` to create an horizontal separator.
* Use `<br>` to create a blank line.
* Use `<wbr>` to force a new line (in a long text).
* Use `<nobr>xxx</nobr>` to not break a long text.
* Use `details`/`summary` to create a dropdown
* Use `<audio src="URL" controls></audio>` for audio
* Use `<video src="URL" controls></video>`+`track` for videos
* Use `<dialog>` to display a dialog
* Use `<code>` to display some code
* Use `<pre>` to preserve indentations/...

</div></div>

<hr class="sep-both">

## HTML5 tags

<div class="row row-cols-md-2"><div>

HTML5, or more HTML now, is something toward giving a semantic to each part of the website. It's more for robots than humans. All of them are simply named `div`.

* `header`: usually the top of the website, with the navbar...
* `nav`: a navbar <small>(ex: one can be inside "header")</small>
* `main`: the main content of the website <small>(~one per page)</small>
* `article`: a group of sections about a topic
* `section`: a part of an article <small>(ex: Introduction)</small>
* `aside`: complements to the article <small>(ex: contact information...)</small>
* `footer`: the footer of your website...

➡️ You can add a header/footer/... to a section/...
</div><div>

These tags are, in my opinion, semantic tags

* Use `<cite>ref</cite>` to reference something
* Use `<q cite="src">xxx</q>` to quote something short
* Use `<blockquote cite="src">xxx</blockquote>` to quote something long
* Use `<time datetime="2020-12-06">December 6</time>` for dates
* Use `<dl><dt>term</dt><dd>def</dd></dl>` for a definition
* Use `<address>xxx</address>` to wrap an address
* ...
</div></div>

<hr class="sep-both">

## Forms

<div class="row row-cols-md-2 mt-4"><div>

A HTML [form](../_general/random/forms.md) (`<form>`) is a group of input elements (`<input>`, `<textarea>`...). You can use either **GET** or **POST** [HTTP methods](/operating-systems/networking/protocols/http.md).

```html
<form method="POST" action="https://example.com/login.php">
    <!-- ... -->
</form>
```

➡️ GET is used for searches/..., while POST is used for logins/...

➡️ See also `fieldset` and `legend` for decorations.

<br>

#### Action

The attribute `action` is where the data should be sent. You will need a server <small>(PHP/Node server, an API...)</small> to handle the submission.

Each input field must have a unique **name**. This name is what the server will receive, along the value.

<div class="row row-cols-md-2"><div>

```html
<input name="username" value="toto" />
<input name="password" value="toto" />
```
</div><div class="align-self-center">

What the server receives: `username=toto&password=toto`.
</div></div>

<br>

#### Submit/Reset a form

Any button inside a form will submit the whole form.

```html
<button>submit the form</button>
<button type="submit">submit the form</button>
<button type="button">won't submit the form</button>
<button type="reset">reset the form</button>
```

<br>

#### External input fields

It's possible to have input fields outside the tag `<form>`. In such case, you must add in `id` to the form, and the input must reference it.

```html
<form id="xxx"></form>
<input form="xxx"> <!-- reference id="xxx" -->
```

</div><div>

#### Input

An `input` field has a `type` which could be `text`, `date`, `password`, `tel`, `range`, `checkbox`, `radio`, `number`, `email`...

```html
<input type="text" name="xxx">
<!-- many useful attributes -->
<input type="text" name="xxx" value="default value">
```

➡️ For checkbox, you can use the property `checked`.

➡️ For radio buttons, every input field **must have the same name**.

<br>

#### TextArea

Any button inside a form will submit the whole form.

```html
<textarea name="xxx">simple text area</textarea>
<textarea name="xxx" rows="10" cols="50"></textarea>
```

<br>

#### Labels 👑

Labels are used to associate a text with an input field. When clicking on the text, the matching input field is automatically focused.

```html
<label>email: <input type="email"></label>
<!-- OR -->
<label for="email">email:</label>
<input id="email" type="text">
```

<br>

#### Input elements attributes

These can be used on any input elements such as `<input>`.

```html
<input required> <!-- must have a value -->
<input hidden> <!-- hidden -->
<input disabled> <!-- cannot be edited -->
<input placeholder="shown when empty">
<input pattern="[a-z]+"> <!-- pattern to match -->
<input min="x" max="y"> <!-- range -->
<input minlength="z" maxlength="t"> <!-- ... -->
```
</div></div>

<hr class="sep-both">

## Metadata

<div class="row row-cols-md-2 mt-3"><div>

* ➡️ The icon of the website

```html!
<link rel="icon" href="icon.png">
```

* ➡️ Basic information

```html
<meta name="author" content="...">
<meta name="copyright" content="...">
<meta name="keywords" content="....">
<meta name="description" content="...">
```

➡️ See also [metatags](https://metatags.io/) for social network tags.
</div><div>

* ➡️ Crawlers <small>(robots indexing your website)</small>

```html
<!-- index and follow -->
<meta name='robots' content='index, follow'>
<!-- don't index nor follow -->
<meta name='robots' content='noindex, nofollow'>
```

* ➡️ HTML Refresh/Redirect

```
<!-- refresh in 5 seconds -->
<meta http-equiv="refresh" content="5">
<!-- HTML redirect -->
<meta http-equiv="refresh" content="0; url=URL">
```
</div></div>

<hr class="sep-both">

## HTML security 🛡️

<div class="row row-cols-md-2"><div>

**Subresource Integrity (SRI)**: to ensure that an external CSS/JS file has not been tampered, we add a hash of the file, and check the integrity. If needed, [you can generate a SRI here](https://www.srihash.org/).

```xml!
<script src="SOME/URL" 
        integrity="sha512-93xLZnNMlYI6xaQPf/cSdXoBZ23DThX7VehiGJJXB76HTTalQKPC5CIHuFX8dlQ5yzt6baBQRJ4sDXhzpojRJA==" 
        crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
```
</div><div>

**URL opener**: most browsers were patched in 2021, but before, a [vulnerability](https://mathiasbynens.github.io/rel-noopener/) allowed malicious websites to access the website users were coming from before clicking on a link to the malicious website. 
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* aria (`aria-label`)
* role attribute (`role="search"/role="tab"`)
* mhtml
* [Introducing HTML5](https://ptgmedia.pearsoncmg.com/images/9780321784421/samplepages/0321784421.pdf)
* Select tag
* math tag LaTeX Math to HTML
* PHP comments
</div><div>

```html!
<noscript></noscript>
<a download="xxx"></a>

<link rel="shortcut icon" sizes="16x16" href="static/images/favicons/favicon.png">
<link rel="shortcut icon" sizes="32x32" href="static/images/favicons/favicon-32.png">

<meta name="mobile-web-app-capable" content="yes">
<meta name="theme-color" content="#333333">
```
</div></div>