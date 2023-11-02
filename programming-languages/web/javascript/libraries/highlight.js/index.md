# highlight.js

<div class="row row-cols-lg-2"><div>

[Highlight.js](https://highlightjs.org/) <small>(22.2k ⭐)</small> is an open-source library to syntax highlight code snippets on web pages. [Prism](https://prismjs.com/) is the main alternative.

* 💸 Free and Open-Source
* 🌍 Supports [many languages](https://highlightjs.readthedocs.io/en/latest/supported-languages.html) <small>(192+)</small>
* 🎨 Supports many themes <small>(496+)</small>

It's the library used by the popular [Stack Overflow](https://stackoverflow.com/) and [Discord](https://discordapp.com/).

<br>

**Load the library** 📚

You can find the tag to load it on the [cdnjs](https://cdnjs.com/libraries/highlight.js) website. You should add tags for all languages you want to use, which is more secure than letting the script automatically import them ☠️.

```html!
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/X.Y.Z/highlight.min.js" [...]></script>
```

</div><div>

**Write Code** 🤖

```xml!
<pre><code class="language-c"
>int main() {
    exit 0;
}
</code></pre>
```

<br>

**Highlight Code** 🚀

Once the content to highlight is rendered, you need to call `hljs`:

```xml!
<script>
hljs.highlightAll();
</script>
```
</div></div>