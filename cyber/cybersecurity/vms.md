# Virtual Machines

Notes about Virtual Machine, Emulator, along with links to download CTF Virtual Machines to have some fun.

<hr class="sep-both">

## Virtual machine emulators

<div class="row row-cols-md-2 mt-3"><div>

📌 **VMWare workstation** 📌

* **Link**: [VMware Workstation 16.2.4 Player](https://customerconnect.vmware.com/downloads/details?downloadGroup=WKST-PLAYER-1624&productId=1039&rPId=91446)
* **Notes**
  * 🚀 You can import pre-configured VMs
  * ✨ The UX is better than in Virtual Box
  * 👎 Their documentation isn't helpful. If you got problems with the keyboard, or to permanently resize the screen, it may take a few minutes.
  * ➡️ in the settings
    * you can create a shared folder between Windows/your VM
</div><div>

⭐ **Oracle VirtualBox** ⭐

* **Link**: [Download VirtualBox](https://www.virtualbox.org/)
* **Notes**
    * 👎 There are always problems, like you need to go deep into the settings, in order to set a lot of values, and cross-finger while praying that they are the right ones for your machine. For instance, by default, every machine has the same IP, so you can't another one...
    * 💭 It's possible to find pre-installed VMs, but you can only import the hard-drive, so you still have to manually configure them.
    * 🥈 There are a lot of nice features, when it works that is.
    * ➡️ In the settings
      * you can enable copy-paste from the source to the VM <small>(enabled by default on VMWare)</small>
      * you can create a shared folder between Windows/your VM
</div></div>

> There is also [qemu](https://www.qemu.org/), mostly for Linux users.

<hr class="sep-both">

## Download Virtual Machines

<div class="row row-cols-md-2 mt-4"><div>

**Microsoft Edge developer center** 💻

* [Link](https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/)
* Windows 7/8/10
* **Username**: IEUser / **Password**: "Passw0rd!".
* Valid 90 days.

**Microsoft download center** 💻

* [Link](https://www.microsoft.com/en-us/download/details.aspx?id=31791) (Professional)
* [Link](https://download.cnet.com/Windows-XP-Mode/3000-18513_4-77683344.html) (Mode, it was removed from Microsoft website). There is a tutorial [here](https://helpdeskgeek.com/virtualization/how-to-set-up-a-windows-xp-virtual-machine-for-free/), another [here](https://www.makeuseof.com/tag/download-windows-xp-for-free-and-legally-straight-from-microsoft-si/), and one more [here](https://ihax.io/windows-xp-virtual-machine/).
* Windows XP

**Microsoft developer center** 💻

* [Link](https://developer.microsoft.com/en-us/windows/downloads/virtual-machines/)
* Windows 11

**Metasploit Vulnerable VM** 💣

* Internationally misconfigured virtual machine to test your skills
* [Metasploit 2](https://docs.rapid7.com/metasploit/metasploitable-2/)
* [Metasploit3](https://github.com/rapid7/metasploitable3)
* **Username**: `msfadmin`. **Password**: `msfadmin`
* The keyword layout is QWERTY. You can swap it once logged, if you need to <small>(ex: `sudo loadkeys fr`)</small>.
</div><div>

**Kali Linux** 🚀

* [Link](https://www.kali.org/get-kali/#kali-virtual-machines)
* There are giving you prebuilt image, get started in seconds!
* **Username**: kali / **Password**: kali
* Don't forget to use `sudo apt update` / `sudo apt upgrade`
* Keyboard: If you are using a non-qwerty keyword
  * First, log in
  * Click on kali icon (top left)
  * Search "Keyboard"
  * Go to the layout tab
  * Add a keyboard layout, remove the unused one
  * Now, aside from before login in, you will be able to use your keyboard
* RockYou / Wordlist
  * You may find wordlist in `/usr/share/wordlists/`
  * Run `wordlists` and press Y to extract `rockyou.txt`
  * `sudo apt install seclists` to install [SecLists](https://github.com/danielmiessler/SecLists/) wordlists.
* Notes
  * Use the right-arrow to use the suggested command
  * In the top-right corner, you can find your IP address (tun0)

**BlackArch** 😶‍🌫️

* [Link](https://www.blackarch.org/)
</div></div>

<hr class="sep-both">

## CTF Virtual Machines

<div class="row row-cols-md-2 mt-4"><div>

* ➡️ **DarkStar7471**

You can find images by DarkStar7471 Rooms on TryHackMe [here](https://darkstar7471.com/resources.html).
</div><div>

...
</div></div>