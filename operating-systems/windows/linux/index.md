# FTP (file transfer protocol)

<div class="row row-cols-md-2"><div>

You will most likely have to transfer files to a server. You may use the graphical interface provided by [FileZilla](https://filezilla-project.org/).

Once connected,

* **Upload**: simply drag and drop a file into a folder on your server.

* **Download**: simply drag and drop a file into a folder on your computer.
</div><div>

Add a server

* File > Site Manager...
* New
* You will most likely use SFTP
    * Host is the IP of your server
    * Port is usually 22, you can leave it empty
    * Enter your username
    * Connect

</div></div>

> There is also [WinSCP](https://winscp.net/eng/index.php) if you want to use FTP/SCP. <br>
> There is also [CuteFTP](https://www.globalscape.com/cuteftp). <br>
> You may directly use the scp command without any interface, if you install GitSCM (see SSH).

<hr class="sr">

## SSH (Secure Shell)

<div class="row row-cols-md-2"><div>

Here are two graphical interfaces

* [Putty](https://putty.org/)
* [mobaxterm](https://mobaxterm.mobatek.net/)
* [xshell](https://www.xshell.com/en/xshell/)
* [mRemoteNG](https://github.com/mRemoteNG/mRemoteNG) (support RDP too)

</div><div>

Otherwise, if ssh is not installed on your computer, you can install it using [GitSCM](https://git-scm.com/), which will also install scp, and some other commands you might need.
</div></div>