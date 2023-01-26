# Makefile

[Go back](../index.md#clion)

I was originally able to use Makefile without a prior setup, but it suddenly wasn't possible anymore (I got the error "/usr/bin/make" not found, but it was working like 5 minutes ago 😭)

* Install [Cygwin](https://www.cygwin.com/install.html)
* In the list of packages (when installing),
  * add gcc
  * add make
  * add any command you might need
* then download, install, and exit
* the file `C:/cygwin64/bin/make.exe` should exist
* then open a project
  * remove the CMakeList
  * remove the cmake-build-debug
  * Settings
  * Enter "make"
  * In Build tool > Make
    * "C:\cygwin64\bin\make.exe"
    * and check "use Cygwin"

Then, to run your program in the IDE, create a target "run", with the command to run your program. Try to start it in the list of configurations, it fails, but you simply add your program in "executable" and you're done.

Unfortunately, this is still not good enough, like I can't use the debugger which means it's pretty useless (at least in my eyes).