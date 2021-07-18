# Command

[Go back](..)

You should separate the one using a command
and the command. For instance, if you have

* a menu bar
* a menu calling a "command" (like some code to exit the app)
* **then** the command should be in another class or at 
  least in a method.

By doing so, you would be able to reuse the command somewhere
else, for instance, if you add it too in a context menu...

* ✅ : a better code logic
* 🚫 : ...
