# Ordered list

[Go back](../index.md#learn-the-tags-advanced)

You can use ol to create an ordered list, or ul to create an unordered list. Each item is inside a tag li. You can nest a list inside another, simply by writing another ul/ol inside a tag li.

```html
<ol>
    <li>one</li>
    <li>two</li>
    <li>...</li>
</ol>

<ol>
    <li>one</li>
    <li>two
        <ul>
            <li>...</li>
            <li>...</li>
        </ul>
    </li>
</ol>
```

> **Note**: Simply replace ol by ul to make an ordered list.

<hr class="sl">

## Result of the code above

<ol>
    <li>one</li>
    <li>two</li>
    <li>...</li>
</ol>

<ol>
    <li>one</li>
    <li>two
        <ul>
            <li>...</li>
            <li>...</li>
        </ul>
    </li>
</ol>

<hr class="sr">

## Notes

> You can add the attribute `start="n"` for **ordered lists**, which is `start="1"` by default.

> You can only change the style of a list (i.ii.iii, I.II.III, A.B.C., a.b.c.) using CSS, as the attribute type is deprecated. See `list-style-type`. 

> You can reverse a list with `rev` or `reversed` (both are working, but you should use the latter).