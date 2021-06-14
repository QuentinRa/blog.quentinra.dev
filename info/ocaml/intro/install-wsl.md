# Install OCaml in WSL

[Go back](..)

First, install a [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10).
Then you can install OCaml like you would on Linux. 
You may use

```bash
sudo apt-get update && sudo apt-get install ocaml
# or
sudo aptitude update && sudo aptitude install ocaml
# or whatever you want
# ...
```
  
Then you can start writing some code. But now
you may want some graphical interface don't you?

(be sure in the following links to look for **public
domain** releases)

* Install [XMing](http://www.straightrunning.com/XmingNotes/)
* Install [XMing fonts](http://www.straightrunning.com/XmingNotes/)
* restart

And at **each startup** if you need it, start XMing.
You can use

* sublime text: ``sudo apt-get install sublime-text``
then ``subl -c``
* emacs: ``sudo apt-get install emacs`` then
``emacs -c``
* IntelliJ: ``idea.sh -c`` (if idea.sh is in the PATH
  or in the current folder, it's usually in idea/bin
  and idea folder would be the tar.gz downloaded)