# joker selector

[Go back](..)

I'm calling our two special selectors "joker" selectors.

<hr class="sr">

## *

The "**do not use this selector**" selector is a selector
applying a style to EACH AND EVERY tag in the HTML. It's
not even supported everywhere (at least seems like there
are issues)

```css
* {
    padding: 0;
    margin: 0;
}
```

in most case, using HTML or BODY as selector is
enough.

<hr class="sr">

## :root

And the second one is the ``:root`` selector, also
not supported everywhere and used to declare some
constants.

```css
:root {
    --my-size: 15px;
    --my-red: #dd4441;
}
```

and you could do

```css
p {
    color: var(--my-red);
    padding: var(--my-size);
}
```