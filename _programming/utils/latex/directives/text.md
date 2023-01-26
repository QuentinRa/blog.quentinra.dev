# Text

[Go back](..#writing-documents)

You can write some text in a document without tags, that's a paragraph.

Using `\\` at the end of a line will move the rest of the text right under our line. To jumping a line, you may need to add `\\` two times. You can use `\newline` instead of  `\\`.

You can add some space between paragraphs using `\vspace{NUMBERmm}`.

Furthermore, you can center text using `center`, the text being `justified` by default.

Some text inline directives

* `\textbf{word}`: bold
* `\underline{word}`: underlined
* `\textit{word}`: italic
* `\emph{word}`: emphasis, almost like italic

that can be used like this

```latex
\begin{center}
This is centered text got a \textbf{word} in bold.
\end{center}
```