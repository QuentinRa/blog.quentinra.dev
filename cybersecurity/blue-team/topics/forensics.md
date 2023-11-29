# Digital forensics

[![introdigitalforensics](../../_badges/thm/introdigitalforensics.svg)](https://tryhackme.com/room/introdigitalforensics)
[![defensivesecurityhq](../../_badges/thm/defensivesecurityhq.svg)](https://tryhackme.com/room/defensivesecurityhq)
[![adventofcyber4](../../_badges/thm/adventofcyber4/day11.svg)](https://tryhackme.com/room/adventofcyber4)

<div class="row row-cols-lg-2"><div>

Forensics is the art of investigating crimes. Digital forensics is the same, but for cyber crimes.

* 💡 Memory forensics are investigations of a memory capture of a running machine to analyze suspect behaviors. [Volatility](tools/volatility.md) is a well-known memory forensic tool.

* 🎁 [File investigation](../../purple-team/files/index.md) may help to find where a file is from...

* 🔎 ...

</div><div>

...
</div></div>

<hr class="sep-both">

## Assembly

<div class="row row-cols-lg-2"><div>

One level above binary (010010...), we have a language called assembly which is basically written in instructions specific to a set of machines (Intel, ARM...). You need to use the appropriate tool according to the kind of application.

* [radare2](https://github.com/radareorg/radare2) (17.1k ⭐): Convert binary to assembly
* `strace`: trace of a program (system calls)
* `strings`: extract readable strings in a binary
</div><div>

**.NET decompiler**

* [ILSpy](https://github.com/icsharpcode/ILSpy) (16.2k ⭐)
* [dotPeek](https://www.jetbrains.com/decompiler/) (JetBrains, paid, 🚀)

**Java decompilers**

* [Recaf](https://github.com/Col-E/Recaf) (4.3k ⭐)
* [IntelliJ](https://github.com/JetBrains/intellij-community) (JetBrains, 14.5k ⭐, 🚀)
</div></div>