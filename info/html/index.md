# HTML

Here you will learn how you can create a basic website,
in HTML. You may check
PHP course to handle the server logic (explained later)
or JS (can also handle server logic, mainly used to run
some code in the client browser) or CSS
to add some style to your website.

Just so you know, learning the web starts 
at [w3schools](https://www.w3schools.com/html/default.asp)
so be sure to check their tutorials.

<hr class="sr">

## Introduction

When you write some URL in your browser, you
requested ``https://duckduckgo.com/`` to a
server. The server returns to you a make page, written
in ``HTML``.

You can write some ``index.html`` file with this
inside, then drag and drop it into your browser
and you got a page!

```html
<!DOCTYPE html>
<html lang="fr">
<head>
        <title>website title</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
    <!-- code -->
    <h1>A big title here</h1>
    <p>Some text here</p>
    <!-- image -->
    <img src="https://memorize.lgs-games.com/assets/icon64.png" alt="an image">
    <!-- link -->
    <a href="https://duckduckgo.com/">Link to duckduckgo.com</a>
</body>
</html>
```

<hr class="sl">

## Tags

The main idea when writing HTML is that you are gonna write
some tags like ``p`` for a paragraph or `a` for a link.
Then you can add some attributes, link ``href`` for a link
witch is the URL the link will be pointing to.

You will have to types of tags, tags like ``<img ... />``
called auto-closing tags because you don't write
``<img></img>`` and the others kind like `<a ...>...</a>`.

Finally, as a side note, you can

* tag name can be in lowercase or in uppercase (a or A is working)
* you can write ``attribute=value`` (without " but that
  may not work every time according to value)
* you may write ``<img></img>`` or `<img>` (without the /)
but you should write ``<tagname />`` like this for auto-closable
tags.

<hr class="sr">

## Structure in HTML5

The first line is always ``<!DOCTYPE html>``, then you
will have ``<html lang="your_language_code"> ... </html>``.
But in HTML tag, you will have

* ``head``: defines here the properties of your website 
such as the title, the icon, the stylesheet, ...
* ``body``: defines what your website is looking like.
  
Since HTML5, the body uses some inner tags

* ``header``: the top of your website, may contains the navbar
* ``nav``: for your navbar
* ``section``: a section of your website
* ``aside``: some content aside from your main content in
your section like some contact info at the right etc.
* ``footer``: the footer of your website

![html5_doc_sections](html5.png)

```html
<!DOCTYPE html>
<html lang="fr">
<head>
        <title>titre du site</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
        <header>
          ... some tags ...
          <nav>
            ...
          </nav>
        </header>
        <section>... some tags ...</section>
        <section>... some tags ...</section>
        <aside>... some tags ...</aside>
        <footer>... some tags ...</footer>
</body>
</html>
```

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