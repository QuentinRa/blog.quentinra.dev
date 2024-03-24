# pwntools

<div class="row row-cols-lg-2"><div>

...
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

```py
# pip install pwntools
from pwn import *

ssh = ssh("xxx", "yyy", 22, password="zzz")

def send_payload(payload):
    p = ssh.process(["/path/to/my_binary", payload], "/path/to/my_binary")
    return p.recvall()

print(FmtStr(execute_fmt=send_payload).offset)
# [*] Found format string offset: XXX
# fmtstr_payload(X, {elf.got.exit: elf.sym.win}, numbwritten=0)
```
</div><div>

```py
target = remote("host", port)
target = process("./xxx.bin")
gdb.attach(target)
target.send(x)
target.sendline(x)
target.recvline()
target.recvuntil("out")
target.interactive()
```

* `p64(x)`, `u64(x)`
* `p32(x)`, `u32(x)`
</div></div>