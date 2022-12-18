# window

[Go back](../../../../../archives/info/web/_old#javascript-for-websites)

I only used the localStorage, but feel free to add more content here.

<hr class="sl">

## Storage

You may use the ``localStorage`` to store data in JavaScript, which you can use on another page.

```js
// get the value for it's key, null if not found 
localStorage.getItem('key')

// save a value
localStorage.setItem('key', value)

// remove a key+value
localStorage.removeItem('key')

// clear localStorage :)
localStorage.clear()
```

Most of the time, you will have to use JSON to serialize data.

* `JSON.stringify(v)`: convert v to a string
* `JSON.parse(string)`: parse back a string to a value