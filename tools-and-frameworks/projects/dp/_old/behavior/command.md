# Command

[Go back](..)

You should separate the one using a command and the command. For instance, if you have

* a menu bar
* a menu calling a "command" (like the exit menu, calling "exit()")
* **then** the command should be in another class or at the very least in a method.

By doing so, you would be able to reuse the command somewhere else, for instance, if you add it too in a context menu (the right-click menu).

* ✅ : a better code logic
* 🚫 : ...
