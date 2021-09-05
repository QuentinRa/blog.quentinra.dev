# Add rel attribute to external links

[Go back](../index.md#security)

You should add the attribute rel to a link (according to [webhint](https://webhint.io/docs/user-guide/hints/hint-disown-opener/)), because the link could "redirect to a phishing website looking
like the original ...".

You may use the "noopener" to prevent a [security breach](https://mathiasbynens.github.io/rel-noopener/) (that got patched), and "noreferrer" so that the website opened do not know which website the visitors are coming from. It looks quite **useless** now, because can use the header (for referrer) and the breach got patched.

```html
<a href="https://webhint.io/docs/user-guide/hints/hint-disown-opener/" target="_blank" rel="noopener noreferrer">webhint</a>
```