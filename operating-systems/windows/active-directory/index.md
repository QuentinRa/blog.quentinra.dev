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

Go to Tools > Network. Create or select a adapter.

* DHCP server must be disabled
* Note the gateway is (ex: `X.X.X.1`)

On your VM with your VM

* Click on Settings > Network
* Adapter2
* Enable it
* Select "Host-only adapter"
* Select your adapter
</details>

<details class="details-n">
<summary>Configure your Server IP Address</summary>

* Control Panel
* Network and Internet
* Network And Sharing Center
* Select your network <small>(ex: Ethernet 2)</small>
* Properties > IPV4 > Properties
  * IP: X.X.X.2
  * Mask: 255.255.255.0
  * Default gateway: X.X.X.1
  * DNS: X.X.X.2
</details>

<details class="details-n">
<summary>Set your DC name</summary>

* Click on "Local Server"
* Click on your computer name (in blue)
* Click on "Change"
* Set the name your want
* Restart
</details>

<details class="details-n">
<summary>Installation ADDS (graphical)</summary>

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

<details class="details-n">
<summary>Installation DHCP (graphical)</summary>

* Start the **Server Manager**
* Click on "Add roles and features"
* Press Next twice
* In Server Roles, select DHCP Server
* Press Next twice, then Install
* Click on tools > DHCP

Configure your DHCP server

* IPV4 > New Scope 
    * Name: Lan1
    * Select a range of addresses
    * You can prevent person from taking some addresses
    * Select the duration of the lock on the IP address <small>(ex: 1 day)</small>
</details>
</div><div>

**Where to learn?**

* [Introduction to ADDS Structure in Windows Server 2012](https://www.youtube.com/watch?v=lFwek_OuYZ8)
</div></div>

<hr class="sep-both">

## ✨ Terminology ✨

<div class="row row-cols-md-2"><div>

**Domain Controller** (DC): servers from which you can manage the organisation using ADDS. For instance, the initial computer where Windows Server is installed is a Domain Controller.

**Domain**: for instance, `xxx.com`. You don't need to own it <small>(in a real-world install, you should)</small>. When users will connect to it, they will use `server/username`.

➡️ `server` is usually `xxx` in `xxx.com`.
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
* [???](https://www.youtube.com/watch?v=hxgz7MR7MGQ)
* Tools (in the top-right corner)
</div><div>

Init

* Rename host? (click > Change > ...)

DHCP

* Address leases: addresses given to a client
* Reservations: Given a MAC address, assign it to one static IP
</div></div>
