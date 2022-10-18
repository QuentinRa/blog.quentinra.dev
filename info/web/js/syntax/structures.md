# Structures

[Go back](../index.md#basic-syntax)

As you could find in many other languages, we got "if", "for", "switch", "do while", but we also have a "new" one, the for each (for i in).

```js
// if condition is true, else/else if ...
if (cond) { /* ... */ }
if (cond) { /* ... */ } else { /* ... */ }
if (cond) { /* ... */ } else if (/* ... */) { /* ... */ }

// alternative to a lot of if/else
switch ( /* ... */ ){
    case x: /* ... */; break;
    case y: /* ... */; break;
    default: ...;break;
}

// while cond is true
while( cond ){
    /* ... */
}

// do while condition is true
do {
    /* ... */
} while( cond );

// i = 0,
// if i < ...,
// code
// i++
// loop again
for(let i = 0; i < ...; i++) {
    /* ... */
}

// you can use var too
// and any condition is good
for(var i = 0; /* ... */; i++) { /* ... */ }
// implicit var, and you can add more operations
// before the next loop
for(i = 0, j=0; i < ...; i++, j++) { /* ... */ }
```

Also, you should remember that you can use

* `break`: exit a loop
* `continue`: skip the code and loop again

<hr class="sl">

## for i in

This is a "new" structure to iterate an array

```js
// example
let tab = [1,2,3]

// i = the indexes of the array
for(i in tab) {
    console.log(i)
}

// e = the values of the array
for(e of tab) {
    console.log(e)
}
```

