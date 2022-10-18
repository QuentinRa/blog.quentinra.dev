# XMLHttpRequest

[Go back](../index.md#rest-api)

You will use **XMLHttpRequest** to make a request. As you should know by now, you can make requests such as "GET", "POST", "PUT", "DELETE", etc. The code is pretty straightforward: you are setting the URL, the method etc. and sending the request. Then, in the function given to "onreadystatechange", you are writing the code that will be called when we got the result.

<hr class="sl">

## GET

```js
const ajax = new XMLHttpRequest();
ajax.onreadystatechange = () => {
    if(ajax.readyState === XMLHttpRequest.DONE) {
        if (ajax.status == 200) { 
            /* ok */
            // see response
            console.log(ajax.responseText)
        }
        else { 
            /* error */
            // see response
            console.log(ajax.responseText)
        }
    }
}
ajax.open("GET", "https://some.url/", true);
ajax.send();
```

<hr class="sr">

## POST

```js
const ajax = new XMLHttpRequest();
ajax.onreadystatechange = /* .... */;
ajax.open("POST", "https://some.url/", true);
// if data = JSON.stringify(data)
// ajax.setRequestHeader("Content-type", "application/json");
// anyways, data must be a string
ajax.send(data);
```

**Note**: you may also use www-form-urlencoded, instead of JSON.

```js
xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xhttp.send("name=value&name2=value2");
```

<hr class="sl">

## PUT

```js
const ajax = new XMLHttpRequest();
ajax.onreadystatechange = /* .... */;
ajax.open("PUT", "https://some.url/", true);
// same note as above
ajax.send(data);
```

<hr class="sr">

## DELETE

```js
const ajax = new XMLHttpRequest();
ajax.onreadystatechange = /* .... */;
ajax.open("DELETE", "https://some.url/", true);
ajax.send();
```