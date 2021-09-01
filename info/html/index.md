# HTML

As you could read in the Web course, HTML is the language used to write a web page. To be exact, the final result is in HTML, but you could have used other languages to generate the HTML page (such as PHP or Node.js), as their is no way to factorize code in pure HTML.

The current version that you should use is **HTML5**, but even if many browser have yet to support it, and not many people are aware of it, we are in **HTML5.2** (HTML 5 2nd minor version, December 2017). You can check the [coverage of HTML by your browser here](https://html5test.com/) or on [can i use](https://caniuse.com/) (for instance, try "summary", a new tag in HTML51).

The usual place, and the best one, to learn HTML/CSS/JS is [W3Schools](https://www.w3schools.com/html/default.asp).

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

Create a file `index.html` (ex: with this content above), drag and drop it inside a browser, and you should see your page. You don't need a server as your code is fully in HTML (no PHP). You can change the name of the file, but the main file of your website must be called `index`. Your browser isn't "executing" code, it's simply rendering the code it received <span class="tms">(the URL is a sort of `file:///path/to/a/file.html`, and as we learned before, if there is no file in the URL, and you got a index.html, then it's loaded instead)</span>.
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

## Learn the tags I

Learn a lot of body tags.

* [Titles](tags/h.md) with h1 to h6
* [Paragraphs](tags/p.md) with p
* [Link](tags/a.md) with a
* [Images](tags/img.md) with img

Some tags used for style/grouping tags later

* [span](tags/span.md) (ex: color in red a word in a paragraph )
* [div](tags/div.md) : container to move a group of components

<hr class="sr">

## Learn the tags II

And some basic tags to style a bit your HTML page

* [Bold](style/b.md) with b
* [Underline](style/u.md) with u
* [Strikethrough](style/s.md) with s
* [Italic](style/i.md) with i
* [Jump a line](style/br.md) with br
* [Horizontal separator](style/hr.md) with hr

<hr class="sl">

## Learn the tags III

Then you can use some special tags like

* [Ordered list](special/ol.md) with ol and li
* [Unordered list](special/ul.md) with ul and li
* [Definition](special/dl.md) with dl and dd
* [Some code](special/code.md) with code and pre
* [Tables](special/tables.md) using table

<hr class="sr">

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

<hr class="sl">

## W3 validator

Check out that the code you wrote is following the W3C
norms [here](https://validator.w3.org/#validate_by_input)
(https://validator.w3.org/#validate_by_input).

We don't have rules to follows but it's good to hear
how you could write your code in a better way by following
developers standards.

<hr class="sr">

## Meta tags

Do you remember the ``head`` tag? Here is some advice as to
what you wrote here.

* <https://www.google.com/webmasters/markup-helper/u/0/?hl=fr>
* <https://www.oodlesmarketing.com/blog/use-google-structured-data-markup-helper/>
* <https://www.seoptimer.com/meta-tag-generator>
* this one is pretty good <https://metatags.io/>

```html
<!-- website icon -->
<link rel="icon" href=".../icon.png">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- meta data -->
<meta name="AUTHOR" content="...">
<meta name="COPYRIGHT" content="...">
<meta name="KEYWORDS" content="....">
<meta name="DESCRIPTION" content="...">
```

<hr class="sl">

## Icons

Did you ever dream of having icons on your
website like a lot of websites? Well, that's easy
to do. The two most well-known libraries are

* [Bootstrap Icons](https://icons.getbootstrap.com/)
  (open-source)
* [fontawesome](https://fontawesome.com/v6.0/icons)
  (some restriction like giving credits but (almost) no-one is doing it)

The main idea (on the web, you may use them in
a desktop application too, using the SVG/PNG files)

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
```

Then on the website, click on the icon
and on the icon page, you got the HTML tag
to add for instance

```html
<!-- https://icons.getbootstrap.com/icons/alarm/ -->
<i class="bi bi-alarm"></i>
```

For bootstrap icons, you may not use this and
directly copy the SVG code (for instance, if you
don't want to link the library) but it's less
readable than the previous form.

````html
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-alarm" viewBox="0 0 16 16">
  <path d="M8.5 5.5a.5.5 0 0 0-1 0v3.362l-1.429 2.38a.5.5 0 1 0 .858.515l1.5-2.5A.5.5 0 0 0 8.5 9V5.5z"/>
  <path d="M6.5 0a.5.5 0 0 0 0 1H7v1.07a7.001 7.001 0 0 0-3.273 12.474l-.602.602a.5.5 0 0 0 .707.708l.746-.746A6.97 6.97 0 0 0 8 16a6.97 6.97 0 0 0 3.422-.892l.746.746a.5.5 0 0 0 .707-.708l-.601-.602A7.001 7.001 0 0 0 9 2.07V1h.5a.5.5 0 0 0 0-1h-3zm1.038 3.018a6.093 6.093 0 0 1 .924 0 6 6 0 1 1-.924 0zM0 3.5c0 .753.333 1.429.86 1.887A8.035 8.035 0 0 1 4.387 1.86 2.5 2.5 0 0 0 0 3.5zM13.5 1c-.753 0-1.429.333-1.887.86a8.035 8.035 0 0 1 3.527 3.527A2.5 2.5 0 0 0 13.5 1z"/>
</svg>
````

You can tweak the values like width/height
and class/fill color to change the image rendered.