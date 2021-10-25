# Recursive functions

[Go back](../index.md#advanced)

It's simply a function calling herself again. You must have a if somewhere with a branch without recursion.

```java
public static int recursive(int param){
    if(param > 5){
        return param + recursive(param-1);
    } else {
        // no recursion
        return 1;
    }
}
```

This function called like `recursive(10)` will do

```java
int result = recursive(7);
result = 7 + recursive(6);
result = 7 + 6 + recursive(5);
result = 7 + 6 + 1;
result = 7 + 7;
result = 14;
```

Note that this function is not terminal. A function is terminal when we are evaluating n before n+1. Here we are evaluating the next value before the current one. Try to write this function as a terminal function.

First, we mustn't change `public static int recursive(int param)` definition but we will create a private function actually doing the real job. We will store in a variable ``acc`` the result.

Since our function return ``1`` when the recursion stops, then the default value for the accumulator is `1`.

```java
public static int recursive(int param){
    return recursive(param, 1);
}

private static int recursive(int param, int acc){
    if(param > 5){
        // evaluate param+acc here, not when
        // we evaluated everything else
        return recursive(param-1, param+acc);
    } else {
        return acc;
    }
}
```