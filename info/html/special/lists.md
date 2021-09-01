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