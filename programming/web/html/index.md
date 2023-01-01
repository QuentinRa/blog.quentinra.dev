# HTML

<div class="row row-cols-md-2"><div>

HTML primary, and probably only purpose, is to build web pages 🌍.

* 👉 It can be used in PHP scripts
* 👉 It can be used in JavaScript scripts
* 👉 It pretty similar to XML which is used on Android/...

**Where to learn?**

* [W3Schools/HTML](https://www.w3schools.com/html/default.asp) <small>(⛪)</small>
* [MDN/HTML](https://developer.mozilla.org/en-US/docs/Web/HTML) <small>(⛪)</small>

</div><div>

**HTML versions**

Since HTML5, similarly to CSS, HTML has become complete, and the versions were dropped. [HTML has now a Living Standard](https://html.spec.whatwg.org/), and new versions <small>(HTML 5.2/5.3)</small> were dropped.

<br>

**Some tools**

* Syntax ✅: [W3C Validator](https://validator.w3.org/#validate_by_input)
</div></div>

<hr class="sep-both">

## HTML syntax

<div class="row row-cols-md-2"><div>

A HTML file (`.html`) is a tree of **tags** (`html`, `head`, `body`...). 

```
<!doctype html>
<html lang="en">
    <head>
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
* 👉 Tags can have **properties** (`lang="en"`...)
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

</div><div>

#### Links

Use `<a>Text</a>` to create a link. The user will see `Text`.

```html
<a href="test.html">Link to a local file</a>
<a href="https://duckduckgo.com/">External link</a>
<a href="..." target="_blank">Open in a new tab</a>
```

<br>

#### Images

If an image cannot be loaded, `alt` will be shown instead.

```html
<img src="xxx.png" alt="alternative text">
<img src="xxx.png" alt="xxx" title="shown on hover">
<img src="xxx.png" alt="xxx" width="48" height="48">
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* aria (`aria-label`)
* role attribute (`role="search"/role="tab"`)
* mhtml
* [htmledit](https://htmledit.squarefree.com/)
</div><div>

```html
<noscript></noscript>
```

</div></div>