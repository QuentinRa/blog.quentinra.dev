#### Comment a enum

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

* ``\typedef NEW_NAME`` : if you did an inline
  declaration with a typedef then put this
  line **BEFORE** ``\enum``
* ``\enum NAME`` : your enum name