# Latex

In this course, you will learn

* how to write some latex documentation
* how to write maths in latex

<hr class="sr">

## Introduction

You may code latex (`.tex`) documents on

* [Overleaf](https://www.overleaf.com/) (previously `writelatex.com`), simple and collaborative tool, need register
* [CoCalc](https://cocalc.com/), UI may be a bit hard to use but no account required

You can also use a latex compiler on your machine
but that's not covered for now.

There are a lot of latex templates so be sure to check
them before starting some document from
scratch <https://www.overleaf.com/latex/templates>
since there are presentation templates, cv templates,
report templates...

<hr class="sl">

## Writing documents

Generally, latex documents look like

```latex
\documentclass{article}
% some package
\usepackage[utf8]{inputenc}

\begin{document}
some content here
\end{document}
```

Each time you would want to use some tags, then
you will have to use a directive starting with
``\begin{directive}`` and ending with `\end{directive}`.

* [Document](directives/document.md)
* [Text](directives/text.md)
* [Lists](directives/lists.md)
* [Code](directives/code.md)

<hr class="sr">

## Writing maths in latex

**First and foremost**, you should check out this
website <http://atomurl.net/math/>. 

A math equation need to be put inside
``$latex$`` (or `\(latex\)`) (inline math so in a sentence)
or using ``\[latex\]`` and equations will be rendered
in a whole line. An alternative to ```\[latex\]``` is
``\begin{equation}latex\end{equation}``.

Spaces are useless in your latex code since 
the math parser will do what he wants, you should either
use ``\ `` so slash followed by a space 
or use ``\quad`` (or `\,`, `\:`, ...).
You can make a horizontal space with ``\hspace{1cm}``.

**Note**: if you don't remember the name of a symbol,
just draw it on
[detexify](https://detexify.kirelabs.org/classify.html) 
and ask him to look for it.

Related

* [alternatives to atomurl](https://stackoverflow.com/questions/11256433/how-to-show-math-equations-in-general-githubs-markdownnot-githubs-blog)
* [mathjax reference (maths in websites)](https://math.meta.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference)
* [new lines in mathjax](https://github.com/mathjax/MathJax/issues/2312)
* [Strikeout](https://docs.mathjax.org/en/latest/input/tex/extensions/cancel.html)

<hr class="sl">

## Sources

* <https://www.overleaf.com/>
* <https://www.overleaf.com/learn>
* <https://fr.overleaf.com/learn/latex/Code_Highlighting_with_minted>
* <https://fr.wikibooks.org/wiki/LaTeX/%C3%89crire_des_math%C3%A9matiques>
* <https://www.commentcamarche.net/contents/620-latex-table-de-caracteres>
* <https://www.xm1math.net/doculatex/espacements.html>
* <https://fr.wikipedia.org/wiki/Aide:Formules_TeX>
* <https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols>
* <https://en.wikipedia.org/wiki/Wikipedia:LaTeX_symbols>