# Promises

[Go back](../index.md#rest-api)

Every **asynchronous code** is returning **Promise**, and we may use them to handle **asynchronous code** like we are doing below. A promise is made of two **callbacks**. A callback is a function that will be called when the asynchronous code is either was successful (**then**) or failed (**catch**).

```js
function doAsynchronousJob() {
    return new Promise((resolve, reject) => {
        // ...
        // call resolve if ok
        // call reject if ko
        // you can give anything here
        resolve("some result");
    })
}

doAsynchronousJob()
    // handle resolve
    .then(result => {
        console.log(result); // "some result"
    })
    // handle reject
    // same as (param) => {console.error(param)}
    .catch(console.error)
```

<hr class="sl">

## With XMLHTTPRequest?

We simply need to call resolve/reject instead of handling the result/failure inside "myFunction". This is allowing us to factorize/clean the code (at least it will be a bit cleaner 🙄).

```js
function myFunction() {
    return new Promise((resolve, reject) => {
        const ajax = new XMLHttpRequest();
        ajax.onreadystatechange = () => {
            if(ajax.readyState === XMLHttpRequest.DONE) {
                if (ajax.status == 200) resolve(ajax.responseText);
                else reject(ajax.responseText);
            }
        }
        ajax.open("GET", "https://some.url/", true);
        ajax.send();
    })
}

myFunction()
    .then(/* ... */)
    .catch(/* ... */);
```