# Sessions - msfconsole

[Go back](../index.md#msfconsole)

<div class="row row-cols-lg-2"><div>

Each remote shell is available through a session. 

* Go back to the msfconsole from a remote shell

```bash!
# if no meterpreter
bg
background
# if you got meterpreter
meterpreter> bg
meterpreter> background
```
</div><div>

* List sessions

```bash
msf6 exploit('module_used') > sessions
```

* Move to another session

```bash
msf6 exploit('module_used') > sessions  -i 1
```

* Kill/close a session

```bash
msf6 exploit('module_used') > sessions  -k 1
```
</div></div>