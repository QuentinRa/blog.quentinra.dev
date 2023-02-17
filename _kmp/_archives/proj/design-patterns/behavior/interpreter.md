# Interpreter

[Go back](..)

Literally a way to write a simple parser.

* ➡️ : ``String.valueof(...)`` in java
* ✅ : good if simple language
* 🚫 : hell if language is complex

<hr class="sl">

## Another point of view

The main idea is that each element of the syntax is a class or a value, but an expression will most likely be evaluated as

```
(evaluate left) operator (evaluate right)
```

for a binary operator, and you should keep that in mind while coding. For instance

* $1 + 2 + 3$
* is the same as
* $(1+2) + (3)$
* we are evaluating $1+2 = 3$
* we are evaluating $3 = 3$
* then we are evaluating $3+3=6$
