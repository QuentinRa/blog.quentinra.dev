# Interpreter

[Go back](..)

Literally a way to write a simple parser.

Another point of view would be this one.
The idea is each element of the syntax is a class or
a value but an expression will most likely be evaluated
as
``(evaluate left-value) operator (evaluate right-value)``
for a binary operator and the idea here is that you
should keep that in mind while coding.

* ➡️ : ``String.valueof(...)`` in java
* ✅ : good if simple language
* 🚫 : hell if language is complex
