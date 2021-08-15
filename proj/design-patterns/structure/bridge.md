# Bridge

[Go back](..)

Try to use as much abstract class (interfaces
are abstract) as possible.

For instance, when creating a compiler to convert
Markdown document into HTML, you should create
an abstract version of the compiler. 
If you did, then you could use this abstract version
to easily add a Latex compiler.

* ✅ : flexibility
* 🚫 : more code to write, and you need to think about
this abstract class