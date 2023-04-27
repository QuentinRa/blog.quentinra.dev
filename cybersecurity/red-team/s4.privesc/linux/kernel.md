# Kernel

[Go back](../index.md#linux-privilege-escalation-)

<div class="row row-cols-md-2"><div>

Kernel exploits should be used as the **last resort**, as they will most probably severely impact the machine state, or even crash the machine if they fail. You can find the complete list of CVEs for the Linux Kernel [here](https://www.linuxkernelcves.com/cves).

* [Dirty COW](https://en.wikipedia.org/wiki/Dirty_COW) on Linux kernel <4.8.3
</div><div>

There are scripts to find vulnerable kernels, but they may generate false positives or false negatives.

* [linux-exploit-suggester](https://github.com/mzet-/linux-exploit-suggester) (3.9k ⭐): still updated with new exploits
* [Linux_Exploit_Suggester](https://github.com/InteliSecureLabs/Linux_Exploit_Suggester) (1.6k ⭐): up to 4.x excluded
* [Linux Kernel Exploit Suggester 2](https://github.com/jondonas/linux-exploit-suggester-2) (1.4k ⭐): up to 5.x excluded
</div></div>