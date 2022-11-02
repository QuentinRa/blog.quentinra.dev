# Printers

<hr class="sl">

## Internet Printing Protocol - 631 (tcp)

[![printerhacking101](../../_badges/thm/printerhacking101.svg)](https://tryhackme.com/room/printerhacking101)

<div class="row row-cols-md-2"><div>

According to [Wikipedia](https://en.wikipedia.org/wiki/Internet_Printing_Protocol), the Internet Printing Protocol (**IPP**) is "a specialized Internet protocol for communication between client devices and printers. It allows clients to submit one or more print jobs to the printer or print server, and perform tasks such as querying the status of a printer, obtaining the status of print jobs, or cancelling individual print jobs. Like all IP-based protocols, IPP can run locally or over the Internet. Unlike other printing protocols, IPP also supports access control, authentication, and encryption, making it a much more capable and secure printing mechanism than older ones".

It usually never happens, but if such a protocol is exposed to the internet, then anyone can print stuff with it, or use it as a middle-man for attack, like various [IOT devices do](https://www.variot.eu/). If a hacker is already inside a network, then it may also be used as for attacks.

> [IPP Guide](https://www.pwg.org/ipp/ippguide.html)<br>
> [Printer Security Testing Cheat Sheet](http://hacking-printers.net/wiki/index.php/Printer_Security_Testing_Cheat_Sheet)
</div><div>


You can use [PRET](https://github.com/RUB-NDS/PRET) (3.2k ⭐).

```bash
$ git clone https://github.com/RUB-NDS/PRET && cd PRET
$ python2 -m pip install colorama pysnmP
```

Discover printers

```bash
$ python pret.py
```

Once you found a printer, you must find which language the printer understand

* `laserjet.lan ps`: Postscript
* `IP pjl`: Printer Job Language
* `/dev/usb/lp0 pcl`: Printer Command Language, Must be directly connected <small>(for instance, by USB)</small>.

```bash
$ python pret.py [options above]
xxx> help
```

> You ca, check the web interface <small>(IP:631)</small> if any.

> You may use [PRETty](https://github.com/BusesCanFly/PRETty) (194 ⭐), an automation of PRET in python.
</div></div>