<h1 class="display-6 fw400 text-center pe-4 pb-2">
<b>Markdown syntax reference ✍️ </b>
</h1>

<div class="lead fw400 mt-3">

This page is a **summary of the syntax that we are using** in Markdown, and how it is rendered **on this website**.

**Version**: <a href="https://github.com/lgs-games/memorize/blob/master/.github/STATIC_PAGES/MARKDOWN_SYNTAX.md" target="_blank" rel="noopener noreferrer">1.7.2</a> (2022-11-18)

<div class="table-of-contents w-25 mx-auto">

<h2>Table of contents</h2>

1. [Titles](#content-1-titles)
2. [Text](#content-2-text)
3. [Code](#content-3-code)
4. [Links and images](#content-4-links-and-images)
5. [Lists](#content-5-lists)
6. [Table](#content-6-table)
7. [Special](#content-7-special)
8. [Math](#content-8-math)
9. [Details](#content-9-details)
10. [Columns](#content-10-columns)
11. [Usage](#content-11-usage)
</div>

<hr class="sep-both">

## 1. Titles

| Markdown     | Description                  | HTML                       | Preview                                  |
|--------------|------------------------------|----------------------------|------------------------------------------|
| `# title`    | h1 (big header)              | &lt;h1&gt;title&lt;/h1&gt; | <h2 class="display-6 fw-bold">title</h2> |
| `## title`   | h2 (normal header)           | &lt;h2&gt;title&lt;/h2&gt; | <h2 class="h2">title</h2>                |
| `### title`  | h3 (subsection header)       | &lt;h3&gt;title&lt;/h3&gt; | <h2 class="h3">title</h2>                |
| `#### title` | h4 (subsection header) | &lt;h4&gt;title&lt;/h4&gt; | <h2 class="h4">title</h2>                |

Notes

* you can use headers <s>h3</s> <s>h4</s> h5 to h6, but they will be rendered as if they were h2. You should split a big page, so that such a situation does not happen. An alternative would be to use bold.
* **version 1.2.0**: a permalink icon is added to each header (#content-{title}).
* **version 1.2.0**: only one h1 tag per page, others will only be visually similar as h1
* **version 1.4.1**: allowing **h3**
* **version 1.7.2**: allowing **h4**

<hr class="sep-both">

## 2. Text

| Markdown | Description | HTML | Preview |
|----------|----------|----------|----------|
| `text` | some text | &lt;p&gt;text&lt;/p&gt; | <p>text</p> |
| `**text**` | text in bold | &lt;b&gt;text&lt;/b&gt; | <b>text</b>|
| `*text*` | text in italic | &lt;i&gt;title&lt;/i&gt; | 	<i>title</i> |
| `***text***` | text in bold+italic | &lt;b&gt;&lt;i&gt;title&lt;/i&gt;&lt;/b&gt; | <b><i>title</i></b> |
| ❌  <br>(not allowed)| strikethrough text | &lt;s&gt;text&lt;/s&gt; | 	<s>text</s> |
| ❌ | underline text | &lt;u&gt;text&lt;/u&gt; | <u>text</u> |

<hr class="sep-both">

## 3. Code

| Markdown | Description | HTML | Preview |
|----------|----------|----------|----------|
| <code>\`inline code\`</code> | inline code | &lt;code&gt;inline code&lt;/code&gt; | <code>inline code</code> |
| <code>\`\`\`c<br>int main(void){}<br>\`\`\`</code> | block-code | &lt;pre&gt;&lt;code class="language-c"<br>&gt;int main(void){}<br>&lt;/code&gt;&lt;/pre&gt; | <pre><code class="language-c">int main(void){}</code></pre> |
| ❌ | mark text | &lt;mark&gt;text&lt;/mark&gt; | <mark>text</mark> |
| ❌ | keyboard input | &lt;kbd&gt;CTRL-C&lt;/kbd&gt; | 	<kbd>CTRL-C</kbd> |

<hr class="sep-both">

## 4. Links and images

| Markdown | Description | HTML | Preview |
|----------|----------|----------|----------|
| `[a link](URL)` | a link | &lt;a href="https://github.com/lgs-games/memorize" target="_blank" rel="noopener noreferrer"&gt;a link&lt;/a&gt; | 	<a href="https://github.com/lgs-games/memorize" target="_blank" rel="noopener noreferrer">a link</a> |
| `<URL>` | same as `[URL](URL)` | ... | ... |
| `[a link](download:URL/a_file.pdf)`| download link | &lt;a href="URL" download &gt;a link&lt;/a&gt; | **removed** since v1.3.0 |
| `![alt](URL)` | an image | &lt;img src="URL" alt="alt" title="alt" class="mw-100" &gt; | <img src="https://cdn.jsdelivr.net/gh/memorize-code/memorize-references/.assets/icons/icon64.png" class="mw-100" alt="icon" title="icon" > |

<hr class="sep-both">

## 5. Lists

| Markdown | Description | HTML | Preview |
|----------|----------|----------|----------|
| <code>- item<br>- item</code> | unordered list | &lt;ul&gt;&lt;li&gt;item&lt;/li&gt;&lt;li&gt;item&lt;/li&gt;&lt;/ul&gt; | <ul><li>item</li><li>item</li></ul> |
| <code>1. item<br>2. item</code> | ordered list | &lt;ol&gt;&lt;li&gt;item&lt;/li&gt;&lt;li&gt;item&lt;/li&gt;&lt;/ol&gt; | <ol><li>item</li><li>item</li></ol> |

You can nest a list inside another list.

<hr class="sep-both">

## 6. Table

Since **version 1.3.0**, you can use a **table**. The syntax is the same as in the [Markdown course](../_programming/utils/markdown/index.md#content-table). The HTML code is

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

| Markdown | Description | HTML | Preview |
|----------|----------|----------|----------|
| ... | ... | ... | ... |

* **version 1.4**: dark tables removed in the light version

<hr class="sep-both">

## 7. Special

| Markdown | Description | HTML | Preview |
|----------|----------|----------|----------|
| ❌ | quote | &lt;q&gt;text&lt;/q&gt; | <q>text</q> |
| `> text` | blockquote |  &lt;blockquote&gt;text&lt;/blockquote&gt; | <blockquote>text</blockquote> |
| `- [ ] task` | checkbox (checked) | &lt;input disabled="" type="checkbox" checked&gt; | <input disabled="" type="checkbox"> (since v1.1.0) |
| `- [x] task` | checkbox (checked) | &lt;input disabled="" type="checkbox"&gt; | <input disabled="" type="checkbox" checked> (since v1.1.0) |
| [comment]: <> (...) | a comment | &lt;!-- ... --&gt; | ❌ |
| ❌ | a note | &lt;small&gt;a note&lt;/small&gt; | 	<small>a note</small> |
| `---` | horizontal separator | &lt;hr&gt;| ❌ |

* **version 1.4.0**: `<span class="tms">a note</span>` was replaced with `<small>a note</small>`

<hr class="sep-both">

## 8. Math

| Markdown | Description | HTML | Preview |
|----------|----------|----------|----------|
| `text $latex$ text` | inline math | &lt;p&gt;Text \\\\($5 \neq 3 + 1\\\\) text.&lt;/p&gt; | Text $5 \neq 3 + 1$ text. |
| `text @latex@ text` | math block |  &lt;div&gt;<br>Text \\\\[$5 \neq 3 + 1\\\\] text.<br>&lt;/div&gt; | <div>Text \\[$5 \neq 3 + 1\\] text.</div> |

As you could guess

* adding Text before/after is optional
* you can replace "p" or "div" with another tag (span, p, div)

But, you should note

* it's recommended to use `$latex$` for inline latex
* it's recommended to use `<div>\[latex\]</div>` for a block (as `@latex@` is not escaping every formula properly, and hence not always rendering what you wrote)
* **Note**: you need to write **two slashes** if you want to escape a character such as `\\{`

<hr class="sep-both">

## 9. Details

Since **version 1.5.0**, it's a good practice to use details to hide some content, or to let the user hide something.

```html
<details><summary>Title</summary>

Some content, Markdown is allowed.
</details>
```

The result is different according to the classes you gave to **details**.

<table class="table table-striped table-bordered border-dark"><tr>

<th>(none)</th>
<th>details</th>
<th>details-e</th>
<th>details-border</th>
<th>details-s</th>

</tr><tr>

<td><details><summary>Title</summary>Some content</details></td>
<td><details class="details"><summary>Title</summary>Some content</details></td>
<td><details class="details-e"><summary>Title</summary>Some content</details></td>
<td><details class="details-border"><summary>Title</summary>Some content</details></td>
<td><details class="details-s"><summary>Title</summary>Some content</details></td>

</tr></table>

<hr class="sep-both">

## 10. Columns

**Since version 1.6.0**.

<div class="row row-cols-md-2"><div>

```html
<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>
```
</div><div class="align-self-center">
<div class="row row-cols-md-2"><div>

**Some content** 🚀<br>
... (ex: an image) ...
</div><div>

**Some content** 📚<br>
... (ex: describe the image)...
</div></div><br><br>

* You may add the class `align-self-center` to a div to center its content vertically
* **1.7.0**: you may use `mx-0`, `mt-2`, or `mt-4` to apply some margins to your columns
* **1.7.1**: you may use `class="border-start border-dark"` on the second div, to add a vertical separator
</div></div>

<hr class="sep-both">

## 11. Usage

<div class="row row-cols-md-2 mt-4"><div>

* You should **split a page into sections** using a separator, the code is

```html
<!-- left-tailed -->
<hr class="sl">
<!-- right-tailed -->
<hr class="sr">
<!-- both (since v1.3.0) -->
<hr class="sep-both">
```

* you **can use HTML**

We are allowing HTML, but note that using style is not recommended (as it may be disabled later), while scripts aren't allowed 🙄. <a href="https://getbootstrap.com/docs/5.1/getting-started/introduction/" target="_blank" rel="noopener noreferrer">Bootstrap 5</a> classes are allowed, and you may use [our CSS rules](https://github.com/memorize-code/memorize-references/tree/main/.assets/css).

* **version 1.3.0**: using **emojis** is a good practice

You may [learn more about emojis here](../_box/art/emojis.md). You should use them to make the content less monotone, and help the reader focusing on what he needs to remember.
</div><div>

* **add references**

References, are not only the links that you used, but those that we may check if we want to improve the course. You should add a lot of them, and sort them if needed.

* **typos**

You can use Grammarly or LanguageTool to check if they got [hints for you](../_archives/tools/toolbox/writting/index.md).

* **version 1.3.0**: the **title and the description are generated**

Please, try to make it so that the title of a page is good, as it's the one shown by the search engines. The first paragraph should be long (at least 50 characters) and a description of the page, as it will be used for the description of the page, shown by the search engines.
</div></div>
</div>