<h1 class="display-6 fw400 text-center pe-4 pb-2">
<b>Markdown syntax reference ✍️ </b>
</h1>

<div class="lead fw400 mt-3">

This page is a **summary of the syntax that we are using** in Markdown, and how it is rendered **on this website**.

**Version**: 1.0.0

<hr class="sep-both">

## 1.1 Titles

| Markdown | Description | HTML | Preview |
|----------|----------|----------|----------|
| `# title` | h1 (big header) | &lt;h1&gt;title&lt;/h1&gt; | <h2 class="display-6 fw-bold">title</h2> |
| `## title` | h2 (normal header) | &lt;h2&gt;title&lt;/h2&gt; | <h2 class="h2">title</h2> |

Notes

* a permalink icon is added to each header (#content-{title}).
* you can use headers h3 to h6, but they will be rendered as if they were h2. You should split a big page, so that such a situation does not happen. An alternative would be to use bold.

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

## 1.4 Special

| Markdown | Description | HTML | Preview |
|----------|----------|----------|----------|
| ❌ | quote | &lt;q&gt;text&lt;/q&gt; | <q>text</q> |
| `> text` | blockquote |  &lt;blockquote&gt;text&lt;/blockquote&gt; | <blockquote>text</blockquote> |

</div>