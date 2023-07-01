# LaTeX

<div class="row row-cols-md-2"><div>

LaTeX is the language used in `.tex` files. It's mostly used to write formal documents such as

* 📝 Text documents <small>(books, reports, resumes...)</small>
* 🏫 Articles/thesis <small>(academic research...)</small>
* 🎉 Presentations <small>(slides for programmers...)</small>
* ...

**Where to learn?**

* [Overleaf](https://www.overleaf.com/learn) <small>(⛪)</small>

</div><div>

Some qualities of LaTeX are

* 🌍 Cross-platform
* 🪧 Consistency
* 🧮 Support for math formulas
* 🧑‍💻 Support for code samples

Some ways to write LaTeX:

* [Overleaf](https://www.overleaf.com/): collaborative online tool <small>(account required)</small>
* [CoCalc](https://cocalc.com/) (👻)

➡️ LaTeX templates: [Overleaf](https://www.overleaf.com/latex/templates)
</div></div>

<hr class="sep-both">

## Basics

<div class="row row-cols-md-2"><div>

A basic document looks like this. You can import packages, and you start writing inside the document block.

```tex
\documentclass{article} % book...
% import packages (preamble)
\usepackage[utf8]{inputenc}

\begin{document}
% body of the document
\end{document}
```

#### Document

<div class="row row-cols-md-2"><div class="align-self-center">

```tex
\title{A title}
\author{An author}
\date{A date}
```
</div><div>

Usually before starting the document, we define some metadata. Then, inside the body, we can generate a title page with `\maketitle`.
</div></div>
</div><div>

#### Text

You can write text and use these to apply some style:

* `\textbf{word}`: bold
* `\underline{word}`: underlined
* `\textit{word}`: italic
* `\emph{word}`: emphasis, almost like italic
* `\vspace{NUMBERmm}`: space between paragraphs

➡️ To force a newline, use `\\` <small>(once or twice)</small> or `\newline`.

➡️ To center something, use `\begin{center}something\end{center}`.

#### Lists

<div class="row row-cols-md-2 mt-3"><div>

```latex
\begin{itemize}
  \item an item
  \item an item
\end{itemize}
```
</div><div class="align-self-center">

Use `enumerate` for ordered lists, and `itemize` for unordered lists.
</div></div>
</div></div>

<hr class="sep-both">

## Code in LaTeX

<div class="row row-cols-md-2"><div>

You can use the minted to write code in LaTeX.

```tex
\usepackage{minted}
```

You need to define a language, for instance, `ocaml`.

```tex
\newminted{ocaml}{breaklines}
```
</div><div>

➡️ You can write a block of code using this syntax:

```tex
\begin{minted}{ocaml}...\end{minted}
```

➡️ You can import a file using this syntax:

```tex
`\inputminted{ocaml}{file.ml}
```

👉 There is also a package called `listings`.
</div></div>

<hr class="sep-both">

## Math in LaTeX

<div class="row row-cols-md-2"><div>

Math symbols or formulas can be either **inline** meaning inside a text, or **block-level** meaning they will take up a whole line.

* 💬 **inline**: `$latex$` or `\(latex\)`
* 🧮 **block**: `\[latex\]` or `\begin{equation}latex\end{equation}`

👉 Use [AtomURL](https://atomurl.net/math/) to get the LaTeX code for most mathematical symbols and formulas.

👉 With [detexify](https://detexify.kirelabs.org/classify.html), draw a symbol and get the LaTeX code.
</div><div>

➡️ Spaces are merged into one. Use `\ ` to prevent it or use `\quad`.

➡️ You can create a horizontal space with `\hspace{1cm}`.

➡️ You can use `\mathcal{H}` for function names/...

➡️ Use `\lfloor`/`\rfloor` and `\lceil`/`\rceil` for the rounding symbols <small>(`partie entière`)</small>. Use `\lvert`/`\rvert` for absolute values.

🌍 Use mathjax or katex to render LaTeX formulas in a browser.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

```latex
\verb! http://localhost:3000/!
\textbackslash{xxx}
\noindent
% https://tex.stackexchange.com/questions/450156/latex-indent-with-alphabet-list
\begin{enumerate}
    \item[$a)$] XXX
\end{enumerate}
\pagestyle{empty}\pagestyle{plain}\setcounter{page}{1}
```

* [symbols.pdf](https://www.caam.rice.edu/~heinken/latex/symbols.pdf)
* [latexcheatsheet.pdf](https://users.dickinson.edu/~richesod/latex/latexcheatsheet.pdf),
  [latexcheatsheet.pdf](https://users.dickinson.edu/~richesod/latex/LatexFrench.pdf) (french),
  [video](https://divisbyzero.com/teaching/a-quick-guide-to-latex/).
</div><div>

* [Wikibooks - latex](https://en.wikibooks.org/wiki/LaTeX/Mathematics)
* [math guide for latex](http://tug.ctan.org/info/short-math-guide/short-math-guide.pdf)
* [minted](https://www.overleaf.com/learn/latex/Code_Highlighting_with_minted)
* [maths](https://fr.wikibooks.org/wiki/LaTeX/%C3%89crire_des_math%C3%A9matiques) or [xm1math](https://www.xm1math.net/doculatex/) or [oeis](https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols) or [wiki help](https://fr.wikipedia.org/wiki/Aide:Formules_TeX)/[wiki help](https://en.wikipedia.org/wiki/Help:Displaying_a_formula#Functions,_symbols,_special_characters) or [quickref](https://math.meta.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference)

```
\phantomsection
\section*{Introduction}
\addcontentsline{toc}{section}{Introduction}
```
</div></div>