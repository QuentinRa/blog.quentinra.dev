# VirtualBox

<div class="row row-cols-md-2"><div>

VirtualBox is a popular free virtualization software.

* [Download VirtualBox](https://www.virtualbox.org/)

➡️ I strongly advise using version 7+, because, as far as I'm concerned, I have less problems in the newer version.
</div><div>

* ✨ You can create shared folders between host and VM
* ✨ You can copy/paste to/from the VM
* 🏪 You can take snapshots
* 🪲 There are many bugs/the UX is pretty bad
* 🔥 You can configure many things
* 👎 Lack of ways to import/export VMs from/to VMWare
</div></div>

<hr class="sep-both">

## Additional setup

<div class="row row-cols-md-2"><div>

#### VB Guest Additions

You may need to install Virtual Box Guest Additions later

* Start the machine
* Select <kbd>Device > Insert Guest Additions CD...</kbd>
* Install the software on the CD
* Restart
</div><div>

#### VB Extension pack

You may need to install Virtual Box Extension pack later

* <kbd>Help > About Virtual Box</kbd> to find your version
* [Download Virtual Box Extension pack](https://download.virtualbox.org/virtualbox/) <small>(version/xxx.vbox-extpack)</small>
* File > Tools > Extension Pack Manager > Install

</div></div>

<hr class="sep-both">

## Random features

➡️ On Windows, the "host" key is CTRL (Right).

<div class="row row-cols-md-2 mt-3"><div>

#### CTRL+ALT+DEL

* In the menubar: <kbd>Input > Keyboard > Insert CTRL-ALT-DEL</kbd>.
* Use the shortcut: <kbd>HOST + DEL</kbd>

#### Take a snapshot

Click on the menu icon next to your VM,  and select "Snapshot".

<div class="text-center">

![vm_more.png](_images/vm_more.png)
</div>

➡️ To avoid problems, you should do it when the VM is off.

➡️ If the machine is started, you can also use the menu <kbd>Machine > Take Snapshot...</kbd> for the menubar.
</div><div>

#### Shared keyboard/folder

Right-click on a machine, and open Settings. 

* In General > Advanced, you can enable bidirectional keyboard
* In Shared folders, you can create shared folders

➡️ On Windows VMs, you need to install VB Guest Additions.

#### Resize the screen to fit yours

* In the menubar: <kbd>View > Seamless mode</kbd>.
* Use the shortcut: <kbd>HOST + L</kbd>

➡️ On Windows VMs, you need to install VB Guest Additions.
</div></div>

<hr class="sep-both">

## Random notes

<div class="row row-cols-md-2 mt-3"><div>

#### Bug: no automatic mouse integration

By default, you can freely use your mouse between your host and your virtual machine. But, I had a bug 🪲, when restarting a machine close using "save instance state", in which my mouse was not detected anymore.

➡️ My "patch" is to lock the VM before closing it.
</div><div>

#### Bug: bidirectional keyboard not working

➡️ Try restarting the VM.

#### Notes for Active Directory

➡️ If the VM crashes often, try reducing the size of the screen, it won't always work, but that's better than nothing.

➡️ The NAT adapter can mess with some things like when adding a child domain. You should disable it <small>(if applicable/temporarily)</small>.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Network Adapters (see Active directory)
</div><div>
</div></div>