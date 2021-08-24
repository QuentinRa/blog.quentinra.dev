<h1 class="display-6 fw400 text-center pe-4 pb-2">
<b>Markdown syntax reference ✍️ </b>
</h1>

<div class="lead fw400 mt-3">

This page is a **summary of the syntax that we are using** in Markdown, and how it is rendered **on this website**.

**Version**: 1.3.0

<hr class="sep-both">

## 1.1 Titles

| Markdown | Description | HTML | Preview |
|----------|----------|----------|----------|
| `# title` | h1 (big header) | &lt;h1&gt;title&lt;/h1&gt; | <h2 class="display-6 fw-bold">title</h2> |
| `## title` | h2 (normal header) | &lt;h2&gt;title&lt;/h2&gt; | <h2 class="h2">title</h2> |

Notes

* you can use headers h3 to h6, but they will be rendered as if they were h2. You should split a big page, so that such a situation does not happen. An alternative would be to use bold.
* **version 1.2.0**: a permalink icon is added to each header (#content-{title}).
* **version 1.2.0**: if you add more than one header h1, they will be rendered using the style shown above, but their html tag will be h2

<hr class="sep-both">

## 1.2 Text

| Markdown | Description | HTML | Preview |
|----------|----------|----------|----------|
| `text` | some text | &lt;p&gt;text&lt;/p&gt; | <p>text</p> |
| `**text**` | text in bold | &lt;b&gt;text&lt;/b&gt; | <b>text</b>|
| `*text*` | text in italic | &lt;i&gt;title&lt;/i&gt; | 	<i>title</i> |
| `***text***` | text in bold+italic | &lt;b&gt;&lt;i&gt;title&lt;/i&gt;&lt;/b&gt; | <b><i>title</i></b> |
| ❌  <br>(not allowed)| strikethrough text | &lt;s&gt;text&lt;/s&gt; | 	<s>text</s> |
| ❌ | underline text | &lt;u&gt;text&lt;/u&gt; | <u>text</u> |

<hr class="sep-both">

## 1.3 Code

| Markdown | Description | HTML | Preview |
|----------|----------|----------|----------|
| <code>\`inline code\`</code> | inline code | &lt;code&gt;inline code&lt;/code&gt; | <code>inline code</code> |
| <code>\`\`\`c<br>int main(void){}<br>\`\`\`</code> | block-code | &lt;pre&gt;&lt;code class="language-c"<br>&gt;int main(void){}<br>&lt;/code&gt;&lt;/pre&gt; | <pre><code class="language-c">int main(void){}</code></pre> |
| ❌ | mark text | &lt;mark&gt;text&lt;/mark&gt; | <mark>text</mark> |
| ❌ | keyboard input | &lt;kbd&gt;CTRL-C&lt;/kbd&gt; | 	<kbd>CTRL-C</kbd> |

<hr class="sep-both">

## 1.4 Links and images

| Markdown | Description | HTML | Preview |
|----------|----------|----------|----------|
| `[a link](URL)` | a link | &lt;a href="https://github.com/lgs-games/memorize" target="_blank" rel="noopener noreferrer"&gt;a link&lt;/a&gt; | 	<a href="https://github.com/lgs-games/memorize" target="_blank" rel="noopener noreferrer">a link</a> |
| `<URL>` | same as `[URL](URL)` | ... | ... |
| `[a link](download:URL/a_file.pdf)`| download link | &lt;a href="URL" download &gt;a link&lt;/a&gt; | **removed** since v1.3.0 |
| `![alt](URL)` | an image | &lt;img src="URL" alt="alt" title="alt" class="mw-100" &gt; | <img src="http://memorize.lgs-games.etu/assets/icon64.png" class="mw-100" alt="icon" title="icon" > |

<hr class="sep-both">

## 1.5 Lists

| Markdown | Description | HTML | Preview |
|----------|----------|----------|----------|
| <code>- item<br>- item</code> | unordered list | &lt;ul&gt;&lt;li&gt;item&lt;/li&gt;&lt;li&gt;item&lt;/li&gt;&lt;/ul&gt; | <ul><li>item</li><li>item</li></ul> |
| <code>1. item<br>2. item</code> | ordered list | &lt;ol&gt;&lt;li&gt;item&lt;/li&gt;&lt;li&gt;item&lt;/li&gt;&lt;/ol&gt; | <ol><li>item</li><li>item</li></ol> |

You can nest a list inside another list.

<hr class="sep-both">

## 1.6 Table

Since **version 1.3.0**, you can use a **table**. The syntax is the same as in the [Markdown course](../tools/markdown/index.md#content-table). The HTML code is

```html
<table class="table table-bordered table-striped border-dark"><thead><tr>
<!-- column names -->
<th>Markdown</th><th>Description</th><th>HTML</th><th>Preview</th>
</tr></thead><tbody>
<!-- first row -->
<tr><td>...</td><td>...</td><td>...</td><td>...</td></tr>
<!-- ... -->
</tbody></table>
```

And the result is 

<table class="table table-bordered table-striped border-dark"><thead><tr>
<!-- column names -->
<th>Markdown</th><th>Description</th><th>HTML</th><th>Preview</th>
</tr></thead><tbody>
<!-- first row -->
<tr><td>...</td><td>...</td><td>...</td><td>...</td></tr>
<!-- ... -->
</tbody></table>

* if you need a dark table, use the HTML, and replace "border-dark" with "table-dark"

<hr class="sep-both">

## 1.7 Special

| Markdown | Description | HTML | Preview |
|----------|----------|----------|----------|
| ❌ | quote | &lt;q&gt;text&lt;/q&gt; | <q>text</q> |
| `> text` | blockquote |  &lt;blockquote&gt;text&lt;/blockquote&gt; | <blockquote>text</blockquote> |
| `- [ ] task` | checkbox (checked) | &lt;input disabled="" type="checkbox" checked&gt; | <input disabled="" type="checkbox"> (since v1.1.0) |
| `- [x] task` | checkbox (checked) | &lt;input disabled="" type="checkbox"&gt; | <input disabled="" type="checkbox" checked> (since v1.1.0) |
| [comment]: <> (...) | a comment | &lt;!-- ... --&gt; | 🤐 |

<hr class="sep-both">

## 1.8 Math

| Markdown | Description | HTML | Preview |
|----------|----------|----------|----------|
| `text $latex$ text` | inline math | &lt;p&gt;Text \\\\($5 \neq 3 + 1\\\\) text.&lt;/p&gt; | Text $5 \neq 3 + 1$ text. |
| `text @latex@ text` | math block |  &lt;div&gt;<br>Text \\\\[$5 \neq 3 + 1\\\\] text.<br>&lt;/div&gt; | <div>Text \\[$5 \neq 3 + 1\\] text.</div> |

As you could guess

* adding Text before/after is optional
* you can replace "p" or "div" by another tag (span, p, div)

But, you should note

* it's recommended to use `$latex$` for inline latex
* it's recommended to use `<div>\[latex\]</div>` for a block (as `@latex@` is not escaping every formula properly, and hence not always rendering what you wrote)

<hr class="sep-both">

## 1.9 Usage

* You should **split a page in sections** using a separator, the code is

```html
<!-- left-tailed -->
<hr class="sl">
<!-- right-tailed -->
<hr class="sr">
<!-- both (since v1.3.0) -->
<hr class="sep-both">
```

* you **can use HTML**

We are allowing HTML, but note using style is not recommended, while scripts aren't allowed. <a href="https://getbootstrap.com/docs/5.1/getting-started/introduction/" target="_blank" rel="noopener noreferrer">Bootstrap</a> classes are allowed.

</div>