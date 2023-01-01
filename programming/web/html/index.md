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