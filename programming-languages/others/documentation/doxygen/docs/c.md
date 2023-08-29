# Tags

* `\see ...`: reference another tag, such as a file/type/... You can only have per line, but you can have as many of these as you want.
* `{@link ....}`: same as see but can be used inside text  such as in the middle of a sentence

```c
/*!
 * \brief short description
 * \see file.h
 * \see file2.h
 *
 * a long description having a {@link file.h}
 * and nothing more.
*/
```