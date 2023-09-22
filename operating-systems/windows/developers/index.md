# Windows For Developers

<div class="row row-cols-md-2"><div>

Windows is commonly used by developers 🍃. While it is less convenient than Linux in some ways, there are some ways to make it suitable for developing software and everything else 🐊.

* [WSL](#windows-subsystem-for-linux-wsl) is commonly used to get a Linux console environment
* [Cygwin or MinGW]() are commonly used to get a Linux console environment or to get `.exe` versions of Linux commands.
* [VSCode](/tools-and-frameworks/editors/vscode/index.md) or [JetBrains](/tools-and-frameworks/editors/jetbrains/_general/index.md) are commonly used as editors to write code
* [WAMP](/operating-systems/webservers/apache/wamp.md) is often used to emulate a webserver for web development
* ...
</div><div>

While not specific to Windows, these are often used instead of the Linux command:

* [FileZilla]() mostly for FTP
* [Putty MobaXTerm...]() mostly for SSH, FTP...
* ...

➡️ For article on Windows, check out the [Windows Club](https://www.thewindowsclub.com/).
</div></div>

<hr class="sep-both">

## Windows Subsystem for Linux (WSL)

<div class="row row-cols-md-2"><div>

[Windows Subsystem for Linux (WSL)](https://learn.microsoft.com/en-us/windows/wsl/) is a system that allows us to access a Linux CLI interface. It's basically a [docker](/operating-systems/others/virtualization/docker/index.md).

[Follow the install instructions here](https://learn.microsoft.com/en-us/windows/wsl/setup/environment). Basically, open a PowerShell or a CMD as an admin and install any WSL.

```ps
PS> wsl -l -o
Ubuntu                                 Ubuntu
Debian                                 Debian GNU/Linux
...
PS> wsl --install Debian
```

You can start it as you would with any programs.

💡 You can also download them from the Microsoft Store.
</div><div>

...
</div></div>

<hr class="sep-both">

## InnoSetup

<div class="row row-cols-md-2"><div>

[InnoSetup](https://github.com/jrsoftware/issrc) is a tool to create modern Windows installers. You can download it [here](https://jrsoftware.org/isdl.php) 🍬. Simply install and run the software.

Use the `Create a new file using the Script wizard` wizard. It will generate a `.iss` with the configuration to generate the installer.

#### Target folder

Ex: All files will be stored in the `app` folder.

```diff
-Source: "a\path\to\app\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
+Source: "a\path\to\app\*"; DestDir: "{app}\app"; Flags: ignoreversion recursesubdirs createallsubdirs
```
</div><div>

#### CLI options

```ps
PS> file.exe /SILENT      # Only show the progress bar
PS> file.exe /VERYSILENT  # No installer visible
# Add custom options
PS> file.exe /VERYSILENT /MERGETASKS="desktopicon,postinstall"
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

...
</div><div>
</div></div>