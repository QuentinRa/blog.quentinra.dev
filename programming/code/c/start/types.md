# Types

[Go back](../../../__old/c)

You got 5 primitives types in C. All variables must have a type, and you
can create new ones.

```c
int number = 5;
// variable not initialized
// you don't know the value, it's usually 0 through
int number2;
number = 5;
```

Also note that a type may be unsigned or not. A variable declared with
an unsigned type will only have value greater or equals than 0. Let's
says the maximum value for a number is 400 (401 positives value,
399 negatives values), then adding unsigned you may now use 800 values.  

The types are

* **void**: nothing
* **char**: a character like ``'c'``
* **short int**: a int of 16 bits
* **int**: a number (32 bits) ``5``
* **long int**: a number (64 bits), ``5L``
* **long long int**: a number (64 bits), ``5ULL``
* **float**: a real, prefer using double, 32 bits, ``5.0f``
* **double**: a real, 64 bits ``5.0``
* **long double**: a real, 80 bits ``5.0L``

The maximum value for an int is ``power(2, 32-1) = 2147483648``
or ``power(2,32-1) * 2 = 4294967296`` if the int is unsigned.