# path selector

[Go back](..)

You can use a sort of path as a selector. Just so you know,
an HTML document is a tree. 

* html
    * head
    * body
        * p
            * text: Hello World
    
For instance it could look like something like that. So
you can use ``>`` and write some path using the previous
selectors.

```css
.a_class > p > span {
    /* some style */
}
```