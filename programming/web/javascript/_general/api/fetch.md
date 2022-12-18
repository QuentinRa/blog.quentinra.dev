# Fetch

[Go back](../index.md#rest-api)

`fetch` is the same as wrapping an XMLHTTPRequest inside a Promise. We are making a request with almost no syntax, and fetch is returning a promise. This is a new function available in 2015 (fully available in 2017).

```js
// GET URL
fetch(URL)
  .then(response => console.log(response))
  .catch(console.error);
```

Of course, you can do everything you could with XMLHTTPRequest

```js
fetch(URL, {
    method: "GET", // POST, PUT, DELETE
    body: /* data, JSON.stringify(data), "a=b&c=d", etc. */,
        headers: {
            // "Content-Type": "application/x-www-form-urlencoded"
            // "Content-Type": "application/json"
        }
    }
);
```

And, you can easily convert response (in the `then`)

```js
console.log(response.text());
console.log(response.json());

// but you should write this, as they are promises
response.text().then(console.log);
response.json().then(console.log);
```

