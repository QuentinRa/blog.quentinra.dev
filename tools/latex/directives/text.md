# Text

[Go back](..)

You can write some text
in a document without tags, that's a paragraph.

Using ``\\`` add the end of a line will move
the rest of the text right under our line.
Jumping a line do the same and ``\newline``
too.

You can create some space between paragraph
using ``\vspace{NUMBERmm}``.

You can center text using ``center``,
the text being ``justified`` by default.

Some text inline directives

* ``\textbf{word}``: bold
* ``\underline{word}``: underlined
* ``\textit{word}``: italic
* ``\emph{word}``: emphasis, almost like italic

that can be used like this

```latex
\begin{center}
This is some text with this \textbf{word} in bold.
\end{center}
```