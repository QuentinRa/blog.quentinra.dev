# Structure

[Go back](../c.md)

This is how you are documenting a structure. You need to add documentation for the structure as a whole, and for each field.

```c
/*!
* \typedef NEW_NAME
* \struct NAME
* \brief a brief description of this struct
*
* ...
*
*/
typedef struct NAME {
    int id; //!< brief description of this attribute
    char* key; /*!< @brief
        * This is a long description of this attribute
        * that I'm writing here.
        */
} NEW_NAME; //!< brief description of this struct
```

It may be tiring but you have to make sure

* to write to tag brief 
* and **typedef** must be before **struct**, otherwise you will have an error (random).