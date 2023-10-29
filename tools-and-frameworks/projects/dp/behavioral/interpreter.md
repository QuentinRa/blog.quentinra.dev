# Interpreter Design Pattern

[Go back](../index.md#behavioral-)

<div class="row row-cols-lg-2"><div>

**Aliases** 📌: None

**Description** 📚: `1 + 2 + 3` is the same as `3 + 3` after evaluating `1 + 2`. It means that the grammar is `Operation := Operand Operator Operand` and `Operand` can be another `Operation`.

We will follow this logic to create the interpreter.
</div><div>

**Advantages** ✅

* Useful for a simple language

**Disadvantages** 🚫

* Complicated if a language is complex

**Notes** 📝

* None
</div></div>