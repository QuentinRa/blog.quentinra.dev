# Bridge

[Go back](..)

Try to use as much abstract class (interfaces are abstract) as possible.

For instance, when creating a compiler to convert Markdown documents to HTML documents, you should create an abstract version of the compiler. For instance, you could use this abstract version to easily add a Latex to HTML converter.

* ✅ : flexibility
* 🚫 : more code to write, and you need to think about this abstract class