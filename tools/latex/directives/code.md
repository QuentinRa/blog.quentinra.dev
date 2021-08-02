# Code

[Go back](..#writing-documents)

Here is how you would write code with
OCaml highlighting

```latex
\documentclass{article}
\usepackage[utf8]{inputenc}
\usepackage{minted}

\newminted{ocaml}{breaklines}

\begin{document}
  \begin{minted}{ocaml}
  ...
  \end{minted}
\end{document}
```

or you could use this code to add a file
``\inputminted{ocaml}{file.ml}``.

You can highlight one line with
``\mint{ocaml}|let x = 5;;|``