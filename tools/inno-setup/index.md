# Introduction

For now, this course is quite empty but more help
might be added if people are using more advanced
concepts that I do.

First download the software [here](https://jrsoftware.org/isdl.php#stable)
and you might check the [github](https://github.com/jrsoftware/issrc).

Simply install and run the software. When starting, choose
``Create a new file using the Script wizard`` and
follows the steps. That's quite easy.

The generated file will be a ``xxx.iss`` kind of file.

<hr class="sr">

## Converse folder of files

If you added a folder with files inside and you want
to move re-create the same folder with the installer
then replace

```bash
Source: "xxxx\app\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
# by
Source: "xxxx\app\*"; DestDir: "{app}\app"; Flags: ignoreversion recursesubdirs createallsubdirs
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