# Latex

In this course you will learn

* how to write some latex documentation
* how to write maths in latex

## Introduction

You may code latex (`.tex`) documents on

* [Overleaf](https://www.overleaf.com/), simple and collaborative tool, need register
* [CoCalc](https://cocalc.com/), ui may be a bit hard to use but no account required

You can also use a latex compiler on your machine
but that's not covered for now.

## Writing documents

Generally, latex documents looks like

```latex
\documentclass{article}
\usepackage[utf8]{inputenc}

\begin{document}
some content here
\end{document}
```

Please take note that you can write some text
in a document without tags, that's a paragraph.

Using ``\\`` add the end of a line will move
the rest of the text right under our line.
Jumping a line do the same and ``\newline``
too.

You can create some space between paragraph
using ``\vspace{NUMBERmm}``.

Each time you would want to use some tags, then
you will have to use a directive starting with
``\begin{directive}`` and ending with `\end{directive}`.

Some directives

* ``center``: centered text
*
```latex
\begin{itemize}
  \item an item
  \item another one
\end{itemize}
```

Some inline directives

* ``\textbf{word}``: bold
* ``\underline{word}``: underlined
* ``\textit{word}``: italic
* ``\emph{word}``: emphasis, almost like italic