# XMLHttpRequest

```js
const MAIN_END_POINT = "https://musicbrainz.org/ws/2/";

/**
 * Take a URL, the route, relative to the MAIN_END_POINT.
 * Returns a promise.
 */
function call_api(route) {
    return new Promise((resolve, reject) => {
        const ajax = new XMLHttpRequest();
        
        // call the promise
        ajax.onreadystatechange = () => {
            if(ajax.readyState === XMLHttpRequest.DONE) {
                ajax.status == 200 ?
                    // either resolve or reject
                    resolve(JSON.parse(ajax.responseText)) : reject(ajax.responseText)
            }
        };

        ajax.open("GET", MAIN_END_POINT+route, true);
        ajax.send();
    })
}

// todo: handle result/failure
call_api("release?artist=65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab&status=bootleg&type=live&limit=1&fmt=json")
    // handle the result
    .then(function (resolve, reject) {
        console.log(resolve)
    })
    // handle the error
    .catch(console.error)
```