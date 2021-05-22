# We will go over

* **CLion**: write `C` or `C++`
* **IntelliJ**: Write ``Java``, `JavaFX`, `R`, `OCaml`, `SQL`
* **PHPStorm**: Write ``PHP``, `HTML/CSS/JS`, `Node/Typescript`, `SQL`
* **WebStorm**: same as PHPStorm without ``PHP`` and `SQL` support
* **PyCharm**: Write ``Python``
* **AndroidStudio**: Write ``Kotlin``/`Java for android`

## Pro(s) and cons(s)

Before digging into, please take note that Jetbrains
IDE

* may take a lot of memory
* may take a lot (~3Gb per IDE) of disk space, since you will
  have to download many IDEs in most cases
* in ``IDEA``, you can't compile a file but always everything at all
* in ``CLion``, I'm not really a fan of `CMakeLists` over `Makefiles`

And here a some functionalities

* they come ``preconfigured`` so most of the time,
  download and run and that's it.
* the interface is the same in all of theirs IDEs
* they allow you to code in team by joining a friend
  with ``CodeWithMe``
* you can manage your projects with ``YouTrack``
* verify your code and giving you advices/fix : check
* generating ``UML`` from code : check
* spelling : check
* git integration, color for files : check
* code directly on a server `PHP` : check
* move easily between files, search tools : check
* can create language plugin easily : check
* connect to a database, sql integration : check
* intelligent refactoring : check

## Installation

I personally recommend using the
[toolbox](https://www.jetbrains.com/toolbox-app/)
to manage your app.

If you are a student and wants free IDEs then process
this form
[students](https://www.jetbrains.com/shop/eform/students)
using your **academic** email.

## Interface presentation

Jetbrains underline in

* ``red`` : errors
* ``yellow`` : warnings
* ``green`` : typos
* or color in ``grey`` : unused variables

You may clic on a underlined word and press ``alt+enter``
to see a quick fix of it. 

* [Interface](presentation/interface.md)
* [Shortcuts](presentation/shortcuts.md)
* [Free tips](presentation/tips.md)
* [Menus](presentation/menus.md)

## IDE : IntelliJ IDEA

Examples of cases where you might be using it

* code in ``Java`` (with or not with `Gradle` and `Maven`)
* code in ``Kotlin``
* code in ``R`` (with a plugin)
* code in ``OCaml`` (with a plugin)
* code in ``JavaFX`` and with Scene builder

One thing to note is the menu `Project structure`
(`CTRL+ALT+MAJ+S`). You can 

* change you JDK
* change your module configuration (set source folder, tests folder, output folder, ...)
* add libraries (such as JUnit4, ...)

* [Run](idea/run.md)
* [Run tests](idea/tests.md)
* [Project Structure](idea/project-structure.md)

## IDE : PHPStorm

...

## IDE : CLion

...

## Sources

* Anonymous
* Quentin RAMSAMY–AGEORGES ([ENSIIE](https://www.ensiie.fr/) student)

References

* [PHPStorm](https://www.jetbrains.com/help/phpstorm/quick-start-guide-phpstorm.html)
* [CLion](https://www.jetbrains.com/help/clion/installation-guide.html)
* [IntelliJ IDEA](https://www.jetbrains.com/help/idea/discover-intellij-idea.html)
* [Remote working - create](https://www.jetbrains.com/help/phpstorm/creating-a-remote-server-configuration.html)
* [Remote working - sync](https://www.jetbrains.com/help/phpstorm/configuring-synchronization-with-a-remote-host.html#server-access-config)
* [Remote working - upload](https://www.jetbrains.com/help/phpstorm/uploading-and-downloading-files.html#automaticUploadOnUpdate)
* [Remote working - edit](https://www.jetbrains.com/help/clion/editing-individual-files-on-remote-hosts.html)
* [Remote working - support](https://www.jetbrains.com/help/clion/remote-projects-support.html)
* [CLion - gradle support](https://www.jetbrains.com/help/clion/gradle-support.html#gradle-config)