# We will go over

* **CLion**: write `C` or `C++`
* **IntelliJ**: Write ``Java``, `JavaFX`, `R`, `OCaml`, `SQL`
* **PHPStorm**: Write ``PHP``, `HTML/CSS/JS`, `Node/Typescript`, `SQL`
* **WebStorm**: same as PHPStorm without ``PHP`` and `SQL` support
* **PyCharm**: Write ``Python``
* **AndroidStudio**: Write ``Kotlin``/`Java for android`

<hr class="sl">

## Installation

I recommend using the
[toolbox](https://www.jetbrains.com/toolbox-app/)
to manage your app. The only IDEs available for
free are IntelliJ (Java) and AndroidStudio.

If you are a student and wants a full access
to other IDEs then process
[this form](https://www.jetbrains.com/shop/eform/students)
using your **academic** email.
You can also get a lot of free bonuses
as a student like on 
[Unity](https://store.unity.com/academic/unity-student)
or with 
[GitHub Student Developer Pack](https://education.github.com/pack#offers).

<hr class="sr">

## Interface presentation

Jetbrains underline in

* ``red`` : errors
* ``yellow`` : warnings
* ``green`` : typos
* or color in ``grey`` : unused variables

You may click on an underlined word and press ``alt+enter``
to see a quick fix of it. 

* [Interface](presentation/interface.md)
* [Shortcuts](presentation/shortcuts.md)
* [Free tips](presentation/tips.md)
* [Menus](presentation/menus.md)

<hr class="sl">

## IDE: IntelliJ IDEA

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

## IDE: PHPStorm

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

## IDE: CLion

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

## Pro(s) and cons(s)

Jetbrains IDE

* may take a lot of memory
* may take a lot (~3Gb per IDE) of disk space since you will
  have to download many IDEs in most cases
* in ``IDEA``, you can't compile a file but always everything at all
* in ``CLion``, I'm not a fan of `CMakeLists` over `Makefiles`

And here a some functionalities

* they come ``preconfigured`` so most of the time,
  download and run and that's it.
* the interface is the same in all of theirs IDEs
* they allow you to code in a team by joining a friend
  with ``CodeWithMe``
* you can manage your projects with ``YouTrack``
* verify your code and giving you advice/fix
* generating ``UML`` from code
* spelling (some rustic support)
* git integration, color for files
* code directly on a server `PHP`
* move easily between files, search tools
* can create language plugins easily
* connect to a database, sql integration
* intelligent refactoring
* can reset to the previous version of a file
  (with or without git)

<hr class="sl">

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