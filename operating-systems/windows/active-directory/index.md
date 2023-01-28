# Active Directory Domain Services (ADDS)

<div class="row row-cols-md-2 mt-4"><div>

Active Directory Domain Services (ADDS) is a tool to help sysadmin to manage organisation/schools/...

* 🖥️ Manage Computers
* 🧑‍🍼️ Manage Users
* 🚧️ Manage Permissions to access files/apps/...
* ⚖️️ Manage Policies <small>(ex: password length/...)</small>
</div><div>

With ADDS, you log in once, from any machine, and got access to everything that you were giving access to

* 📂 Your files/folders and shared files/folders
* 🖨️ Printers
* ✉️ Applications <small>(emails, vpn...)</small>
* ...
</div></div>

<hr class="sep-both">

## Get started

<div class="row row-cols-md-2"><div>

You must have an image with **Windows Server** 2019/2022. As a student, you can get one for free [here](https://azureforeducation.microsoft.com/devtools). 

<details class="details-n">
<summary>Notes for Virtual Box</summary>

* Click on new, select the ISO
* Select unattended
* Start the machine
* Process as usual with the setup...
* Power off the machine
* Remove CD <small>(Settings>Storage>CD, the disk icon on the right)</small>
</details>

<details class="details-n">
<summary>Installation (graphical)</summary>

* Start the **Server Manager**
* Click on "Add roles and features"
* Press Next twice
* In Server Roles, select ADDS
* Press Next twice, then Install
* Click on the notification icon with a warning (⚠️)
* Click on "Promote this server to a domain controller"

**Add a forest**

* Give a root domain name (ex: `XXX.com`)
* Add a "restore password"
* Press "Next" 4 times
* Press "Install"
</details>
</div><div>

**Where to learn?**

* [Introduction to ADDS Structure in Windows Server 2012](https://www.youtube.com/watch?v=lFwek_OuYZ8)
</div></div>

<hr class="sep-both">

## ✨ Basics ✨

<div class="row row-cols-md-2"><div>

**Domain Controller** (DC): servers from which you can manage the organisation using ADDS. For instance, the initial computer where Windows Server is installed is a Domain Controller.

**Domain**: this is a value such as `xxx.com` that should be unique by design. You don't need to buy/own the domain name. When users will connect to it, they will use `xxx/`
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old.md](_old.md)
* Windows Admin Center
* SConfig <small>(rely on PowerShell to manage ADDS)</small>
</div><div>

* [???](https://www.youtube.com/watch?v=hxgz7MR7MGQ)
* Tools (in the top-right corner)

</div></div>
