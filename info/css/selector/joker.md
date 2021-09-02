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