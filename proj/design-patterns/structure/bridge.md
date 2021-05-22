# Bridge

[Go back](..)

Try to use as much abstract class (interfaces
are abstract) as possible.

For instance, when creating a compiler for your
``Markdown`` document into HTML, you should create
an abstract version of it. If you did, then you could
use this abstract version to easily add a latex compiler...

* ✅ : flexibility
* 🚫 : more code to write, and you need to think about
this abstract class