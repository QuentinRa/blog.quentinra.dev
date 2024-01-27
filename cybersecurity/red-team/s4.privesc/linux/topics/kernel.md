# Kernel

[![linprivesc](../../../../_badges/thm/linprivesc.svg)](https://tryhackme.com/room/linprivesc)
[![linuxprivesc](../../../../_badges/thm/linuxprivesc.svg)](https://tryhackme.com/room/linuxprivesc)
[![linuxprivilegeescalation](../../../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![overlayfs](../../../../_badges/thm-p/overlayfs.svg)](https://tryhackme.com/room/overlayfs)

<div class="row row-cols-lg-2"><div>

Kernel exploits should be used as the **last resort**, as they will most probably severely impact the machine state, or even crash the machine if they fail.

You can find the complete list of CVEs for the Linux Kernel [here](https://www.linuxkernelcves.com/cves).

* [Dirty Pipe](https://github.com/AlexisAhmed/CVE-2022-0847-DirtyPipe-Exploits) on Linux Kernel >5.8 and <5.17
* [Dirty COW](https://en.wikipedia.org/wiki/Dirty_COW) on Linux kernel <4.8.3
* [CVE-2021-3493/OverlayFS](https://en.wikipedia.org/wiki/OverlayFS) mostly on Ubuntu kernels prior to Ubuntu 20.10. See [ssd-disclosure PoC](https://ssd-disclosure.com/ssd-advisory-overlayfs-pe/).
</div><div>

There are scripts to find vulnerable kernels, but they may generate false positives or false negatives.

* [linux-exploit-suggester](https://github.com/mzet-/linux-exploit-suggester) (3.9k ⭐): still updated with new exploits
* [Linux_Exploit_Suggester](https://github.com/InteliSecureLabs/Linux_Exploit_Suggester) (1.6k ⭐): up to 4.x excluded
* [Linux Kernel Exploit Suggester 2](https://github.com/jondonas/linux-exploit-suggester-2) (1.4k ⭐): up to 5.x excluded
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Netfilter kernel module
</div><div>
</div></div>