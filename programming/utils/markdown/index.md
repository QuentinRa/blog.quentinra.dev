# Markdown

<div class="row row-cols-md-2"><div>

Markdown is the language used in `.md` files. It's mostly used to write simple documents such as

* 📝 Git-related documents <small>(README.md, CONTRIBUTING.md...)</small>
* 🏫 Documentation <small>(GIT wikis)</small>
* 🗃️ Websites <small>(GitHub Pages...)</small>
</div><div>

Note that you can use HTML inside Markdown files 💫.

**Resources**

* [markdownguide.org](https://www.markdownguide.org/basic-syntax/)
* [commonmark.org](https://commonmark.org/)
</div></div>

<hr class="sep-both">

## 🪵 Most used elements 🪵

<div class="row row-cols-md-2"><div>

#### Paragraphs

A paragraph is a bloc of text. Leave of blank line to close it.

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

**Nice dude** 🧹: make sure to leave a space after `#`.
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
<!-- a comment -->
```
</div>
</div><div>

#### Code

Code inside a sentence is called **inline code**. You can write some using inverted quotes.

* `inline code`: <code>\`inline code\`</code>
* You can write some code-block with syntax highlighting using 3 inverted quotes, then the highlighting language <small>(ex: c, java, diff...)</small>.

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

You can add more than 3 stars/...

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