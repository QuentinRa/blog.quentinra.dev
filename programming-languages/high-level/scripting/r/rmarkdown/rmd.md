# RMarkdown

[Go back](index.md)

Instead of sharing a `.R` file, you may share a mix of markdown and `R` called RMarkdown. It's quite simple, you got every feature of Markdown, but you can write LaTeX, and code in a bloc like this

<pre><code class="language-r"
>```r
# some code in R
"Hello, World!"
```</code></pre>

You will be able to run it, like you would in a `.R` file. The best way to learn RMarkdown (aside from looking at other Rmd files) is to [read this sheet](https://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf).

<hr class="sl">

## Latex in Rmd

You can also use latex

```md
This is a sentence with some math in LaTeX: $a+b = 2$.

The equation in this sentence will be centered $$a+b = 2$$ and take a whole line.
```

**Result**

This is a sentence with some math in LaTeX: $a+b = 2$.

This equation in this sentence will be centered @a+b = 2@ and take a whole line.

<hr class="sr">

## Rmd file

A `.Rmd` file may look like this, while I included some syntax you may use.

<pre><code class="language-md"
>---
title: "Titre du document"
output: html_document
---

# Header1
## Header2
### Header3
....

[link text](https://)

![alternative text](/path/to/image)

This is a sentence with some math in LaTeX: $a+b = 2$.

The equation in this sentence will be centered $$a+b = 2$$ and take a whole line.

You can also use *italic* and **bold**.

> a quote

```{r}
Code in R
```</code></pre>

<hr class="sl">

## Code bloc

Usually, you can create a code block with `CTRL+ALT+I`. As you have seen, sometimes we use `{r}`. This is because you can pass some options

* `{r  include = FALSE}`: code compiled but not shown
* `{r  echo = FALSE}`: code compiled but the code is not shown
* `{r  message = FALSE}`: code compiled but the result is not shown
* `{r  warning = FALSE}`: code compiled, do not show warnings
* `{r  error = FALSE}`: code compiled, do not show errors

<hr class="sl">

## Compiling

Using this, the compilation of your Rmd will give an HTML website (then you can use CTRL-P > save as PDF to create a PDF).

```md
---
title: "Titre du document"
output: html_document
---
```

You may want to use latex instead of HTML.

<pre><code class="language-md"
>---
title: 'blah blah'
author: "blah blah"
date: " optional"
output:
  pdf_document:
    fig_caption: yes
  html_document: default
fontsize: 11pt
---

```{r setup, include = FALSE}
knitr::opts_chunk$set(error = TRUE)
knitr::opts_chunk$set(cache = TRUE)
knitr::opts_chunk$set(fig.align = "center")
knitr::opts_chunk$set(echo = TRUE, results="show")
```</code></pre>