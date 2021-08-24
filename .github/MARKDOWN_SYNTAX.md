<h1 class="display-6 fw400 text-center pe-4 pb-2">
<b>Markdown syntax reference ✍️ </b>
</h1>

<div class="lead fw400 mt-3">

**On this website**, we are **allowing** the following syntax. Please note that this syntax is not definitive. For instance, `~text~` (strikethrough) is not allowed for now, but it may be allowed later. You may also note, that some elements are rendering the same even trough the syntax is not the same (ex: titles). This is a feature, you should only use h1, h2 and h3 anyways.

**Version**: 1.0.0

---

## 1. General syntax

**1.1 Titles**

| Markdown | Description | HTML | Preview |
|----------|----------|----------|----------|
| `# title` | h1 (big header) | &lt;h1&gt;title&lt;/h1&gt; | <h2 class="display-6 fw-bold">title</h2> |
| `## title` | h2 | &lt;h2&gt;title&lt;/h2&gt; | <h2 class="h2">title</h2> |

Notes

* a permalink icon is added to each header (#content-{title}).
* you can use headers h3 to h6, but they will be rendered as if they were h2. You should split a big page, so that such a situation does not happen. An alternative would be to use bold.

**1.2 Text**

| Markdown | Description | HTML | Preview |
|----------|----------|----------|----------|
| `text` | some text | &lt;p&gt;text&lt;/p&gt; | <p>text</p> |
| `**text**` | text in bold | &lt;b&gt;text&lt;/b&gt; | <b>text</b>|
| `*text*` | text in italic | &lt;i&gt;title&lt;/i&gt; | 	<i>title</i> |
| `***text***` | text in bold+italic | &lt;b&gt;&lt;i&gt;title&lt;/i&gt;&lt;/b&gt; | <b><i>title</i></b> |
| ❌ | strikethrough text | &lt;s&gt;text&lt;/s&gt; | 	<s>text</s> |
| ❌ | underline text | &lt;u&gt;text&lt;/u&gt; | <u>text</u> |

</div>