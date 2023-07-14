# Testing Methodology

<div class="row row-cols-md-2"><div>

There are two common scopes for testing: 

* 🛸 **code coverage**: we write tests covering every path <small>(if/exceptions/...)</small> that the code could take.

* 🔎 **unit testing**: we test a part of the code, usually a function

➡️ There are many tools to test the coverage of your code, which are slowly being added to the [Continuous Integration](/tools-and-frameworks/git/ci/index.md) page.
</div><div>

When writing tests it's important to test both correct cases ✅, and incorrect cases ❌. This is to ensure that when updating the code to add new features/fix bugs, the correct cases are still correct.

* ⬜ White-box testing: you know about the code
* ⬛ Black-box testing: you only know about I/O <small>(params/result)</small>
* 🌫️ Grey-box testing: a mix of both
</div></div>

<hr class="sep-both">

## Find tests

<div class="row row-cols-md-2"><div>

#### RightBICEP

This approach aims to identify effective test cases:

* **Right**: test that the output is correct
* **B**oundary: test boundaries/extremum <small>(ex: MAX_INT...)</small>
* **I**nverse: test the inverse input/output <small>(ex: 3+2 is the same as 2+3)</small>
* **C**ross-check: cross-check the output with another function
* **E**rrors: test error cases
* **P**erformance: test performance and resource usage
</div><div>

#### CORRECT

This approach also aims to identify effective test cases:

* **C**onformance: test that the I/O conforms to what was expected
* **O**rdering: test that I/O are in the correct order
* **R**ange: test boundaries/extremum
* **R**eference: test against a known result, test that the correct reference/object in memory is used
* **E**xistence: test that the required data/result are defined <small>(not null/...)</small>
* **C**ardinality: test with 0, 1, and more arguments <small>(if applicable)</small>. Test with items of different cardinalities <small>(arrays/lists/...)</small>. 
* **T**ime: test timing and performance. Test sequencing <small>(login→logout)</small>.
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

Contract programming (`Programmation par contrat`) is a programming paradigm. We declare a contract associated with a function, such as "when given two integers, it will return an integer". 

If we call the function with preconditions defined in the contract <small>(e.g. two integers)</small>, and the result is invalid, then the function has a defect. The function can be called with invalid preconditions <small>(as per the contract, such as a float and an integer)</small>, but there is no guarantee of the outcome.

➡️ Ex: using `@Contract` <small>(Java)</small>, `@contract` from `contracts` <small>(Python)</small>.
</div></div>

<hr class="sep-both">

## Approach: defensive programming

<div class="row row-cols-md-2"><div>

Defensive programming is implemented by adding checks to prevent errors or unexpected outcomes. 

👉 Defensive programming is often used along contracts, to implement error handling and input validation.

➡️ Use `IllegalArgumentException` <small>(invalid parameters)</small> and `IllegalStateException` <small>(invalid result, invariant...)</small> in Java...
</div><div>

* check if objects/addresses are null/undefined/...
* check the range <small>(RGB: [0,255] that may be stored in an integer)</small>
* check the size, the type, ...
* check runtime conditions <small>(is login called before logout?)</small>

👉 Apply Zero trust principle: do not trust any input/output, check everything.
</div></div>

<hr class="sep-both">

## Behavior-driven development (BDD)

<div class="row row-cols-md-2"><div>

Behavior-driven development (BDD) is a software development methodology that breaks down every part of the code into 3 sentences, explaining concretely how the code should behave.

👉 These questions are answered for every use case of a function before adding the function to the code base.
</div><div class="align-self-center">

* <kbd>Given</kbd> some parameters/actions/input

* <kbd>When</kbd> some action triggers the process

* <kbd>Then</kbd> some action/result/output

</div></div>

<hr class="sep-both">

## Test-driven development (TDD)

<div class="row row-cols-md-2"><div>

Test-driven development (TDD) is a development practice in which we write the tests before the code. For instance, in Java/OO,

1. we would write a class with an empty method raising an exception
2. we will write tests for this method
3. then we will code the method

👉 You will code the method to pass one test, then another one... while ensuring that previous tests are still OK. 
</div><div>

➡️ It's hard to apply this method when starting from scratch. You should first design your project <small>(ex: UML)</small>, then generate code from the UML, and start from here <small>(better: apply Model-driven development too)</small>.

You should always ask yourself

* What is my function supposed to do?
* Will adding my function, do what we want?
* What problems might be caused by adding my function?
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* A/B testing
* SOLID
* JBehave BDD framework (Java)
</div><div>


</div></div>