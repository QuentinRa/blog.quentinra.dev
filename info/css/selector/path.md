# path selector

[Go back](..)

You can use a sort of path as a selector. Just so you know,
an HTML document is a tree. 

* html
    * head
    * body
        * p
            * text: Hello World
    
For instance, it could look like something like that. So
you can use ``>`` and write some path using the previous
selectors.

```css
.a_class > p > span {
    /* some style */
}
```

Note that you may not skip some nodes, you must
write the full path starting a node that you can choose.
You may check ``state`` selectors to find some useful
functions to make it easier for you.

<div class="sr"></div>

## Apply a style to multiples selectors

You have to apply the same style to a list
of selectors using ``,``.

```css
/** each one of those **/
html, body, p, .a_class {
    background: #1c2127;
}
```

<div class="sl"></div>

## children selector

You can use the ``a space b`` kind of selector
(sorry for the weird name, it's mine) to apply a style
to the tag having the class ``b`` and having an ancestor
having the class ``a``.

```css
/** each one of those **/
.a .b {
    background: #1c2127;
}
```

That will match a tag with a class ``b`` inside a tag
with a class ``a`` like

```html
<p class="a"> 
    <span class="b">applied to this span</span>
</p>
```

and will match

```html
<p class="a"> 
    <span>
        <span class="b">applied to this span</span>
    </span>
</p>
```