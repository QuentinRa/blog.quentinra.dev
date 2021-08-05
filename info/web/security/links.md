# Add rel attribute to external links

[Go back](../index.md#websites-improvements-summary)

You should add the attribute rel to a link
(according to [webhint](https://webhint.io/docs/user-guide/hints/hint-disown-opener/))
because the link could "redirect to a phishing website looking
like the original ...".

Example with the link above

```html
<a href="https://webhint.io/docs/user-guide/hints/hint-disown-opener/" target="_blank" rel="noopener noreferrer">webhint</a>
```