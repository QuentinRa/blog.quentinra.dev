# Testing Methodology

<div class="row row-cols-md-2"><div>

Testing is usually applied on two scopes: 

* 🛸 **code coverage**: we write tests covering every path <small>(if/exceptions/...)</small> that the code could take.

* 🔎 **unit testing**: we test a part of the code, usually a function

➡️ There are many tools to test the coverage on your code, which are slowy adding to the [Continuous integration](/tools-and-frameworks/git/ci/index.md) page.
</div><div>

When writing tests it's important to test both correct cases ✅, and incorrect cases ❌. This is to ensure that when updating the code to add new features/fix bugs, correct cases are still correct.

* ⬜ White-box testing: you know about the code
* ⬛ Black-box testing: you only know about I/O <small>(params/result)</small>
* 🏴 Grey-box testing: a mix of both
</div></div>

<hr class="sep-both">

## Approach: contracts

<div class="row row-cols-md-2"><div>

Assuming that

* preconditions: requirements before the execution
* postconditions: expected result after execution
* invariants: properties that must remain unchanged

#### Design by Contract

Design by Contract (`Conception par contrat`) is an approach to software development. We will check the preconditions <small>(ex: before executing the rest of the function)</small>, and the postconditions after calling the function <small>(ex: before returning the result, or after calling the function)</small>. If a condition fails, then the function has a defect.

➡️ Ex: using `assert` to test parameters/the result
</div><div>

#### Contract programming

Contract programming (`Programmation par contrat`) is a programming paradigm. We declare a contract associated to a function, such as "when given two integers, it will return an integer". 

If we call the function with preconditions defined in the contract <small>(e.g. two integers)</small>, and the result is invalid, then the function has a defect. The function can be called with invalid <small>(as per the contract, such as a float and an integer)</small> preconditions, but there is no guaranty of the outcome.

➡️ Ex: using `@Contract` <small>(Java)</small>, `@contract` from `contracts` <small>(Python)</small>.
</div></div>

<hr class="sep-both">

## Approach: defensive programming

<div class="row row-cols-md-2"><div>

Defensive programming is implemented by adding checks to prevent errors or unexpected outcomes. 

➡️ Use `IllegalArgumentException` <small>(invalid parameters)</small> and `IllegalStateException` <small>(invalid result, invariant...)</small> in Java...
</div><div>

* check if objects/addresses are null/undefined/...
* check the range <small>(RGB: [0,255] that may be stored in an integer)</small>
* check the size, the type, ...
* check runtime conditions <small>(is login called before logout?)</small>

👉 Apply Zero trust principle: do not trust any input/output, check everything.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* A/B testing
* SOLID
</div><div>


</div></div>