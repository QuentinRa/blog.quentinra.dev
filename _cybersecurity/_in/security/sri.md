# Subresource Integrity (SRI)

[Go back](../../../_programming/web/_general/_old/general/index.md#security)

This is something **you may have seen** when using CDN such as cdnjs, but didn't look into it (at least that was my case). When you are getting a library from a CDN like [mathjax](https://cdnjs.com/libraries/mathjax), the generated HTML tag is looking like this

```html
<script src="SOME/URL" 
        integrity="sha512-93xLZnNMlYI6xaQPf/cSdXoBZ23DThX7VehiGJJXB76HTTalQKPC5CIHuFX8dlQ5yzt6baBQRJ4sDXhzpojRJA==" 
        crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
```

The "integrity" and the hash provided is what we call **SRI** (**Subresource Integrity**). It makes sure that you get what you came for, and not some malicious script because the provider got hacked or something.

Beware that it does not work with the magic links, that are automatically upgrading the scripts on the CDN. You should not use that anyway.

If your CDN provider does not provide an integrity value 😲, then [get one here](https://www.srihash.org/), but it may be better to switch to another CDN 🙄.