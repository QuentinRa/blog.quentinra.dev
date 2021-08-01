# Introduction

IDE are used to make your life easier. You may do well
using text editors like vim, emacs, sublime text, but
I'm sure some would more (autocompletion, code hints,
auto-import, syntax errors hints without needing
to recompile the project etc.).

This course is about Jetbrains IDE, a suite a IDEs like

* **CLion**: write **C** or **C++**
* **IntelliJ**: **Java**, R, OCaml, SQL
* **PHPStorm**: Write **PHP**, **HTML/CSS/JS**, **Node/Typescript**, SQL
* **WebStorm**: same as PHPStorm without PHP and SQL support
* **PyCharm**: **Python**
* **AndroidStudio**: Write Kotlin/Java for Android

It's a feature of Jetbrains: instead of providing an IDE
that is doing half of what you want, and needing a lot
of tuning/configuration, their IDE a pre-configured
and quite powerful. The best alternative would be
VSCode.

The IDEs are free for 
[students](https://www.jetbrains.com/shop/eform/students)
(you may apply for **Github Student Pack** too
[here](https://education.github.com/pack#offers)).
You can download all their idea using the
[toolbox](https://www.jetbrains.com/toolbox-app/).

**Note**: this course was made before the major releases
``2021.2``  so a lot of things have yet to be updated.

* <https://www.jetbrains.com/idea/whatsnew/2021-2/>
* <https://www.jetbrains.com/webstorm/whatsnew/2021-2/>
* <https://www.jetbrains.com/phpstorm/whatsnew/2021-2/>
* <https://www.jetbrains.com/clion/whatsnew/2021-2/>
* <https://www.jetbrains.com/datagrip/whatsnew/2021-2/>

<hr class="sl">

## What you can expect (or not) from their IDEs

* Import size/ram consumption

There are many IDE so that's a lot of space
(3 of them size around 10Go, around 700Mo per download)
and the RAM consumption
is somewhat important (sometimes could take 1Go~2Go). If you do
not have a good computer, you may use **Projector**, which
allow you to use a remote IDE
<span class="tms">
(not tested, it seems
you need another computer "the server" running your IDE,
while you slow computer will be "the client")
</span>
.

* auto-install

Installing Java, JavaFX, etc. are simplified and could
be directly done inside the IDE (in like one or two clicks).
You can easily install and update dependencies
(and you got a head-ups when they are not up-to-date).

* consistency

Their IDE are using the same interface, almost the
same shortcuts (sometimes they are changing like in Rider),
and in all of them, you got the "CodeWithMe" feature
(allowing you to invite a friend on your computer
to code with you).

* random features
  * the code hints/advices <span class="tms">(
  that's the **only** reason
  why I would recommend their IDEs over VSCode/...
  because their advices are quite good and better
  than in VSCode for instance)</span>
  * git integration and colors for files
  * generating UML from your code
  * basic spelling checker
  * remote working (for website, opening a project on a server)
  * refactoring (deep renaming)
  * file history (you got an history of your changes even without git)
  * database (you can access your database inside their IDE)
  * you can easily connect to SSH/explore a remote server (like in FileZilla or using the command line)

<hr class="sr">

## Interface presentation

Jetbrains underline in

* <span class="text-danger">red</span>: errors
* <span class="text-my-orange">yellow</span>: warnings
* <span class="text-success">green</span>: typos
* or color in <span class="text-muted">grey</span> unused variables

You may click on an underlined word and press ``alt+enter``
to see a quick fix of it.

* [Interface](presentation/interface.md)
* [Shortcuts](presentation/shortcuts.md)
* [Free tips](presentation/tips.md)
* [Menus](presentation/menus.md)

<hr class="sl">

# IntelliJ IDEA

Examples of cases where you might be using it

* code in ``Java`` (with or not with `Gradle` and `Maven`)
* code in ``Kotlin``
* code in ``R`` (with a plugin)
* code in ``OCaml`` (with a plugin)
* code in ``JavaFX`` and with Scene builder

One thing to note is the menu `Project structure`
(`CTRL+ALT+MAJ+S`). You can

* change your JDK
* change your module configuration (set source folder, tests folder, output folder, ...)
* add libraries (such as JUnit4, ...)

Then some tutorials

* [Run](idea/run.md)
* [Run tests](idea/tests.md)
* [Project Structure](idea/project-structure.md)

<hr class="sr">

# PHPStorm

Examples of cases where you might be using it

* code in ``PHP``
* code in ``HTML/CSS/JS`` or ``Boostrap`` (but WebStorm might be wiser)
* code in ``Node.js``

Please note that you can directly code on a server, that may be useful
for those that were uploading their files each time they changed
on a server.

* [Remote working](phpstorm/remote.md)
* [Launch website](phpstorm/start.md)

<hr class="sl">

# CLion

Examples of cases where you might be using it

* code in ``C``
* code in ``C++``

Like PhpStorm, you can use a remote compiler to compile your code
or use a local one.

Using the basic configuration, you will have to use
``CMake`` to compile but `Makefile` are supported if you
manage to.

* [Starting with CMake](clion/cmake.md)
* [Set compiler](clion/compiler.md)
* [Remote working](clion/remote.md)
* [Debug](clion/debug.md)

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