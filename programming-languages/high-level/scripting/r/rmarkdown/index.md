# RMarkdown

<div class="row row-cols-lg-2"><div>

RMarkdown files are a mix of [R](../_knowledge/index.md) scripts and [Markdown](/programming-languages/others/documents/markdown/index.md) documentation. They allow us to write documents and include R code inside.

<pre><code class="language-md"
>Some documentation in Markdown...

```{r}
# some code in R
"Hello, World!"
```

You can also use LaTeX for formulas: $a+b = 2$.

The equation in this sentence will be centered $$a+b = 2$$
and take a whole line.</code></pre>
</div><div>

**Where to learn?** 🔥

* [RMarkdown Documentation](https://rmarkdown.rstudio.com/)
* [RMarkdown Reference](https://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf)

Inside editors, we are able to run the embedded snippets! 🚀
</div></div>

<hr class="sep-both">

## Basic Overview

<div class="row row-cols-lg-2"><div>

#### Metadata

We first define the header. It is used when generating a PDF or an HTML version of the `.Rmd`.

```yaml!
---
title: 'blah blah'
output: html_document
---
```

To generate a PDF, you can use:

<pre><code class="language-yaml"
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
```

[your document here]</code></pre>

We will then write LaTeX and Markdown content as usual.
</div><div>

#### R Code Blocs

Inside an editor, you can create a code block with `CTRL+ALT+I`. We can use `{r}` to configure the code block.

* `{r  include = FALSE}`: code compiled but not shown
* `{r  echo = FALSE}`: code compiled but the code is not shown
* `{r  message = FALSE}`: code compiled but the result is not shown
* `{r  warning = FALSE}`: code compiled, do not show warnings
* `{r  error = FALSE}`: code compiled, do not show errors
</div></div>