# Recursivity

<div class="row row-cols-lg-2"><div>

Recursivity/Recursion is a concept that can be used in various programming paradigms. It mostly refers to a function **calling itself**.

To have a proper recursion that doesn't loop indefinitely, we need to have two branches:

* 🔥 a recursive branch
* 🧯 a non-recursive branch, that ends the recursion


```java
public static int recursive(int param) {
    if (param > 5) {
        // call the "recursive" function again
        return param + recursive(param - 1);
    } else {
        // no recursion
        return 1;
    }
}
```

<br>

#### Example

When calling `recursive(7)`, we will have:

```scss!
recursive(7)
    param > 5 is TRUE
    7 + recursive(6)
recursive(6)
    param > 5 is TRUE
    6 + recursive(5)
recursive(5)
    param > 5 is FALSE
    1
```

By going backward with the result of each recursive function call, we can calculate the result which is `14`.

```text!
recursive(5) = 1
recursive(6) = 6 + 1 = 7
recursive(7) = 7 + 7 = 14
```
</div><div>

#### Terminal vs Non-Terminal

A recursive function may exhaust every resource, as every recursive call adds its own data. We distinguish terminal and non-terminal recursive functions. The latter may never end.

* **Terminal** ✅: we evaluate "n" before "n+1", e.g., the result is updated **before** the next function call.

* **Non-terminal** 🔥: all others

The previous example is non-terminal as we are doing the operation (`+`) after every function call.

✍️ A terminal version of the same function would be:

```java
public static int recursive(int param) {
    return recursive(param, 1);
}

private static int recursive(int param, int acc) {
    if (param > 5) {
        return recursive(param - 1, param + acc);
    } else {
        return acc; // no "return 1" as
                    // "acc" default value is 1
    }
}
```

```scss!
recursive(7)
    param > 5 is TRUE
    recursive(6, 7+1)
recursive(6, 8)
    param > 5 is TRUE
    recursive(5, 8+6)
recursive(5)
    param > 5 is FALSE
    Return 14 (already calculated)
```
</div></div>