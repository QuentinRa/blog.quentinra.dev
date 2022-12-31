# Bootstrap

<div class="row row-cols-md-2"><div>

[Bootstrap](https://getbootstrap.com/) is the most popular CSS framework with more than 160k ⭐ on [GitHub](https://github.com/twbs/bootstrap). Some redeeming features from my point of view are

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

➡️ The best way to learn Bootstrap is to copy-and-paste examples. You can find them [here](https://getbootstrap.com/docs/5.2/examples/).

* Click on an example to your liking
* Use <kbd>CTRL+U</kbd> or "View page source" to see the code
* Copy-paste it inside your project and tune it
</div><div>

➡️ Additionally, open the [documentation](https://getbootstrap.com/docs/5.2/getting-started/introduction/), and search what you want to do. For instance, [a navbar](https://getbootstrap.com/docs/5.2/components/navbar/). You will see

* the code
* a preview of the expected output

➡️ See also [W3Schools/Bootstrap 5](https://www.w3schools.com/bootstrap5/index.php) and [exercises](https://www.w3schools.com/bootstrap5/exercise.php).
</div></div>

<hr class="sep-both">

## 📖 Bootstrap basics 📖

<div class="row row-cols-md-2 mt-4"><div>

Like all CSS frameworks, Bootstrap is defining CSS classes, and you will simply have to use them on your HTML elements.

```html
<someHTMLtag class="add bootstrap classes here" />
```

➡️ If your IDE isn't providing autocompletion for Bootstrap classes, you might consider downloading Bootstrap sources [here](https://getbootstrap.com/docs/5.2/getting-started/download/), and adding them to your project.
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

Many CSS classes have variants based on a breakpoint. Basically, these are **classes based on a media query** that will only "enable" them if the screen fits the condition.

* `<none>`: every screen size
* `sm`: any screen of at least **576px** (mobile)
* `md`: any screen of at least **768px** (tablet)
* `lg`: any screen of at least **992px** (pc)
* `xl`: any screen of at least **1200px** (big)
* `xll`: any screen of at least **1400px** (big too)

➡️ This is only useful to make more responsive interfaces.
</div><div>

For instance, with `d-none` that allows us to hide an element.

* `d-none`: always hidden
* `d-sm-none`: hidden for all aside from mobiles
* `d-md-none`: hidden for all aside from mobiles+tablets
* ...

If you want to hide something on mobile only, you will have to combine two classes:

* `d-none`: always hidden
* `d-md-block`: always shown if the screen is at least 768px long

When the screen size if at least 768px long, the latter being more specific takes precedence over the former.
</div></div>

<hr class="sep-both">

## 📦 Useful classes 📦

<div class="row row-cols-md-2 mt-4"><div>

**Visibility**

* `d-none`: hide something (support breakpoints)
* `d-block`: show something (support breakpoints)
* `d-print-none`: do not show when printing the page

**Alignment**

* `align-self-center`: align center (vertically)
* `justify-content-center`: align center (horizontally)
* `text-center`: center text (horizontally)
* `text-start`/`text-end`: align text (left/right)

**Text**

* `h1`/`h2`/.../`h6`: give the same style as the matching header
* `lead`: give a special style to a paragraph
* `display-n` (1 to 6): huge titles

Less used/useful

* `text-truncate`/`text-break`
* `text-lowercase`/`text-uppercase`

</div><div>

**Margins/Padding** (see [Margins/Padding](https://getbootstrap.com/docs/5.2/utilities/spacing/), support breakpoints)

* `p-0`/`p-1`/.../`p-5`: padding levels
* `m-0`/`m-1`/.../`m-5`: margin levels
* `pt/pb/ps/pe-<level>`: padding on only one corner <small>(s=left, e=right)</small>
* `mt/mb/ms/me-<level>`: margin on only one corner  <small>(s=left, e=right)</small>
* `mx-<level>`/`my-<level>`: margin on both s/e or t/b
* `px-<level>`/`py-<level>`: padding on both s/e or t/b
* `mx-auto`/`my-auto`: center horizontally/vertically

```html
<p class="pt-5 mx-0">Padding-top level 5 (=3rem)</p>
<p class="mx-3">Margin x and y, level 3 (=1rem)</p>
```

**Style**

* `rounded-0`/.../`rounded-5`: rounded corners
* `border-<color>`: used to set border-color

**Size**

* `w-auto`/`w-0`/`w-25`/`w-50`/`w-75`/`w-100`: width (w-50=50%)
* `h-auto`/`h-0`/`h-25`/`h-50`/`h-75`/`h-100`: height (h-50=50%)
* `mw-100`: max-width 100% <small>(ex: prevent horizontal overflow for images)</small>
* `hw-100`: max-height 100%
</div></div>

<hr class="sep-both mh-100">

## 🏙️ Row and columns 🏙️

<div class="row row-cols-md-2 mt-4"><div>

Rows are allowing us to add items next to each other. Using breakpoints, we can do things like display one element per "row" on mobile, two on tablets, and three or more on computers.

```
<div class="row mx-0">
    <div class="col-md-6 col-12"></div>
    <div class="col-md-6 col-12"></div>
</div>
```

A row is **12 columns**. A row will keep elements on the same line if their sum is less than 12, otherwise, they will go to the next line.

In the code above, on mobile, each element will take 12 columns (ex: a whole line), but on tablets (md), each element will take 6 columns, so we will be able to put two on the same line.
</div><div>

This code is a simplified version of the previous one, doing exactly the same. `row-cols-md-2` means that we should have 2 columns on md or higher, otherwise, we will have one <small>(as there is no other rule)</small>.

```html
<div class="row row-cols-md-2">
    <div></div>
    <div></div>
</div>
```

Other notes

* `col`: without a number, columns are of equal size
</div></div>

<hr class="sep-both">

## 📊 Tables 🗓️

See [Tables](https://getbootstrap.com/docs/5.2/content/tables/).

<div class="row row-cols-md-2 mt-4"><div>

Everything is starting by adding the `table` class.

```html
<table class="table"></table>
```

Then, as always, you can add more classes.

**Style**

* `table-hover`: hover the current row
* `table-striped`: alternate colors between rows
* `table-<color>`: tune the table using the color (danger/warning...)

</div><div>

**Borders**

By default, there are only borders between rows.

* `table-bordered`: add all borders
* `table-borderless`: remove all borders

**Special**

* `table-responsive`: add a scrollbar if the screen is too small
</div></div>

<hr class="sep-both">

## 🌠 Components 🌠️

<div class="row row-cols-md-2 mt-4"><div>

* [Alerts](https://getbootstrap.com/docs/5.2/components/alerts/): useful to show a message (ex: announcement, errors...)

```html
<p class="alert alert-danger">xxx</p>
```

* [Cards](https://getbootstrap.com/docs/5.2/components/card/): profile cards, products...

* [Carousel](https://getbootstrap.com/docs/5.2/components/card/): a slideshow
</div><div>

* [Modal](https://getbootstrap.com/docs/5.2/components/modal/): a nice popup

* [Toasts](https://getbootstrap.com/docs/5.2/components/toasts/): Pretty in-browser notifications

* [Navbar](https://getbootstrap.com/docs/5.2/components/modal/) and [Navs](https://getbootstrap.com/docs/5.2/components/navs-tabs/): a navbar/a menubar

* [accordion](https://getbootstrap.com/docs/5.2/components/accordion/): pretty "details" tag (~dropdowns)

* See [Forms](https://getbootstrap.com/docs/5.2/forms/overview/) for forms.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* container/container-fluid
* update this old content
* [bootstrapshuffle](https://bootstrapshuffle.com/)
* [bootswatch](https://github.com/thomaspark/bootswatch)
</div><div>

```
h-100
fs-4
fw-bold
align-middle
btn-outline-info
list-inline + list-inline-item
```
</div></div>