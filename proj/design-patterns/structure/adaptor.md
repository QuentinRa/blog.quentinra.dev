# Adaptor or Wrapper

[Go back](..)

We are gonna create a class that the client wanted and
link our code with it the client's methods.

* ➡️ : our code and a bank API (client)
* ✅ : integrate our code with an API
* 🚫 : you may have to write a lot of code

<hr class="sl">

## Example

* A: the interface with the methods that the client want
* B: our concrete class
* Wrapper: a class extending B implementing A.

And the wrapper would have to implement A using 
the methods of B.