# Functional programming

You will write your code almost like you would
write some maths formulas. You will focus on "what to solve"
rather than "how to solve".

Some functional languages are
`Lisp`, `meta-languages` (SML, CAML, OCAML) or `Haskell`.

<div class="sr"></div>

The main concepts are

* Referential transparency
* First-class citizens
* Purity (pure functions)
* Implicit types
* Immutable

And with some explications

* **Referential transparency** means that since ``f(x)=y``,
  writing ``y`` or `f(x)` is the same. `f(x)-f(x)` is
  equals to 0.
* **First-class citizens** (citoyen de premier
  ordre in French): functions are called first-class
  citizens, they can be used as parameters of others functions
  (a function taking another function is called a
  Higher-Order function or Fonction d'ordre supérieur
  in French)
* Following the concept above, in functional languages, everything
  is a value, a function, an assignation too! We are writing expressions
  (evaluated as a value) and not a statement (assigning a variable, ...)
* **Implicit types** means you usually don't explicitly write
  the type of a variable
*  **Immutable** means that you can't change the value of
   a variable unless you create a new one.
* **Purity** means that each statement of your code is an expression,
  meaning that a function must return something. Your code mustn't
  have side-effects (such as writing in a file) like a statement
  in your code that you can't predict the outcome.

You may read some articles

* [Wikipedia](https://en.wikipedia.org/wiki/Functional_programming#Concepts)
* [GeeksForGeeks](https://www.geeksforgeeks.org/functional-programming-paradigm/)
* French: <https://leblogducodeur.fr/introduction-a-la-programmation-fonctionnelle/>
* French: <https://ocaml.org/learn/tutorials/functional_programming.fr.html#Qu-39-est-ce-que-la-programmation-fonctionnelle>