# Configure an exploit - msfconsole

[Go back](../index.md#msfconsole)

<div class="row row-cols-lg-2"><div>

#### ✨️ Set the options

You can list options using:

```bash!
msf6 exploit('module_used')> options
msf6 exploit('module_used')> show options # same
```

You must at least give a value to options marked as required.

```bash!
msf6 exploit('module_used')> set <option> <value>
# example with RHOSTS
msf6 exploit('module_used')> set RHOSTS target_ip
```

Some options that you will often see are:

* `set LHOST IP`: your IP
* `set RHOSTS IP`: your target IP
* `set RPORT PORT`: your port

⚠️ If you are using a VPN, such as on TryHackMe, you will use your VPN interface, otherwise you will see a message `"[...] exploit succeeded but no session was created [...]"` for reverse shells, because the target can't reach you.

```bash!
msf6 exploit('module_used')> set LHOST tun0
```
</div><div>

#### ✨️ Set the target (optional)

For some exploits, you can use different targets. If you can see at the bottom of the options a mention of a target, then that's your case.

```bash!
msf6 [...]> show targets # list targets that you can use
msf6 [...]> set target 2 # use target 2
```

#### ✨️ Set the payload (optional)

Some exploits come with a pre-defined payload, but for most, you will have to pick your payload. 🔎 For most easy CTFs, using the default payload is good enough.

```bash!
msf6 [...]> show payloads
msf6 [...]> set payload 1
msf6 [...]> set payload payload_name
```
</div></div>

<hr class="sep-both">

## Other less commonly used

<div class="row row-cols-lg-2"><div>

#### ✨️ setg

You can set variable globally. You will most likely enjoy this feature, because you will usually go back and forth between modules, and you don't want to set the same options again and again.

```bash!
msf6 exploit('module_used')> setg LHOST tun0
msf6 exploit('module_used')> setg RHOSTS x.x.x.x
```
</div><div>

#### ✨️ unset

You can unset variables, which will give them back their default value

```bash!
msf6 exploit('module_used')> unset RHOSTS
msf6 exploit('module_used')> unset all
```
</div></div>