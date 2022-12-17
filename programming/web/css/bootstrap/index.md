# Bootstrap

<div class="row row-cols-md-2"><div>

[Bootstrap](https://getbootstrap.com/) is the most popular css framework with more than 160k ⭐ on [GitHub](https://github.com/twbs/bootstrap). Some redeeming features from my point of view are

* 💫 easy to learn
* 🐉 responsive <small>(adapt to many screen resolutions)</small>
* 🖼️ a lot of examples <small>(to copy-paste and adapt)</small>
* 🤙 a lot of features <small>(tabs, dropdowns, popover...)</small>
* 📖 relatively nice looking
</div><div>

See the [documentation](https://getbootstrap.com/docs/). For **5.2.3**, you could use the code below

```diff
<head>
    <meta charset="utf-8">
+   <meta name="viewport" content="width=device-width, initial-scale=1">
+   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
+   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
```
</div></div>

<hr class="sep-both">

## Learn Bootstrap

<div class="row row-cols-md-2"><div>

The best way to learn Bootstrap is to copy-and-paste examples. You can find them [here](https://getbootstrap.com/docs/5.2/examples/).

* Click on an exemple to your liking
* Use <kbd>CTRL+U</kbd> or "View page source" to see the code
* Copy-paste it inside your project and tune it
</div><div>

Additionally, open the [documentation](https://getbootstrap.com/docs/5.2/getting-started/introduction/), and search what you want to do. For instance, [a navbar](https://getbootstrap.com/docs/5.2/components/navbar/). You will see

* the code
* a preview of the expected output
</div></div>

<hr class="sep-both">

## 📖 Bootstrap basics 📖

<div class="row row-cols-md-2 mt-4"><div>

As many CSS frameworks, Bootstrap is defining CSS classes, and you will simply have to use them on your HTML elements.

```html
<someHTMLtag class="add bootstrap classes here" />
```

➡️ If your IDE isn't providing autocompletion for Bootstrap classes, you might consider downloading Bootstrap sources [here](https://getbootstrap.com/docs/5.2/getting-started/download/), and add them in your project.
</div><div>

For instance, to have this button: <button class="btn btn-warning text-dark">xxx</button>

You will have to set the text to black (`text-dark`), to have rounded corners, you will have to add `btn`, and to have a yellow button, you need `btn-warning`.

```
<button class="btn btn-warning text-dark">xxx</button>
```
</div></div>

<hr class="sep-both">

## 🎨 Colors 🖌️ 

<div class="row row-cols-md-2"><div>

Usage:

* Change the color of one element: `text-<color>`
* Change the background of one element: `bg-<color>`

```
<p class="text-success">green text</p>
<p class="bg-success">green background</p>
```
</div><div>

See [Colors](https://getbootstrap.com/docs/5.2/utilities/colors/). 

* <span class="text-success">xxx-success</span>
* <span class="text-warning">xxx-warning</span>
* <span class="text-danger">xxx-danger</span>
* <span class="text-info">xxx-info</span>
* <span class="text-muted">xxx-muted</span>
* And "xxx-dark" for black
</div></div>

<hr class="sep-both">

## 🎬 Breakpoints🎬

See [breakpoints](https://getbootstrap.com/docs/5.2/layout/breakpoints/).

<div class="row row-cols-md-2 mt-4"><div>

Many CSS classes have variants based on a breakpoint. Basically, these are **classes based on a media-query** that will only "enable" them if the screen fit the condition.

* `<none>`: every screen size
* `sm`: any screen of at least **576px** (mobile)
* `md`: any screen of at least **768px** (tablet)
* `lg`: any screen of at least **992px** (pc)
* `xl`: any screen of at least **1200px** (big)
* `xll`: any screen of at least **1400px** (big too)

➡️ This is only useful to make more responsive interfaces.
</div><div>

For instance, with `d-none` that allow us to hide an element.

* `d-done`: always hidden
* `d-sm-done`: hidden for all aside from mobiles
* `d-md-done`: hidden for all aside from mobiles+tablets
* ...

If you want to hide something on mobile only, you will have to combine two classes:

* `d-none`: always hidden
* `d-md-block`: always shown if the screen is at least 768px long

The later being more specific take precedence over the former.
</div></div>

<hr class="sep-both">

## 🏙️ Row and columns 🏙️

<div class="row row-cols-md-2 mt-4"><div>

...
</div><div>

...
</div></div>