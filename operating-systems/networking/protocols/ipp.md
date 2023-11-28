# Internet Printing Protocol (IPP)

<div class="row row-cols-lg-2"><div>

The Internet Printing Protocol (IPP) is protocol to manage printers and print jobs, query printer status, and other tasks.

🐊️ **Port**: 631 (TCP)
</div><div>

Refer to the [IPP Guide](https://www.pwg.org/ipp/ippguide.html).
</div></div>

<hr class="sep-both">

## IPP vulnerabilities ☠️

[![printerhacking101](../../../cybersecurity/_badges/thm/printerhacking101.svg)](https://tryhackme.com/room/printerhacking101)

<div class="row row-cols-lg-2"><div>

👉 See the [Printer Security Testing Cheat Sheet](http://hacking-printers.net/wiki/index.php/Printer_Security_Testing_Cheat_Sheet).

You can use the [PRET](https://github.com/RUB-NDS/PRET) (3.4k ⭐) toolkit to try to exploit printers using the IPP protocol. You can install it using: 

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

➡️ You may use [PRETty](https://github.com/BusesCanFly/PRETty) (0.2k ⭐), an automation of PRET in python.
</div></div>