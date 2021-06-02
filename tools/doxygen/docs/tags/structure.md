#### Comment a structure

[Go back](../c.md)

```c
/*!
* \typedef NEW_NAME
* \struct NAME
* \brief brief description of this struct
*
* ...
*
*/
typedef struct NAME {
 int id; //!< brief description of this attribute
 char* key; /*!< @brief
    * This is a big description of this attribute
    * that I'm writing here.
    */
} NEW_NAME; //!< brief description of this struct
```

It may be tiring but you have to make sure
to write to tag brief and **typedef** must
be before **struct** otherwise you will have
an error.