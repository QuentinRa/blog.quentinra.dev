# Cisco

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

ACLs (std <small>(1-99, 1300-1999)</small>, extended <small>(100-199, 2000-2699)</small>, can be a string)

```text!
access-list 10 remark Some text here.
access-list 10 permit 192.168.30.0 0.0.0.255 # std
# source dest port
access-list 103 permit tcp 192.168.30.0 0.0.0.255 any eq 80 # extended
access-list 103 permit tcp 192.168.30.0 0.0.0.255 any eq ftp
access-list 101 permit tcp host 192.168.1.100 any eq www
access-list 101 deny ip any any
no access-list 10 # delete

show access-lists

interface <name>
    # ip access-group NO_ACCESS out
    # ip access-group 1 out
    # exit
```
</div><div>

See the SPAN function on some Cisco switches, for traffic mirroring.

* [acl-network](https://phoenixnap.com/kb/acl-network)
* See also: LEAP/PEAP, EAP-TLS, TACACS+ (in Wi-Fi)
</div></div>