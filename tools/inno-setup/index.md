# Introduction

For now this course is quite empty but some help
might be added if peoples are using more advanced
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