# Introduction

IDEs are used to make your life easier. You may do well, using text editors like vim, emacs, or sublime text, but you may want more (auto-completion, code hints, auto-import, syntax errors hints without needing to recompile the project, etc.), without too much configuration.

This course is about JetBrains's IDEs,

* **CLion**: write **C** or **C++**
* **IntelliJ**: **Java**, R, OCaml, SQL
* **PHPStorm**: Write **PHP**, **HTML/CSS/JS**, **Node/Typescript**, SQL
* **WebStorm**: same as PHPStorm without PHP and SQL support
* **PyCharm**: **Python**
* **DataSpell**: **Python** for DataScience
* **AndroidStudio**: Write Kotlin/Java for Android, by Google and JetBrains

It's a feature of JetBrains: instead of providing an IDE that is only doing its job, their IDEs are providing advanced help, and language-specific features, without too much configuration. The best alternative in one IDE would be VSCode (free), you should try it too.

> **Note**: The IDEs are free for [students](https://www.jetbrains.com/shop/eform/students) (you may apply for **GitHub Student Pack** too [here](https://education.github.com/pack#offers)). You can **download** all their IDEs using the [toolbox](https://www.jetbrains.com/toolbox-app/).
> 
> **Note**: this course was made before `2021.2`, so a lot of things have yet to be updated.

<hr class="sl">

## What you can expect from their IDEs

* some important RAM consumption 😱
* Good to go. <small>(no need for plugins, a lot of tuning, etc.)</small>. You got a lot of predefined features that may not be available by default in others editors.
  * **Database** (either local, remote, or remote using a SSH Tunnel)
  * Open a remote project locally
  * Invite your friends/team on your IDE (**CodeWithMe**)
  * **Git integration** (easy merge, easily track changes, revert, GitHub integration)
  * **Generate UML from your code** (Java, JS, PHP)
  * Basic **spellchecker**
  * Deep refactoring <small>(ex: renaming a variable and its usages, renaming a database column and its usages, etc.)</small>
  * **File history** <small>(even without GIT, rollback to a previous version of your file)</small>
  * **Terminals** (you can open a terminal, including WSL ones, directly inside the editor)
* auto-install <small>(easy install of JavaFX, Java, ...)</small>
* They got many IDE, but they are consistent <small>(same interface, same shortcuts, etc.)</small>
* **the code hints/advice/suggestions** to fix errors, optimize your code, or detect wrong code logic 🚀

<hr class="sr">

## Interface presentation

JetBrains's IDEs are underlining in

* <span class="text-danger">red</span>: errors
* <span class="text-my-orange">yellow</span>: warnings
* <span class="text-success">green</span>: typos
* or color in <span class="text-muted">grey</span> unused variables

You may click on an underlined word and press `alt+enter` to see a quick fix of it.

* [Interface](presentation/interface.md)
* [Shortcuts](presentation/shortcuts.md)
* [Free tips](presentation/tips.md)
* [Menus](presentation/menus.md)

<hr class="sr">

## Sources

* [PHPStorm](https://www.jetbrains.com/help/phpstorm/quick-start-guide-phpstorm.html)
* [CLion](https://www.jetbrains.com/help/clion/installation-guide.html)
* [IntelliJ IDEA](https://www.jetbrains.com/help/idea/discover-intellij-idea.html)
* [Remote working - create](https://www.jetbrains.com/help/phpstorm/creating-a-remote-server-configuration.html)
* [Remote working - sync](https://www.jetbrains.com/help/phpstorm/configuring-synchronization-with-a-remote-host.html#server-access-config)
* [Remote working - upload](https://www.jetbrains.com/help/phpstorm/uploading-and-downloading-files.html#automaticUploadOnUpdate)
* [Remote working - edit](https://www.jetbrains.com/help/clion/editing-individual-files-on-remote-hosts.html)
* [Remote working - support](https://www.jetbrains.com/help/clion/remote-projects-support.html)
* [CLion - gradle support](https://www.jetbrains.com/help/clion/gradle-support.html#gradle-config)