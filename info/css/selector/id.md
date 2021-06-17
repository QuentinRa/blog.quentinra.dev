# id selector

[Go back](..)

Each HTML tag can have an ``id``. Note that

* you can only add one id per div
* id values must be uniques in an HTML file

```html
<p id="toto">a text here</p>
```

We will use ``#my_id`` as a selector, giving us
in your css file

```css
#toto {
    /* some style */
    color: red;
    font-weight: bold;
    font-size: 15px;
}
```