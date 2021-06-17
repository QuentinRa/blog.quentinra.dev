# class selector

[Go back](..)

Each HTML tag can have a ``class`` attribute,
but you can add a lot of classes by separating
the values with one space.

```html
<p class="text-danger bg-dark">a text here</p>
```

and in your style.css you will use ``.class`` selector

```css
.text-danger {
    color: #dd4441;
}

.bg-dark {
    background: #1c2127;
}
```

<div class="sr"></div>

**Cumulative classes selector**

You can select a tag with a suite of classes.

```css
.text-danger.bg-dark {
    color: #dd4441;
    background: #1c2127;
}
/* or since the example will be with p */
p.text-danger.bg-dark {
    color: #dd4441;
    background: #1c2127;
}
```

Will match

```html
<p class="text-danger bg-dark">a text here</p>
```

and won't match

```html
<p class="text-danger">a text here</p>
<p class="bg-dark">a text here</p>
```
