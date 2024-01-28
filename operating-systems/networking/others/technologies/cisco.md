# Cisco

<div class="row row-cols-lg-2"><div>

Cisco is company that specializes in the development of networking devices along other products. This includes:

* 🌍 Routers
* 🛣️ Switches
* 🔥 Firewalls
* ...

[![cisco_password](../../../../cybersecurity/_badges/rootme/network/cisco_password.svg)](https://www.root-me.org/en/Challenges/Network/CISCO-password)

Cisco configuration file. Only cisco type 5 is considered secure.

```shell!
username secret password 0 <plaintext_password>
username secret password 5 <md5_encrypted>
username secret password 7 <weak_encrypted>
```
</div><div>

Cisco switches and routers support [ACLs](/operating-systems/networking/security/_knowledge/index.md#access-control-lists-acls). We call standard ACLs the ones in `[1-99, 1300-1999]`, in contrast those in `[100-199, 2000-2699]` that we refer to as extended ACLs. Some commands:

```shell!
> show access-lists
> access-list 10 remark Some text here.
> access-list 10 permit 192.168.30.0 0.0.0.255 # std
> access-list 103 permit tcp 192.168.30.0 0.0.0.255 any eq 80 # extended
> access-list 103 permit tcp 192.168.30.0 0.0.0.255 any eq ftp
> access-list 101 permit tcp host 192.168.1.100 any eq www
> access-list 101 deny ip any any
> no access-list 10 # delete
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

```text!
interface <name>
    # ip access-group NO_ACCESS out
    # ip access-group 1 out
    # exit
```

[![introductiontonetworking](../../../../cybersecurity/_badges/htb/introductiontonetworking.svg)](https://academy.hackthebox.com/course/preview/introduction-to-networking)

* <s>Cisco CallManager</s> Cisco Unified Communications Manager (Unified CM), see [VoIP](/operating-systems/networking/protocols/voip.md). `SEPxxxx.cnf`
</div><div>

See the SPAN function on some Cisco switches, for traffic mirroring.

* [acl-network](https://phoenixnap.com/kb/acl-network)
* See also: LEAP/PEAP, EAP-TLS, TACACS+ (in Wi-Fi)
</div></div>