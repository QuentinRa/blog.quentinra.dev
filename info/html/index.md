# Learn HTML5

As you could read in the Web course, HTML is the language used to write a web page. To be exact, the final result is in HTML, but you could have used other languages to generate the HTML page (such as PHP or Node.js), as their is no way to factorize code in pure HTML.

The current version that you should use is **HTML5**, but even if many browser have yet to support it, and not many people are aware of it, we are in **HTML5.2** (HTML 5 2nd minor version, December 2017). You can check the [coverage of HTML by your browser here](https://html5test.com/) or on [can i use](https://caniuse.com/) (for instance, try "summary", a new tag in HTML51).

The usual place, and the best one, to learn HTML/CSS/JS is [W3Schools](https://www.w3schools.com/html/default.asp).

> **Note**: as a good developer 😎, you should follow the standards when writing code. You can test your code [using the W3C validator](https://validator.w3.org/#validate_by_input). You can also add a badge that will redirect to the validator with your page inside [as explained here](../../special/web/parts/validator.md).

<hr class="sr">

## Introduction

To summarize what was written in the WEB course, 

* a browser and a server are communicating using the protocol HTTP (or HTTPS=HTTP Secure)
* when you are visiting a page (ex: https://duckduckgo.com)
* you are asking the server to return the HTML for this page
* **usually**, no HTML file in the URL means
  * that the server is using a router
  * or, that the file `index.html` (or `index.php`...) is loaded
  * ex: for DuckDuckGo, `https://duckduckgo.com` is the same as `https://duckduckgo.com/index.html`.

<details class="pb-3">
<summary>A HTML file is made a <b>tags</b> (ex: title, meta, ...) that have <b>attributes</b> (properties such as <code>lang="fr"</code> etc.).
</summary>

```html
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>title of your website</title>
    <!-- UTF-8 -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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

<details class="pb-3">
<summary><b>How do I "run" HTML code?</b></summary>

Create a file `index.html` (ex: with the content above), drag and drop it inside a browser, and you should see your page. You don't need a server as your code is fully in HTML (no PHP). You can change the name of the file, but the main file of your website must be called `index`. Your browser isn't "executing" code, it's simply rendering the code it received <span class="tms">(the URL is a sort of `file://path/to/a/file.html`, and as we learned before, if there is no file in the URL, and you got a index.html, then it's loaded instead)</span>.

You can also try [an online editor such as this one](https://dev.codehs.com/editor/new/html). If you want something cleaner (using a server, http/https instead of file), then refer to the PHP course (this isn't complicated).
</details>

<hr class="sl">

## Tags

The main idea when writing HTML is that you are gonna write some tags such as **p** for a paragraph or **a** for a link. Then you can add some attributes, such as ``href`` for a link that is the URL the link will be pointing to.

You will have to types of tags, tags like `<img ...>` called **auto-closing tags** because you don't write `<img></img>`, as you would with others such as `<a ...>this is a link</a>`.

You may also note that tags such as **p** are called blocking tags, because unless you use CSS, the tags after **p** will be rendered starting from a newline.

**Notes**

* the name of a tag can be in lowercase or in uppercase (ex: "a" or "A" are working), use lowercase 😎
* you can write `attribute=value` (without " but that may not work every time according to the value, **do not use this 😟**)
* you may write `<img ...></img>` or `<img ... />` (without the /), but we are usually writing `<img ...>` like this for auto-closable tags.
* you do not need to indent your code, but it makes things cleaner (🙂)
* you do not to put one tag per line, but it makes things cleaner (🙂)

<hr class="sr">

## HTML5

One of the things that came with HTML5, is a new way to structure your website. Usually 

* The first line is `<!DOCTYPE html>`,
* Then, the code is inside a tag called html `<html lang="en"> ... </html>`
* **But**, to make things cleaner, we are splitting the HTML into two tags
* `head`: we are defining here the properties of your website 
such as the title, the icon, linking the CSS, etc.
* `body`: this is the code of your website

As you may guess, adding head is good, but we didn't split enough the body. Since HTML5, you can use

* `main`: the main content of your page <span class="tms">(one per page)</span>
* `header`: the top of your website, may contains the navbar, you can put one in each aside/section <span class="tms">(since HTML51/52)</span>
* `nav`: for your navbar
* `section`: a section of your website <span class="tms">(you can have many of them)</span>
* `aside`: some content aside from your main content in your section <span class="tms">(ex: your contact information etc.)</span>
* `footer`: the footer of your website

<details>
<summary>Example (image)</summary>

![html5_doc_sections](html5.png)
</details>

<details>
<summary>Example (code)</summary>

```html
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>title of your website</title>
    <!-- UTF-8 -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- RESPONSIVE (responsive CSS) -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <header>
        ... some tags ...
        <nav>... some tags ...</nav>
    </header>
    <section>... some tags ...</section>
    <main>
      <header>...</header>
      <section>...</section>
    </main>
    <section>... some tags ...</section>
    <aside>... some tags ...</aside>
    <footer>... some tags ...</footer>
</body>
</html>
```
</details>

<hr class="sl">

## Learn the tags

This is the tags that I'm using the most, and the tags that you must know, with their attributes.

<!--
I can't use Markdown tables because the content is too complex 😭, it may the code more unreadable.
-->

<table class="table table-dark table-striped border-dark table-bordered">
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
<td colspan="5" class="text-my-yellow">TITLES</td>
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
<td colspan="5" class="text-my-yellow">TEXT</td>
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

<tr class="text-center">
<td colspan="5" class="text-my-yellow">IMAGES AND LINKS</td>
</tr>

<!-- a -->
<tr>
<td><kbd>a</kbd></td>
<td>a link</td>
<td>
<ul>
  <li> <b>href</b> (required): page opened by the link,
    <ul>
    <li>you may use relative path (such as file.html)</li>
    <li>you may use "#" (go to top)</li>
    <li>you may use "#id" (go to id="id"</li>
  </ul>
  </li>
  <li><b>target="_blank"</b>: open in a new tab</li>
  <li>

**rel="noopener"**: prevent a [security breach](https://mathiasbynens.github.io/rel-noopener/) with target blank
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

* **src** (required): link (URL/path) to the image
* **alt** (required): alternative text if the image is not found
* title: text shown when hovering
* width, height (recommended)
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

The tags main, header, footer, section, etc. introduced in HTML5 are simply named div. A div is a container, allowing you to group tags. This makes the code more readable, and later, it may help if you want to apply a style to a group of components.

Note that a div is "invisible", meaning that the user won't see any changes if you used a div or not.

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

You may want to style your website, and you can using HTML tag (lets leave the CSS for later).

<!--
I can't use Markdown tables because the content is too complex 😭, it may the code more unreadable.
-->

<table class="table table-dark table-striped border-dark table-bordered">
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

<!-- br -->
<tr>
<td><kbd>br</kbd></td>
<td>Force a newline</td>
<td></td>
<td><code>&lt;span>This is&lt;/span>&lt;br>&lt;span>on 2 lines&lt;/span></code></td>
<td><span>This is</span><br><span>on 2 lines</span></td>
</tr>

<!-- sr -->
<tr>
<td><kbd>sr</kbd></td>
<td>Horizontal separator</td>
<td></td>
<td><code>&lt;hr></code></td>
<td><hr></td>
</tr>

</tbody>
</table>

<hr class="sr">

## Learn the tags: advanced

You will use these tags a lot too, but they are a little more complex than the previous ones.

* [Lists](special/lists.md): with ol/ul and li
* [Definition](special/dl.md) with dl and dd
* [Code](special/code.md) with code and pre
* [Tables](special/tables.md) using table

And, you may want to learn about

* [Meta tags](special/meta.md)
* [Icons](special/icons.md)

<hr class="sl">

## Forms

Creating a form in HTML is a bit tricky, or at least more complex
than any other tags. Also, note that you can't process a form since
you need a server to process your data.

W3School [set one for you](https://www.w3schools.com/html/html_forms.asp)
for their example so try it.

```html
<form action="script.php" method="POST">
    <!-- some content here -->
</form>
```

Action is pointing to the script.php handling the request.
Methods is the method used to send your data. POST means that
the data will be hidden, GET means that the data will be shown in the URL.

* [Learning about POST and GET](forms/post-get.md)
* [Learning about form input fields](forms/input.md)