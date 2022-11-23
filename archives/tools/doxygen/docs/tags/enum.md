# Enum

[Go back](../c.md)

This is how you are documenting an enum. You need to add documentation for the enum as a whole, and for each value.

```c
/*!
 * \typedef NEW_NAME
 * \enum NAME
 * \brief ...
 *
 * ...
 */
typedef enum NAME {
    A_VALUE //!< ... documentation
} NEW_NAME;
```

Notes

* `\typedef NEW_NAME`: if you did an inline declaration with a typedef then put this line **BEFORE** `\enum`
* `\enum NAME`: your enum name