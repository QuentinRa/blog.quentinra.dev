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

There are a lof of latex templates so be sure to check
them before starting some document from
scratch <https://www.overleaf.com/latex/templates>
since there are presentation templates, cv templates,
report templates...

## Writing documents

Generally, latex documents looks like

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

## Writing maths in latex

First and foremost, you should check out this
website <http://atomurl.net/math/>. 

A math equation need to be put inside
``$latex$`` (or `\(latex\)`) (inline math so in a sentence)
or using ``\[latex\]`` and equations will be rendered
in a whole line.

An alternative to ```\[latex\]``` is
``\begin{equation}latex\end{equation}``.

Space are useless in your latex code since the math
parser will do what he wants, you should either
use ``\ `` so slash followed by a space 
or use ``\quad`` (or `\,`, `\:`, ...).

## Sources

* Quentin RAMSAMY--AGEORGES

References
* <https://www.overleaf.com/>
* <https://www.overleaf.com/learn>