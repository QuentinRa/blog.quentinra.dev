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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* A/B testing
* SOLID
</div><div>


</div></div>