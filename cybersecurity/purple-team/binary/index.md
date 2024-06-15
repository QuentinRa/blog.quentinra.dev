# Binary Exploitation

<div class="row row-cols-lg-2"><div>

Binary exploitation refers to every activity dwelling into binaries, low-level code, assembly and attacks such as:

* [Integer Overflow](/cybersecurity/red-team/s3.exploitation/vulns/memory/integer_overflow.md)
* [Buffer Overflow](/cybersecurity/red-team/s3.exploitation/vulns/memory/buffer_overflow.md)
* [Format Strings](/cybersecurity/red-team/s3.exploitation/vulns/memory/format_strings.md)
* [Reverse Engineering](/cybersecurity/purple-team/reverse/index.md)
* ...

We usually use these for a dirty but quick overview:

```shell!
$ strings [...] ./some_executable # check strings
$ binwalk [...] ./some_executable # nested files in executable
```
</div><div>

A few common ways to investigate an executable:

```shell!
$ file some_executable
$ checksec --file=some_executable
$ pwn checksec some_executable
```

A few additional commands:

```shell!
$ nm ./some_executable
$ readelf [...] ./some_executable
$ objdump [...] ./some_executable
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `Program using fd? why not make fd==0 => stdin`
* pt_regs, strace/ptrace/ltrace
* binary can be stripped or not (reduce size)
* shellcodes, `0x90` (NOP) and `0xCC` (breakpoint)
* Edit program and put NOPs everywhere to skip instructions.
* `0xffffffff` is `-1` (signed, so with two complement)
</div><div>

Use After Free (UAF)

If the program uses an object that was deleted, it's possible that a hacker may manipulate the memory to take control of that object.

```
# disable ASLR
sudo echo 0 > /proc/sys/kernel/randomize_va_space
# compile 32-bit ELF binary (no DEP)
gcc xxx.c -o xxx -fno-stack-protector -z execstack -m32
gcc xxx.c -o xxx -fno-stack-protector -z execstack -m64
gcc xxx.c -o xxx -fno-stack-protector -no-pie -Wl,-z,relro,-z,now,-z,noexecstack
```
</div></div>