# Markdown

Markdown, associated with ``.md`` files,
are commonly used in documentation files or to write
simple documents...

You can learn it in a couple of minutes, that's quite
simple. Here is a fantastic guide
[markdownguide](https://www.markdownguide.org/basic-syntax/).

> Please do take note that this site is written
> in Markdown so you will be able to contribute :)

<div class="sl"></div>

## Titles

You got 6 kinds of titles, created using ``#``.
The more ``#`` you add, the smaller your title becomes.

```markdown
# h1 - really big title
## h2
### h3
#### h4
##### h5
###### h6 - really small title
```

**Note**: be sure to leave a space after ``#``

<div class="sr"></div>

## Basic text

```markdown
Here is a text
that continues here.

This is another paragraph.
\
This is still the same paragraph, but you should
not use this uncommon syntax.

This is in **bold** while this is in
*italic* and this is also in __bold__ while
this is also in _italic_. This is in
***bold and italic***.

And this is a ~~strikethrough text~~ but not all
editors support it.
```

<div class="sl"></div>

## Lists

You may use theses

```markdown
* an item
* another item
    * an item of a sub-list
    that have a long sentence
    * and again another item
* a 3rd item
```

or you can change and use an ordered list or
a mix of both like this

```markdown
1. an item
2. another item
    * an item of a sub-list
    that have a long sentence
    * and again another item
3. a 3rd item
```

**Note**: you may use ``*`` or `-` or `+` for 
unordered lists.

<div class="sr"></div>

## Code

You can write some ``inline code`` using inverted quotes

```markdown
You can write some \`inline code\` using inverted quotes 
```

and you can write a lot of code, using this syntax
where ``c`` is the highlighted language

<pre class="language-c">
<code class="language-c"
>```c
int main(void){

}
```</code>
</pre>

<div class="sl"></div>

## Links and images

```markdown
Here is a link [text that will be shown](https://example.com)
and here is an
image ![text if image not found](https://lgs-games.com/assets/icon64.png)

You can add a text on hover with
[text that will be shown](https://example.com "some text here")
or you could create a link
easily with <https://example.com>
```

<div class="sr"></div>

## Table

```markdown
| Colonne | Colonne |
| ------ | ------ |
| tab[0][0] | tab[0][1] |
| tab[1][0] | tab[1][1] |
| tab[2][0] | tab[2][1] |
| tab[3][0] | tab[3][1] |
| tab[4][0] | tab[4][1] |
| tab[5][0] | tab[5][1] |
```

<div class="sl"></div>

## Others

You can have quotes

```markdown
> some quote
```

And horizontal separators

```markdown
***

---

_________________
```

You may be able to use a checkbox

```markdown
* [ ] not checked
* [x] checked
```

And you can do comments with one of these
syntax

```markdown
[comment]: <> (some comment)

[//]: <> (This is also a comment.)

[//]: # (This may be the most platform-independent comment)
```

<div class="sr"></div>

## Sources

* Quentin RAMSAMY–AGEORGES ([ENSIIE](https://www.ensiie.fr/) student)

References

* <https://www.markdownguide.org/basic-syntax/>
* <https://www.markdowntutorial.com/>
* <https://www.markdownguide.org/getting-started/>
* [comments in MD](https://stackoverflow.com/questions/4823468/comments-in-markdown)