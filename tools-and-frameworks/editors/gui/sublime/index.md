# Sublime Text

<div class="row row-cols-md-2"><div>

[Sublime Text](https://www.sublimetext.com) is a well-known graphical text editor 🦄.

```shell!
$ wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
$ echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
$ sudo apt-get update
$ sudo apt-get install sublime-text
$ subl # open sublime text
```
</div><div>

Basic usage 📚:

* Use arrows to navigate in the file
* <kbd>Ctrl+S</kbd>: save file
* <kbd>Ctrl+B</kbd>: build file <small>(based on the file extension)</small>

**To-do** 👻

* Snippets
* Extensions
</div></div>