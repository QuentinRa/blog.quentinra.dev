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

* a permalink icon is added to each header (#content-{title}).
* you can use headers h3 to h6, but they will be rendered as if they were h2. You should split a big page, so that such a situation does not happen. An alternative would be to use bold.
* if you add more than one header h1, they will be rendered using the style shown above, but their html tag will be h2

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

## 1.4 Links, images, and files

| Markdown | Description | HTML | Preview |
|----------|----------|----------|----------|
| `[a link](URL)` | a link | &lt;a href="URL" target="_blank" rel="noopener noreferrer"&gt;a link&lt;/a&gt; | 	<a href="https://github.com/lgs-games/memorize" target="_blank" rel="noopener noreferrer">a link</a> |
| `<URL>` | same as `[URL](URL)` | ... | ... |

<hr class="sep-both">

## 1.5 Special

| Markdown | Description | HTML | Preview |
|----------|----------|----------|----------|
| ❌ | quote | &lt;q&gt;text&lt;/q&gt; | <q>text</q> |
| `> text` | blockquote |  &lt;blockquote&gt;text&lt;/blockquote&gt; | <blockquote>text</blockquote> |

Since **version 1.3.0**, you can use a table. The syntax and the preview are the same as in the [Markdown course](../tools/markdown/index.md#table).

<hr class="sep-both">

## 1.6 Math

| Markdown | Description | HTML | Preview |
|----------|----------|----------|----------|
| `text $latex$ text` | inline math | &lt;p&gt;Text \($5 \neq 3 + 1\) text.&lt;/p&gt; | Text $5 \neq 3 + 1$ text. |
| `text @latex@ text` | math block |  &lt;div&gt;<br>Text \[$5 \neq 3 + 1\] text.<br>&lt;/div&gt; | Text @5 \neq 3 + 1@ text. |
| ❌ | inline math | ❌ omitted ❌ | Text $5 \neq 3 + 1$ text. |
| `text @latex@ text` | math block | ❌ omitted ❌ | Text @5 \neq 3 + 1@ text. |

As you could guess

* adding Text before/after is optional
* you can replace "p" or "div" by another tag (span, p, div)

But, you should note

* it's recommended to use `$latex$` for inline latex
* it's recommended to use `<div>\[latex\]</div>` for a block (as `@latex@` is not escaping every formula properly, and hence not always rendering what you wrote)

<hr class="sep-both">

## 1.6 Usage

* You should **split a page in sections** using a separator, the code is

```html
<!-- left-tailed -->
<hr class="sl">
<!-- right-tailed -->
<hr class="sr">
```

</div>