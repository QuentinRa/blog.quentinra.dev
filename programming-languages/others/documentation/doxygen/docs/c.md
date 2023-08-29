# Doxygen in C

[Go back](..)

You will use these not only in C but everywhere else, but I wrote `C` since they only got tested in C. This is a list of the tags you will use

* [For a file](tags/file.md)
* [For a folder](tags/folder.md)
* [For an enum](tags/enum.md)
* [For a structure](tags/structure.md)
* [For an include](tags/include.md)
* [For a define](tags/define.md)
* [For a variable](tags/variable.md)
* [For a function](tags/function.md)
* [Tests](tags/others.md)

<hr class="sr">

## Common tags

Most of the time, in the comment, you can add

* `\brief short desc`: short description
* `...`: and/or a long description after all tags
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