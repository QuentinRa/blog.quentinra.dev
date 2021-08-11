## Install doxygen

[Go back](index.md)

Tutorial for windows but the idea
should be almost the same for any OS.

* download the app [here](https://sourceforge.net/projects/doxygen/files/rel-1.9.1/)
* install it
* edit the ``PATH`` and add the `/bin` in your installation folder

    * ``Windows`` search bar : type `var`
    * click on ``... modify system environnement variables ...``
    * click on ``environnement variables`` (at the bottom)
    * then ``Path`` in the first box
    * then ``modify``
    * and add on a blank entry ``C:\Program Files\doxygen\bin`` if that's your path to doxygen
      bin folder.
    * save and open a **new** terminal

* this command ``doxygen -v`` should print
  `doxygen` version

There is an interface that can help you create a ``Doxygen``
file but It won't be covered here.