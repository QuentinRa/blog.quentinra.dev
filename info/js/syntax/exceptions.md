# Exceptions

[Go back](../index.md#basic-syntax)

If your code may produce an error, you will most likely have to handle exceptions. An exception is raised ("thrown") went something unexpected is happening, and that's most likely an error.

* Error
* ReferenceError
* EvalError
* RangeError
* SyntaxError
* ....

You can raise one using **throw** and catch one using **catch**, meaning that you will handle the unexpected behavior (ex: conversion failed, ...)

```js
try {
    // this code here might raise an exception
    throw new Error();
} catch {
    // this code handles the exception
}

try {} catch (e) {
    // the variable "e" is the exception
    // this is stupid, we are throwing again the exception
    // we captured
    throw e;
}
```