# Markdown

Markdown, associated with the ``.md`` extension (like for the famous `README.md`), is commonly used in documentation files or to write simple documents... You can learn it in a couple of minutes. Here is an [amazing markdown guide](https://www.markdownguide.org/basic-syntax/).

You could also write your website in Markdown, using Jekyll or whatever, as you could have read in the [GitHub Pages section](../git/github/pages.md).

> All courses on this website are written in **Markdown** so you can contribute if you want to 🙇. Thanks if you do.

<hr class="sl">

## Titles

You got 6 kinds of titles, created using ``#``. The more ``#`` you add, the smaller your title becomes.

```markdown
# h1 - huge title
## h2
### h3
#### h4
##### h5
###### h6 - tiny title
```

**Note**: be sure to leave a space after ``#``.

<hr class="sr">

## Basic text

```markdown
Here is a text
that continues here.

This is another paragraph.
\
This is still the same paragraph, but you should
not use this uncommon syntax.

This **text is in bold**, while this *text is in italic*.
This is also in __bold__, while this is also in _italic_.
And, this is in ***bold and italic***.

And this is a ~~crossed text~~ (strike-through) but it's not
supported everywhere it (ex: this website does not so you
need to use the HTML tag "s").
```

<hr class="sl">

## Lists

You may use ``*`` or `-` or `+`. It looks like this

```markdown
* an item
* another item
    * an item of a sub-list
      having a long description
    * and yet another item
* a 3rd item
```

You can replace ``*`` with a number to make an ordered list. You can mix both too.

```markdown
1. an item
2. another item
    * an item of a nested list
      having a long description
    * and yet another item
3. a 3rd item
```

<hr class="sr">

## Code

You can write ``inline code`` using inverted quotes

```markdown
You can write `inline code` using inverted quotes 
```

and you can write a lot of code, using this syntax. Note that ``c`` is the language used for highlighting the code.

<pre class="language-c">
<code class="language-c"
>```c
int main(void) {

}
```</code>
</pre>

<hr class="sl">

## Links and images

```markdown
For **link**: [text that will be shown](https://example.com)
For an **image**: ![text if the image is not found](https://lgs-games.com/assets/icon64.png)

You can create a **link with a text shown when hovered** with
[text that will be shown](https://example.com "some text here")

You could create a link easily with <https://example.com>.
```

<hr class="sr">

## Table

This is NOT supported everywhere, but you can make a table with this code

```markdown
| Column name | Column name |
| ------ | ------ |
| tab[0][0] | tab[0][1] |
| tab[1][0] | tab[1][1] |
| tab[2][0] | tab[2][1] |
| tab[3][0] | tab[3][1] |
| tab[4][0] | tab[4][1] |
| tab[5][0] | tab[5][1] |
```

You can center the column content by adding ``:---:`` instead of `---`. You can align the content to the right/left by only adding ``:`` at the right/left of ```---```.

<hr class="sl">

## Emojis

You can write ``:emoji:`` to render an emoji, with "emoji" the one you want. The list of values can be found here

* [markdown-emojis](https://github.com/markdown-templates/markdown-emojis)
* [emoji-cheat-sheet](https://github.com/ikatyang/emoji-cheat-sheet) (official)

<hr class="sr">

## Other features

You can make a **quote** with

```markdown
> some quote
```

And you can use **horizontal separators** with

```markdown
***

---

_________________
```

You may be able to use a **checkbox** too with

```markdown
* [ ] not checked
* [x] checked
```

And you can write comments with this syntax

```markdown
[comment]: <> (a comment)

[//]: <> (This is also a comment.)

[//]: # (This may be the most platform-independent comment)
```

This is a normal code block, but this is a particular case, **it's used a lot in documentation** to show "what you could do before" and "what you need to do now".

<pre><code class="language-markdown"
>```diff
- removed
+ added
```</code></pre>

<hr class="sl">

## HTML in Markdown

You can use HTML in Markdown. But beware, you can't use Markdown **inside** HTML tags unless you add a blank line

```markdown
<div>

I can write markdown here like <https://example.com/>,
because I added a blank line.
</div>
```

Here are some things you can do using HTML

* [centering something](features/centering.md)
* [dropdown](features/dropdown.md)

And here are some HTML tags you may use

| Tag | Preview |
| ------ | ------ |
| <b>s</b> (strike-through) | <s>word</s> |
| <b>u</b> (underline) | <u>word</u> |
| <b>kbd</b> | <kbd>CTRL+X</kbd> |
| <b>sup</b> (used in footnotes) | <sup>[1]: From XXX</sup><br><sup>[2]: Notation used in XXX</sup> |
| <b>dl</b>, <b>dt</b> (keyword), and <b>dd</b> (definition). <br> (the definition is usually indented, so it looks better) | <dl><dt>Keyword</dt><dd>definition</dd></dl> |
| <b>abbr</b> (show a note on hover) | <abbr title="Shown when hovered">some text</abbr> |
| <b>mark</b> | This <mark>word</mark> has a yellow background. |
| <b>ruby</b> and <b>rt</b> (put some text above another one) | <ruby>Memorize<rt>version 5.0</rt></ruby> |
| <b>progress</b> | <progress value="50" max="100"></progress> 50% |

<hr class="sr">

## Summary

| Markdown | HTML |
| ------ | ------ |
| \#\# Title | <h2>title</h2> |
| \*\*bold\*\* | <b>bold</b>|
| \*italic\* | <i>bold</i>|
| \~\~crossed text\~\~ | <s>strike-through</s>|
| a list | <ul>, <ol>, and <li> |
| \`code\` | <code>code</code> |
| code-block | <pre><code>code</code></pre> |
| \[link](url)|<a href="url">link</a>|
| \!\[alt](url)|<img src="url" alt="alt">|
| \> text | <blockquote>text</blockquote> |
| \--- | <hr> |
| new line | <br> |

<hr class="sl">

## Sources

* <https://www.markdownguide.org/basic-syntax/>
* <https://www.markdowntutorial.com/>
* <https://www.markdownguide.org/getting-started/>
* [comments in MD](https://stackoverflow.com/questions/4823468/comments-in-markdown)
* <https://www.madoko.net/>
* <https://guides.github.com/features/mastering-markdown/>
* <https://sindresorhus.com/github-markdown-css/>
* <https://www.jetbrains.com/help/hub/Markdown-Syntax.html>