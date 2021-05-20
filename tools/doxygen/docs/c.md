## Doxygen in C

[Go back](..)

> You will use these not only in C but everywhere else
> but I wrote ``C`` since they only got tested in C

Most of the time you can add a

* ``\brief short desc`` short description
* `...` : and/or a long description after all tags
* ``\see ...``  : reference another tag, such as a file/type/...
  only one ``see`` per line but you can have
  as many of theses as you want.
* ``{@link ....}`` : or you can use that is like see
but can be used inside text such as in the middle of
  a sentence
  
Here is some help for some tags

* [A file](tags/file.md)
* [A folder](tags/folder.md)
* [An enum](tags/enum.md)
* [A structure](tags/structure.md)
* [An include](tags/include.md)
* [A define](tags/define.md)
* [A variable](tags/variable.md)
* [A function](tags/function.md)
* [Others tags](tags/others.md)