# Adaptor or Wrapper

[Go back](..)

We are gonna create a class that the client wanted then write
some code to make use of our code.

* ➡️ : our code and a bank API (client)
* ✅ : integrate our code with an API
* 🚫 : you may have to write a lot of code

## Example

* A : interface with the methods that the client want
* B : our concrete class
* Wrapper : extends B implements A

And wrapper would have to implements A using the methods of B.