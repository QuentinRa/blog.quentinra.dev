# Markdown

<div class="row row-cols-md-2"><div>

Markdown is the language used in `.md` files. It's mostly used to write simple documents such as

* 📝 Git-related documents <small>(ex: README.md, CONTRIBUTING.md...)</small>
* 🏫 Documentation <small>(ex: GIT wikis, [see documentation tools](/tools-and-frameworks/others/documentation/index.md)...)</small>
* 🗃️ Websites <small>(ex: GitHub Pages, [see static sites generators](/programming-languages/web/others/ssg/index.md)...)</small>
* 🎉 Articles
* 🖼️ Presentations <small>(ex: slick)</small>
* ...
</div><div>

Note that you can use HTML inside Markdown files 💫.

**Resources**

* [markdownguide.org](https://www.markdownguide.org/basic-syntax/)
* [commonmark.org](https://commonmark.org/)
* [markdowntutorial](https://www.markdowntutorial.com/)

**Editors**

* [madoko](https://www.madoko.net/editor.html) (👻, web)
* [zettlr](https://www.zettlr.com/)  (👻, desktop)
* [obsidian](https://obsidian.md/)
</div></div>

<hr class="sep-both">

## 🪵 Most used elements 🪵

<div class="row row-cols-md-2"><div>

#### Paragraphs

A paragraph is a block of text. Leave a blank line to close it.

<div class="row row-cols-md-2"><div>

```markdown
Here is a text
that continues here.

Here is a text
\
that continues here. Do not use this uncommon syntax.
```
</div><div>

Here is a text
that continues here.

Here is a text
\
that continues here. Do not use this uncommon syntax.
</div></div>

<br>

#### Basic style

* **bold**: `**bold**` or `__bold__`
* *italic*: `*italic*` or `_italic_`
* ***bold+italic***: `***bold+italic***` or `___bold+italic___`
* <s>crossed text</s>: `~~crossed text~~` or `<s>crossed text</s>`
* <u>underline</u>: `<u>underline</u>`

</div><div>

#### Titles

The more `#` you add, the smaller your title becomes.

<div class="row row-cols-md-2"><div>

```markdown
# h1 - huge title
## h2
### h3
#### h4
##### h5
###### h6 - tiny title
```
</div><div>

<h6 class="h1">h1 - huge title</h6>
<h6 class="h2">h2</h6>
<h6 class="h3">h3</h6>
<h6 class="h4">h4</h6>
<h6 class="h5">h5</h6>
<h6 class="h6">h6 - tiny title</h6>
</div></div>

**Good practice** 🧹: make sure to leave a space after `#`.
</div></div>

<hr class="sep-both">

## 🌿 Other elements 🌿

<div class="row row-cols-md-2"><div>

#### Lists

Use `*`, `+`, or `-` to create unordered lists. Use `n.` for ordered lists.

<div class="row row-cols-md-2"><div>

```markdown
1. an item
2. an item
    * an item
    * an item
3. an item
```
</div><div>

1. an item
2. an item
    * an item
    * an item
3. an item
</div></div>

<br>

#### Links

* [example](https://example.com): `[example](https://example.com)`
* <https://example.com>: `<https://example.com>`
* If supported, you can add a title `[placeholder](URL "title")`

<br>

#### Images

* `![alt](URL)` is the same as `<img src="URL" alt="alt">`
* `![alt](URL "title")` with a title `<img [...] title="title">`

<br>

#### Comments

<div class="mt-4">

```markdown
[comment]: <> (a comment)
[//]: <> (a comment)
[//]: # (a comment)
```
</div>
</div><div>

#### Code

Code inside a sentence is called **inline code**. You can write inline code in inverted quotes.

* `inline code`: <code>\`inline code\`</code>
* You can write some code blocks with syntax highlighting using 3 inverted quotes, then the highlighting language <small>(ex: c, java, diff...)</small>.

<div class="row row-cols-md-2"><div>

<pre><code class="language-markdown"
>```diff
unchanged
- removed
+ added
```</code></pre>
</div><div>

```diff
unchanged
- removed
+ added
```
</div></div>

<br>

#### Quotes

<div class="row row-cols-md-2 mb-3 mt-4"><div>

```markdown
> some quote
```
</div><div>

> some quote
</div></div>

<br>

#### Horizontal separators

<div class="row row-cols-md-2 mb-3 mt-4"><div>

```markdown
***
---
___
```
</div><div class="align-self-center">

It will work the same if you add more than 3 stars/...

---
</div></div>
</div></div>

<hr class="sep-both">

## 🥥 Extended Markdown 🥥

Extended features are available on most Markdown interpreters (ex: GitHub), but they are not available by default.

<div class="row row-cols-md-2"><div>

#### Tables

<div class="row row-cols-md-2"><div>

```markdown
| Column name | Column name |
| --- | --- |
| tab[0][0] | tab[0][1] |
| tab[1][0] | tab[1][1] |
```
</div><div>

| Column name | Column name |
|-------------|-------------|
| tab[0][0]   | tab[0][1]   |
| tab[1][0]   | tab[1][1]   |
</div></div>

You may also note that you can add more than 3 hyphens (`---`). And, you can use `:` to align values inside a column.

* `:---`: align left
* `---:`: align right
* `:---:`: align center
</div><div>

#### Checkbox

<div class="row row-cols-md-2 mt-4"><div>

```markdown
* [ ] not checked
* [x] checked
```
</div><div class="align-self-center">

* [ ] not checked
* [x] checked
</div></div>

<br>

#### Emojis

You can write `:emoji:` to render an emoji, with "emoji" the one you want. It works on GitHub, and some parsers are also supporting these. Otherwise, you may directly copy-paste emojis.

* [markdown-emojis](https://github.com/markdown-templates/markdown-emojis) / [gist:7360908](https://gist.github.com/rxaviers/7360908)
* [emoji-cheat-sheet](https://github.com/ikatyang/emoji-cheat-sheet)
</div></div>

<hr class="sep-both">

## 🍹 Using HTML 🍹

<div class="row row-cols-md-2"><div>

You can use HTML inside your Markdown.


| Markdown             | HTML                                       |
|----------------------|--------------------------------------------|
| \#\# Title           | &lt;h2&gt;title&lt;/h2&gt;                 |
| \*\*bold\*\*         | &lt;b&gt;bold&lt;/b&gt;                    |
| \*italic\*           | &lt;i&gt;bold&lt;/i&gt;                    |
| \~\~crossed text\~\~ | &lt;s&gt;strike through&lt;/s&gt;          |
| a list               | see &lt;ul&gt;, &lt;ol&gt;, and &lt;li&gt; |
| \`code\`             | &lt;code&gt;code&lt;/code&gt;              |
| \[link](url)         | &lt;a href="URL"&gt;link&lt;/a&gt;         |
| \!\[alt](url)        | &lt;img src="URL" alt="alt"&gt;            |
| \> text              | &lt;blockquote&gt;text&lt;/blockquote&gt;  |
| \---                 | &lt;hr&gt;                                 |
| blank line           | &lt;br&gt;                                 |

<br>

#### Markdown inside HTML

You can use Markdown inside HTML, but you need to leave a blank line after the leading tag.

<div class="row row-cols-md-2"><div>

```markdown
<div>
**Here**, you cannot use Markdown.

**But**, here you can.
</div>
```
</div><div>

<div>**Here**, you cannot use
Markdown.

<br>**But**, here you can.
</div>
</div></div>

<br>

#### Center something

<div class="row row-cols-md-2 mt-4"><div>

```markdown
<div align="center">

This text is **centered**
</div>
```
</div><div>

<div align="center">

This text is **centered**
</div>
</div></div>

</div><div>

#### Dropdowns

<div class="row row-cols-md-2 mt-4"><div>

```html
<details open>
<summary>Dropdown open</summary>
Content
</details>
```

<details open>
<summary>Dropdown open</summary>
Content
</details>
</div><div>

```html
<details>
<summary><b>Click here to expand</b>
A short description
</summary><hr>

A long description
</details>
```

<details>
<summary><b>Click here to expand</b>

A short description
</summary><hr>

A long description
</details>
</div></div>

<br>

#### Other nice HTML tags

<p></p>

| Tag | Preview                                                          |
| ------ |------------------------------------------------------------------|
| <b>kbd</b> | <kbd>CTRL+X</kbd>                                                |
| <b>sup</b> (used in footnotes) | <sup>[1]: From XXX</sup><br><sup>[2]: Notation used in XXX</sup> |
| <b>dl</b>, <b>dt</b> (keyword), and <b>dd</b> (definition). <br> (the definition is usually indented, so it looks better) | <dl><dt>Keyword</dt><dd>definition</dd></dl>                     |
| <b>abbr</b> (show a note on hover) | <abbr title="Shown when hovered">some text</abbr>                |
| <b>mark</b> | This <mark>word</mark> has a yellow background.                  |
| <b>ruby</b> and <b>rt</b> (put some text above another one) | <p></p><ruby>Some title<rt>version 5.0</rt></ruby>               |
| <b>progress</b> | <progress value="50" max="100"></progress> 50%                   |

</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [GitHub Guide](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)
* [sindresorhus.com](https://sindresorhus.com/github-markdown-css/)
* [JetBrains](https://www.jetbrains.com/help/hub/Markdown-Syntax.html#quick-notes-markdown-headings)
* [markdown-here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
* [commonmark](https://github.com/commonmark/commonmark-java) (Markdown to Java)
</div><div>
</div></div>