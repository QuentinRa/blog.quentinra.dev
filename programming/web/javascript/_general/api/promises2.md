# Promises

[Go back](../../../../../archives/info/very_old/node)

This should be explained in JavaScript course
but promises are the way we are using the handle
asynchronous code.

Let's say you are making a request to a database,
then the code will wait for the answer right?

You could do that using ``async`` / `await`

```js
async function asyncFunction() {
    // let's says this is the call we are waiting for
    let f = () => {};
    return await f();
}
```

And now, if someone is calling your function, he will
have to handles a promise. ``await`` keyword can only
be used in a ``async`` function so the only thing
he can do is proving one or two callbacks

* one if the function did the job right (then)
* another one if we got an error (catch)

and a callback is a function that will be called when
the ``async`` function is finally done.

````js
asyncFunction().then((result) => {
    // code after the job is done
}).catch((reason) => {
    // code if we got an error
})
````