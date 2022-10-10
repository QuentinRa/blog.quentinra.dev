# Linux on Windows

Knowledge related to using Linux on Windows.

<hr class="sl">

## Windows Subsystem for Linux (WSL)

<div class="row row-cols-md-2"><div>

Windows Subsystem for Linux lets developers run a GNU/Linux environment including most command-line tools, utilities, and applications, directly on Windows [according to the Windows Subsystem for Linux Documentation](https://learn.microsoft.com/en-us/windows/wsl/).

* Click on the search icon / search for a program
* Look for powershell
* Right-click on it > "Run as administrator"

![run_powershell_as_admin](_images/run_powershell_as_admin.png)
</div><div>

* Enter `wsl --install` to install Ubuntu
* You can install `debian`, `kali-linux`... See `wsl --list --online`.
* You will most likely have to reboot

Once, you did, in the search bar / search for a program, and search for `WSL`, or `debian` if you installed Debian...

* Wait for a few seconds
* Enter a username, and a password <small>(there is no echo, you won't see your password)</small>

On Windows, you can browse your WSL files in the Linux section of your file explorer

![browse_wsl_files](_images/browse_wsl_files.png)

> You can also enter the PATH `\\wsl.localhost\`, or `\\wsl$`.
</div></div>

> There are a lot of downsides to a WSL, such as the lack of a graphical user interface, or some commands not working, including many of the network-related commands such as "ping".