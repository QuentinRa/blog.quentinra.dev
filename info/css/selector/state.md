## CSS functions

You got some functions that will help you select
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