# Code block and inline code

[Go back](../index.md#learn-the-tags-advanced)

You can write some code using **code** wrapped in a **pre**. **pre** is a tag that will render your HTML code exactly like you wrote it inside your code (same spaces, indents, ...).

```html
<pre><code
>some code here
...
...</code>
</pre>
```

Because of the pre tag, you must write the tag code right after the `>`, and end the code tag right after your code. If you want some highlight then you can do that in JavaScript quite easily.

<hr class="sl">

## Preview (code block)

This is the result of the code above (nothing fancy, but you may improve the style later)

<pre><code
>some code here
...
...</code>
</pre>

<hr class="sl">

## Inline code

You may write some <code>inline code</code> by directly
writing a code tag inside a paragraph.

```html
<p>
    You may write some <code>inline code</code> by directly
    writing a code tag inside a paragraph.
</p>
```