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

## Sources

* Quentin RAMSAMY--AGEORGES (ENSIIE Student)

References
* <https://www.overleaf.com/>
* <https://www.overleaf.com/learn>