# Introduction

InnoSetup is allowing you to create modern Windows installers. For now, this course is quite empty, but more help might be added if people are using more advanced concepts than I do.

First, [download the software here](https://jrsoftware.org/isdl.php#stable), and you might [check their GitHub](https://github.com/jrsoftware/issrc). Simply install and run the software. When starting, choose ``Create a new file using the Script wizard`` and follows the steps. That's quite easy.

The generated file will be a ``xxx.iss`` kind of file.

<hr class="sr">

## Keep folders

If you added a folder because you need the same folder with the same files inside, then replace

```bash
Source: "a\path\to\app\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
```

with

```bash
Source: "a\path\to\app\*"; DestDir: "{app}\app"; Flags: ignoreversion recursesubdirs createallsubdirs
```

<hr class="sl">

## Run from the command line

You can run your setup from the command line, it can be useful if you want to run an installer from another program.

```bash
# only show the progress bar
> file.exe /SILENT
# no installer
> file.exe /VERYSILENT
# no installer, check the task "desktopicon" and "postinstall"
# (if you got these tasks)
> file.exe /VERYSILENT /MERGETASKS="desktopicon,postinstall"
```

<hr class="sl">

## Sources

* <https://documentation.help/Inno-Setup/topic_whatisinnosetup.htm>
* <https://jrsoftware.org/isfaq.php>
* <https://github.com/persepolisdm/persepolis-windows-package-build/blob/master/setupX64.iss>
* <https://revolution.screenstepslive.com/s/revolution/m/10695/l/563371-signing-installers-you-create-with-inno-setup>

Help

* <https://stackoverflow.com/questions/12951327/inno-setup-check-if-file-exist-in-destination-or-else-if-doesnt-abort-the-ins>
* <https://stackoverflow.com/questions/15638663/creating-an-installer-that-will-perform-an-update-if-an-older-version-is-already>
* <https://stackoverflow.com/questions/14685149/creating-an-installer-for-java-desktop-application#14686023>
* <http://izpack.org/>
* <http://jrsoftware.org/ishelp/index.php?topic=consts&anchor=userappdata>
* <http://stackoverflow.com/questions/13728902/powershell-script-after-install>
* <http://stackoverflow.com/questions/252226/signing-a-windows-exe-file>
* <https://documentation.help/Inno-Setup/topic_setupcmdline.htm>
* <https://stackoverflow.com/questions/3767227/run-application-after-successful-install>