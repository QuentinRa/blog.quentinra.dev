# Virtual Machines

Notes about Virtual Machine, Emulators, along with links to download CTF Virtual Machines to have some fun.

<hr class="sep-both">

## Virtual machine emulators

<div class="row row-cols-md-2 mt-3"><div>

📌 **VMWare workstation** 📌

* **Link**: [VMware Workstation 16.2.4 Player](https://customerconnect.vmware.com/downloads/details?downloadGroup=WKST-PLAYER-1624&productId=1039&rPId=91446)
* **Notes**
  * 🚀 You can import pre-configured VMs
  * ✨ The UX is better than in Virtual Box
  * 👎 Their documentation isn't helpful. If you got problems with the keyboard, or want to permanently resize the screen, it will take more than a few clicks.
  * ➡️ in the settings
    * You can create a shared folder between Windows/your VM
    * The bidirectional keyboard is already enabled
</div><div>
</div></div>

> There is also [qemu](https://www.qemu.org/), mostly for Linux users.

<hr class="sep-both">

## Linux Virtual Machines 👑

<div class="row row-cols-md-2 mt-4"><div>

**Kali Linux** 🚀

* [Link](https://www.kali.org/get-kali/#kali-virtual-machines)
* Get started in seconds 🚀
  * **VirtualBox**: Click on new, do the first two steps <small>(type: Linux, version: Linux 2.6/3.x/4.x/5.x (64-bits), set other values however you want)</small>. In the 3rd menu, select "Use an existing hard drive", and select the one you downloaded. That's it 🤡.
  * **VMWare**: click on import and select the downloaded VM.
* **Username**: kali / **Password**: kali
* Don't forget to use `sudo apt update` / `sudo apt upgrade`

<details class="details-e">
<summary>Swap to another keyboard layout</summary>

* First, log in
* Click on Kali icon (top left)
* Search "Keyboard"
* Select the Keyboard Utility
* Go to the layout tab
* Add a keyboard layout <small>(ex: fr-FR/AZERTY)</small>
* Remove the unused QWERTY layout

> The change is applied immediately... But on the login screen, the keyboard layout will still be QWERTY ⚠️.
</details>

<details class="details-e">
<summary>Wordlists</summary>

**Wordlists**

* Run `wordlists` and press Y to extract `rockyou.txt`
* You can find pre-installed wordlists in `/usr/share/wordlists/`

**Seclists**

* `sudo apt install seclists` to install [SecLists](https://github.com/danielmiessler/SecLists/) wordlists.

**Others**

* `/usr/share/webshells`: bind/reverse/web shells
</details>

<details class="details-e">
<summary>Tips 🪄</summary>

* Use the <kbd>right arrow</kbd> key to use the suggested command

* In the top-right corner, you can find your IP address (tun0)
</details>
</div><div>

**Parrot Linux**

* [Link](https://www.parrotsec.org/)

<br>

**BlackArch** 😶‍🌫️

* [Link](https://www.blackarch.org/)
</div></div>

<hr class="sep-both">

## CTF Virtual Machines

⚠️ Do not use these machines for something else aside from testing your penetration skills. They are all vulnerable by design.

<div class="row row-cols-md-2 mt-4"><div>

**Metasploit Vulnerable VM** 💣

* [Metasploit 2](https://docs.rapid7.com/metasploit/metasploitable-2/)
* [Metasploit 3](https://github.com/rapid7/metasploitable3)
* **Username**: `msfadmin`. **Password**: `msfadmin`
* Intentionally misconfigured Linux <small>(no graphical interface)</small>
* You can swap to AZERTY with `sudo loadkeys fr`
</div><div>

**DarkStar7471** 🌠

You can find VMs made by DarkStar7471 on TryHackMe [here](https://darkstar7471.com/resources.html).

**Game of Active Directory**

* [Link](https://github.com/Orange-Cyberdefense/GOAD)
* 1.4k ⭐
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

**Setup Windows XP**

* [helpdeskgeek](https://helpdeskgeek.com/virtualization/how-to-set-up-a-windows-xp-virtual-machine-for-free/)
* [makeuseof](https://www.makeuseof.com/tag/download-windows-xp-for-free-and-legally-straight-from-microsoft-si/)
* [ihax.io](https://ihax.io/windows-xp-virtual-machine/)

</div><div>

</div></div>