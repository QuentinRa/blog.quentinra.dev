# LaTeX

**[Updated notes](index.md)**

Generally, latex documents look like

```latex
\documentclass{article}
% your packages
\usepackage[utf8]{inputenc}

\begin{document}
your content here
\end{document}
```

Each time, you would want to use some tags for your content, you will have to use a directive starting with `\begin{directive}` and ending with `\end{directive}`.

* [Document](directives/document.md)
* [Text](directives/text.md)
* [Lists](directives/lists.md)
* [Code](directives/code.md)

<hr class="sr">

## Writing math in latex

**First and foremost**, you should check out this awesome website <http://atomurl.net/math/>. 

A math equation needs to be put inside

* `$latex$` (or `\(latex\)`): inline math, meaning inside a sentence
* `\[latex\]`: the formula will be rendered on a whole line.

An alternative to `\[latex\]` is `\begin{equation}latex\end{equation}`.

Spaces are useless in your latex code since the math parser will do whatever he wants, you should either use `\ ` (backslash followed by a space) or use `\quad` (or `\,`, `\:`, ...). You can make a horizontal space with `\hspace{1cm}`.

You may use `\mathcal{H}` to write name of functions, etc.

**Note**: if you don't remember the name of a symbol, just draw it on [detexify](https://detexify.kirelabs.org/classify.html) and ask him to look for it.

Related

* [Alternatives to atomurl](https://stackoverflow.com/questions/11256433/how-to-show-math-equations-in-general-githubs-markdownnot-githubs-blog)
* [Mathjax reference (math renderer in JS)](https://math.meta.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference)
* [New lines in mathjax](https://github.com/mathjax/MathJax/issues/2312)
* [Strikeout in latex](https://docs.mathjax.org/en/latest/input/tex/extensions/cancel.html)
* [katex](https://katex.org/)
* [rfloor and rceil](https://tex.stackexchange.com/questions/433101/rounding-to-nearest-integer-symbol-in-latex) (`partie entière sup/inf`)

<hr class="sl">

## Cheatsheet

Because I'm enjoying adding links to cheat sheets, here are some sheets that look good

* [symbols.pdf](https://www.caam.rice.edu/~heinken/latex/symbols.pdf)
* [latexcheatsheet.pdf](https://users.dickinson.edu/~richesod/latex/latexcheatsheet.pdf),
[latexcheatsheet.pdf](https://users.dickinson.edu/~richesod/latex/LatexFrench.pdf) (french),
[video](https://divisbyzero.com/teaching/a-quick-guide-to-latex/).
* [Wikibooks - latex](https://en.wikibooks.org/wiki/LaTeX/Mathematics)
* [math guide for latex](http://tug.ctan.org/info/short-math-guide/short-math-guide.pdf)

<hr class="sr">

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