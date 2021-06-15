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

<div class="sr"></div>

## Introduction

When you write some URL in your browser, you 
made a request like ``https://duckduckgo.com/`` to a
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

<div class="sl"></div>

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
  may not work everytime according to value)
* you may write ``<img></img>`` or `<img>` (without the /)
but you should write ``<tagname />`` like this for auto-closable
tags.

<div class="sr"></div>

## Structure in HTML5

The first line is always ``<!DOCTYPE html>``, then you
will have ``<html lang="your_language_code"> ... </html>``.
But in HTML tag, you will have

* ``head``: defines here the properties of your website such
as the title, the icon, the stylesheet, ...
* ``body``: defines what your website is actually looking
like.
  
Since HTML5, body use some inner tags

* ``header``: the top of your website, may contains the navbar
* ``nav``: for your navbar
* ``section``: a section of your website
* ``aside``: some content aside your main content in
your section like some contact info at the right etc.
* ``footer``: the footer of your website

![html5_doc_sections](html5.png)



