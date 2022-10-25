# Virtual Machines

<hr class="sl">

## Virtual machine emulators

<div class="row row-cols-md-2"><div>

📌 **VMWare workstation** 📌

* **Link**: [VMware Workstation 16.2.4 Player](https://customerconnect.vmware.com/downloads/details?downloadGroup=WKST-PLAYER-1624&productId=1039&rPId=91446)
* **Notes**
  * Some are sharing pre-configured machines ready to install
  * The UX is better than in Virtual Box
  * At least in the free version, there is fewer features than Virtual Box, such as to easily resize permanently the screen, and their documentation is not that good.
</div><div>

⭐ **Oracle VirtualBox** ⭐

* **Link**: [Download VirtualBox](https://www.virtualbox.org/)
* **Notes**
    * There are always problems, like you need to go deep into the settings, in order to set a lot of values, and cross-finger while praying that they are the right ones for your machine.
    * There are not "ready to sail", like if you want to create two machines, and send a ping from one to another, you can't because they have the same IP, you need to do some manual work, and that's a very bad UX.
    * There are a lot of nice features, when it works that is.
</div></div>

> There is also [qemu](https://www.qemu.org/), mostly for Linux users.

<hr class="sr">

## Find a distribution

<div class="row row-cols-md-2 mt-4"><div>

**Microsoft Edge developer center** 💻

* [Link](https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/)
* Windows 7/8/10
* **Username**: IEUser / **Password**: "Passw0rd!".
* Valid 90 days.

**Microsoft download center** 💻

* [Link](https://www.microsoft.com/en-us/download/details.aspx?id=31791) (Professional)
* [Link](https://download.cnet.com/Windows-XP-Mode/3000-18513_4-77683344.html) (Mode, it was removed from Microsoft website)
* Windows XP

**Microsoft developer center** 💻

* [Link](https://developer.microsoft.com/en-us/windows/downloads/virtual-machines/)
* Windows 11
</div><div>

**Kali Linux** ⭐

* [Link](https://www.kali.org/get-kali/#kali-virtual-machines)
* There are giving you prebuilt image, get started in seconds!
* **Username**: kali / **Password**: kali
* Don't forget to use `sudo apt update` / `sudo apt upgrade`
* You may find wordlist in `/usr/share/wordlists/`
* extract "rockyou.txt" `sudo gunzip /usr/share/wordlists/rockyou.txt.gz`
</div></div>