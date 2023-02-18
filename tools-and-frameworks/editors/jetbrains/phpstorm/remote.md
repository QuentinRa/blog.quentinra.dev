# Remote

[Go back](../../../../_kmp/_archives/tools/jetbrains/index.md#phpstorm)

You can import or create a remote project, with the following steps.

* New project from existing files
* Web server is a remote host ... FTP
* set the local path for the project
* add a remote server
    * name: a name for you
    * type: FTP or SFTP
    * host: FTP (port 21) or SFTP (port 22)
    * SFTP means using SSH but input your credentials
    * root path: autodetect
    * webserver URL: put your server URL here, not your website one
* select folder project on the server
* you may or not correct the server URL here

Now you should enable the automatic upload

* `Settings > Build …, Deployment > Deployment > Options`
* set `Upload changed files automatically ...` to `on … save action` or `always`.