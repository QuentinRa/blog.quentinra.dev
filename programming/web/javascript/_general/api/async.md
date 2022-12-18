# Async and await

[Go back](../index.md#rest-api)

In practice, we want to wait for a result. We can do that using `await`, but you can only add `await` inside an `async` function (🙃). Using these, we will get rid of callbacks, but if we got an exception, then we have to use `try-catch`.

```js
async function asyncFunction() {
    // let's say f is asynchronous
    let f = fetch("/");
    let res = await f; // await the result of f
    let text = await res.text();
    console.log(text);
    console.log(res.status);
    // ...
}
// call
asyncFunction() // I'm ignoring this promise (😶)
// but, I shouldn't, and use .then().catch()
// as this is asynchronous code
```

Note that you **don't need to use await** if you are using return, for instance

```js
return res.text();
// is the same as
return await res.text();
```