# Promises

[Go back](../index.md#rest-api) | [See also](promises2.md)

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