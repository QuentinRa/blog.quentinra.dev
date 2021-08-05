# Subresource Integrity (SRI)

[Go back](../index.md#websites-improvements-summary)

This is something you may have seen when using CDN
like cdnjs but didn't look into (at least that's
was my case).

When you are getting a library from a
CDN like [mathjax](https://cdnjs.com/libraries/mathjax).
You can generate the HTML tag

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/3.2.0/es5/tex-chtml.min.js" 
        integrity="sha512-93xLZnNMlYI6xaQPf/cSdXoBZ23DThX7VehiGJJXB76HTTalQKPC5CIHuFX8dlQ5yzt6baBQRJ4sDXhzpojRJA==" 
        crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
```

The "integrity" and the hash provided is what we call
SRI (Subresource Integrity). It makes sure that the
you get what you came for, and not some malicious
script because the provider got hacked or something.

If your CDN provider does not provide an integrity
value, then get [one here](https://www.srihash.org/) but
it may be better to switch to another CDN.