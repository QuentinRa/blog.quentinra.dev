# tag selector

[Go back](..)

Using a tag as a selector means that all "instances"
of this tag will have this style. For instance

```css
p {
    color: #FFCC33;
    background: #1c2127;
}
```

Will apply the color ``yellow`` and the background
``blue/black`` for each p tag in the HTML page.

<div class="sr"></div>

**Filter selector by attribute value**

You can filter selected tags by the value of an attribute.
For instance, if you want to style all input, but only
if they are the input of ``type="text"`` then you would
use

```css
input[type="text"] {
   /* some style */
}
```