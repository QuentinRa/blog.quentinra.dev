# state selector

[Go back](..)

It's something you can add to one
of the 3 previous selector introduced.

The idea is when you selected something,
you will filter the selection like you could
have saw using attribute when tag selectors.
Here some of them usable this time on any kind
of selectors.

```css
button:hover { /* mouse on top of it */ }
input:checked { /* checked input */ }
a:active { /* active link */ }
input:focus { /* typing ~= focused input */ }
button:disabled { /* ... */ }
a:visited { /* visited link */ }
```

<div class="sr"></div>

## CSS functions

You got some functions that will help you selecting
or not something

```css
p > * { /* applied to all tags inside a p tag */ }

p > :not(a) { /* applied to all tags inside a p tag
 that are not links. You could ue another selector
 aside from a here.
 */ }

p:first-child { /* first child */ }
p:last-child { /* last child */ }
p:nth-child(1) { /* nth child */ }
```