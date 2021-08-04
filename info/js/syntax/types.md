# Types

[Go back](../index.md#basic-syntax)

As you could see, you don't specify the variable
type when creating a variable. The kinds of values
in Javascript are

* ``true/false``: a boolean (type boolean)
* ``5``: an integer (type number)
* ``5.0`` : a float (type number)
* ``5.0``: a string (type string, class String)
* `"5.0"`: a string (type string, class String)
* <code>\`5.0\`</code>: a string (type string, class String)
* `[]`: an (empty) array (type object, class Array)
* `{}`: an (empty) object (type object)
* `undefined`: something not defined, default value
* ``null``: something null (defined but empty)
* ``NaN``: NotANumber (type number)

You can use 

* ``typeof variable``: return the type of a variable,
mainly used in well-written functions
* ``var instanceof className`` returning a boolean if
this variable is an instance of a class 
like `[] instanceof Array`.