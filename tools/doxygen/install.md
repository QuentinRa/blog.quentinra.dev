# Install Doxygen

[Go back](index.md)

This is a tutorial for Windows. I don't think a tutorial is needed for Linux, after all.

* download the app [here](https://sourceforge.net/projects/doxygen/files/rel-1.9.1/)
* install it
* edit the ``PATH`` and add the `/bin` in your installation folder
    * ``Windows`` search bar : type `var`
    * click on ``... modify system environment variables ...``
    * click on ``environment variables`` (at the bottom)
    * then ``Path`` in the first box
    * then ``modify``
    * and add on a blank entry ``C:\Program Files\doxygen\bin`` if that's your path to doxygen bin folder.
    * save and open a **new** terminal
* this command ``doxygen -v`` should print `doxygen` version

<hr class="sl">

## GUI

There is a graphical version of Doxygen, allowing you to use a menu to create your Doxygen file. It won't be covered here, as I want to change the renderer (to make my documentation beautiful).