# Learn HTML5

```html
<head>
    <meta charset="utf-8">
    <title>title of your website</title>
</head>
```

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