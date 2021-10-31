# Operators

[Go back](../index.md#structures-and-classes)

Every **operator** (+, +=, -, /=, <<, ...) is a **function**, and we **can overload them**. By default, you can't use them on your classes <small>(aside from the move operator "<<", and the copy assignment operator "=")</small>, so as there is **no default behavior**, you will have to **override those that you want to use**.

**You can't overload**

* `::` (scope resolution)
* `.` (dot operator, for structures/classes)
* `.*` (pointer to a member)
* `:` (ternary operator)
* `sizeof`, `typeid`, `static/dynamic/const/reinterpret cast`

> There is nothing official about external/internal operator, it's just of way of doing things. Every operator could be internal (resp. external) 😎.

<hr class="sl">

## Internal operators

We are considering internal operators, as operators that are applied on our instance. They are declared inside the class.

* `+=`, `-=`, `*=`, `/=`, `=`, `-` (ex: -1)
* `()` (const and not const), `[]` (const and not const)
* `<<`, `>>`
* ...

...

<hr class="sr">

## External operators

**We are considering internal operators, as operators that are applied on our instance and something else**. **They are declared outside the class**.

* `+` (ex: a + b), `-`, `*`, `=` 
* ...

...