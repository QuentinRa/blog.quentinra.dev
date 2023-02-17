# Code

[Go back](..#writing-documents)

Here is an example of highlighting code in OCaml, using the package `minted`.

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

Or you could use this code to add a file `\inputminted{ocaml}{file.ml}`.

You can highlight one line with `\mint{ocaml}|let x = 5;;|`.